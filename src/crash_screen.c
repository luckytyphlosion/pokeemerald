#include "global.h"
#include "text.h"
#include "main.h"
#include "crash_screen.h"
#include "gpu_regs.h"
#include "m4a.h"
#include "task.h"
#include "battle.h"
#include "sprite.h"
#include "script.h"

#include <stdarg.h>

#include "data/crash_screen.h"

enum {
    CRASH_SCREEN_DECIMAL_NORMAL,
    CRASH_SCREEN_DECIMAL_LEADING_ZEROS,
    CRASH_SCREEN_DECIMAL_LEADING_SPACES
};

#define KEY_INPUT_NONE_PRESSED 0
#define KEY_INPUT_COMBO_PRESSED 1
#define KEY_INPUT_COMBO_RELEASED 2

struct CrashScreenSavedRegs
{
    u16 soundCntL;
    u16 ime;
    u16 ie;
    u16 dma0CntH;
    u16 dma1CntH;
    u16 dma2CntH;
    u16 dma3CntH;
    u16 dispCnt;
    u16 bg0Cnt;
};

static u16 * CrashScreen_PrintString(u16 * dest, const char * src);
static u16 * CrashScreen_PrintCharacter(u16 * dest, char curChar);
static u16 * CrashScreen_PrintU32HexNumber(u16 * dest, u32 value, u32 numDigits);
static u16 * CrashScreen_PrintU32DecimalNumber(u16 * dest, u32 value, u32 numDigits, u32 mode);

extern void CrashScreenIntrHandler(void);

EWRAM_DATA u8 gCrashScreenReturnPtrStackSize = 0;
EWRAM_DATA u16 gCrashScreenNumCalls = 0;
EWRAM_DATA void * gCrashScreenReturnPtrs[MAX_CRASH_SCREEN_RETURN_PTRS + 1] = {0};

static inline u16 * CrashScreen_PrintNewline(u16 * dest)
{
    return (u16 *)((((u32)dest) & (~0x3f)) + 0x40);
}

static inline u16 * CrashScreen_FixDestIfOffScreen(u16 * dest)
{
    if ((((u32)dest) & 0x3f) >= 0x3c) {
        return CrashScreen_PrintNewline(dest);
    } else {
        return dest;
    }
}

static inline u16 * CrashScreen_PrintCharacter(u16 * dest, char curChar)
{
    switch (curChar) {
    case '\n':
        dest = CrashScreen_PrintNewline(dest);
        break;
    default:
        dest = CrashScreen_FixDestIfOffScreen(dest);
        *dest = sASCIIToGen2CharacterTranslationMap[curChar];
        dest++;
        break;
    }

    return dest;
}

static u16 * CrashScreen_PrintString(u16 * dest, const char * src)
{
    u8 curChar;

    while ((curChar = *src++) != '\0') {
        dest = CrashScreen_PrintCharacter(dest, curChar);
    }

    return dest;
}

static u16 * CrashScreen_ClearLines(u16 * dest, u32 numLines)
{
    u32 i, j;

    for (i = 0; i < numLines; i++) {
        for (j = 0; j < 30; j++) {
            dest = CrashScreen_PrintCharacter(dest, ' ');
        }
        dest = CrashScreen_PrintNewline(dest);
    }

    return dest;
}

static u16 * CrashScreen_PrintU32HexNumber(u16 * dest, u32 value, u32 numDigits)
{
    u32 shiftAmount;
    bool32 printUnconditionally;
    u32 outOfRangeOffset;

    if (numDigits != 0) {
        printUnconditionally = TRUE;
        shiftAmount = numDigits * 4;
        if ((value >> shiftAmount) != 0) {
            outOfRangeOffset = 0x10;
        } else {
            outOfRangeOffset = 0;
        }
    } else {
        printUnconditionally = FALSE;
        shiftAmount = 32;
        outOfRangeOffset = 0;
    }

    do {
        u32 digitValue;

        shiftAmount -= 4;
        digitValue = (value >> shiftAmount) & 0xf;

        if (digitValue != 0 || shiftAmount == 0) {
            printUnconditionally = TRUE;
        }

        if (printUnconditionally) {
            dest = CrashScreen_FixDestIfOffScreen(dest);
            *dest = sDigitToGen2Character[digitValue + outOfRangeOffset];
            dest++;
            outOfRangeOffset = 0;
        }
    } while (shiftAmount > 0);

    return dest;
}

// want to avoid using external functions
// so just make custom divmod function for this case
extern u64 DivMod10(u32 value);

static u16 * CrashScreen_PrintU32DecimalNumber(u16 * dest, u32 value, u32 numDigits, u32 mode)
{
    u16 * startDest;
    u16 * curDest;
    u32 padChar;
    s32 increment;

    startDest = dest;

    if (mode >= CRASH_SCREEN_DECIMAL_LEADING_ZEROS) {
        dest += numDigits;
        curDest = dest - 1;
        increment = -1;
    } else {
        curDest = dest;
        increment = 1;
    }

    do {
        u64 result;
        u32 remainder;
    
        result = DivMod10(value);
        value = (u32)result;
        remainder = (u32)(result >> 32);

        *curDest = sDigitToGen2Character[remainder];
        curDest += increment;
    } while (value > 0);
    
    if (mode >= CRASH_SCREEN_DECIMAL_LEADING_ZEROS) {
        u32 padChar;

        if (mode == CRASH_SCREEN_DECIMAL_LEADING_ZEROS) {
            padChar = CRASH_SCREEN_CHAR_0;
        } else {
            padChar = CRASH_SCREEN_CHAR_SPACE;
        }

        while (curDest >= startDest) {
            *curDest = padChar;
            curDest--;
        }
    } else {
        dest = curDest;
        while (startDest < curDest) {
            u32 temp;
            
            temp = *--curDest;
            *curDest = *startDest;
            *startDest++ = temp;
        }
    }

    return dest;
}

static u16 * CrashScreen_PrintCallStack(u16 * dest)
{
    u32 numReturnPtrs;
    s32 i;

    numReturnPtrs = gCrashScreenReturnPtrStackSize;

    for (i = numReturnPtrs; i >= 0; i--) {
        u32 returnPtr = (u32)gCrashScreenReturnPtrs[i];
        dest = CrashScreen_PrintU32HexNumber(dest, returnPtr, 7);
        if (((numReturnPtrs - i) & 0x3) < 2) {
            dest = CrashScreen_PrintCharacter(dest, ' ');
        }
    }

    return dest;
}

// these functions dump out various information
// which I used for displaying as much information as possible
// in case of bad egg corruption
// You can use them if you want
static u16 * CrashScreen_PrintSpriteTemplatesAndCallbacks(u16 * dest, u32 startIndex, u32 endIndex)
{
    struct Sprite * spritesCur;
    struct Sprite * spritesEnd;

    spritesCur = &gSprites[startIndex];
    spritesEnd = &gSprites[endIndex];

    do {        
        if (spritesCur->inUse) {
            dest = CrashScreen_PrintCharacter(dest, 'Y');
        } else {
            dest = CrashScreen_PrintCharacter(dest, 'N');
        }

        dest = CrashScreen_PrintU32HexNumber(dest, (u32)spritesCur->template, 7);
        dest = CrashScreen_PrintU32HexNumber(dest, (u32)spritesCur->callback, 7);
        dest = CrashScreen_PrintU32HexNumber(dest, (u32)spritesCur->images, 7);

        spritesCur++;
    } while (spritesCur < spritesEnd);

    return dest;
}

static u16 * CrashScreen_PrintTasks(u16 * dest)
{
    struct Task * taskCur = &gTasks[0];
    struct Task * taskEnd = &gTasks[NUM_TASKS];

    do {
        if (taskCur->isActive) {
            dest = CrashScreen_PrintCharacter(dest, 'Y');
        } else {
            dest = CrashScreen_PrintCharacter(dest, 'N');
        }
        dest = CrashScreen_PrintU32HexNumber(dest, (u32)taskCur->func, 7);
    } while (++taskCur < taskEnd);

    return dest;
}

#define CRASH_SCREEN_BAD_EGG_SCAN_PTRS 0
#define CRASH_SCREEN_BAD_EGG_SCAN_SPRITES_1 1
#define CRASH_SCREEN_BAD_EGG_SCAN_SPRITES_2 2
#define CRASH_SCREEN_BAD_EGG_SCAN_SPRITES_3 3
#define CRASH_SCREEN_BAD_EGG_SCAN_TASKS 4

static void CrashScreen_BadEggScanInputLoop(void)
{
    u32 state;
    bool32 isInitial = TRUE;
    u16 * dest;

    state = CRASH_SCREEN_BAD_EGG_SCAN_PTRS;

    while (TRUE) {
        u32 keyInputState;
        keyInputState = KEY_INPUT_NONE_PRESSED;

        while (TRUE) {
            u16 keyInput;

            VBlankIntrWait();
            keyInput = REG_KEYINPUT ^ KEYS_MASK;

            if (!isInitial && (state == CRASH_SCREEN_BAD_EGG_SCAN_PTRS) && (keyInput & (A_BUTTON | B_BUTTON | DPAD_DOWN)) == (A_BUTTON | B_BUTTON | DPAD_DOWN)) {
                dest = (u16 *)(VRAM + 0x4000);
                CrashScreen_ClearLines(dest, 20);
                return;
            }

            switch (keyInputState) {
            case KEY_INPUT_NONE_PRESSED:
                if (keyInput == 0) {
                    keyInputState = KEY_INPUT_COMBO_PRESSED;
                }
                break;
            case KEY_INPUT_COMBO_PRESSED:
                if (keyInput & SELECT_BUTTON) {
                    goto label_exit_key_loop;
                }
                break;
            }
        }

label_exit_key_loop:
        isInitial = FALSE;

        dest = (u16 *)(VRAM + 0x4000);
        CrashScreen_ClearLines(dest, 20);

        switch (state) {
        case CRASH_SCREEN_BAD_EGG_SCAN_PTRS:
            dest = CrashScreen_PrintString(dest, "PTRS:");
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)sGlobalScriptContext.nativePtr, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)sGlobalScriptContext.scriptPtr, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)sImmediateScriptContext.nativePtr, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)sImmediateScriptContext.scriptPtr, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)gBattlescriptCurrInstr, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)gMain.callback1, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)gMain.callback2, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)gMain.savedCallback, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)gMain.vblankCallback, 7);
            dest = CrashScreen_PrintU32HexNumber(dest, (u32)gMain.hblankCallback, 7);
            state++;
            break;
        case CRASH_SCREEN_BAD_EGG_SCAN_SPRITES_1:
            dest = CrashScreen_PrintString(dest, "SPR1:");
            dest = CrashScreen_PrintSpriteTemplatesAndCallbacks(dest, 0, 21);
            state++;
            break;
        case CRASH_SCREEN_BAD_EGG_SCAN_SPRITES_2:
            dest = CrashScreen_PrintString(dest, "SPR2:");
            dest = CrashScreen_PrintSpriteTemplatesAndCallbacks(dest, 21, 42);
            state++;
            break;
        case CRASH_SCREEN_BAD_EGG_SCAN_SPRITES_3:
            dest = CrashScreen_PrintString(dest, "SPR3:");
            dest = CrashScreen_PrintSpriteTemplatesAndCallbacks(dest, 42, 64);
            state++;
            break;
        case CRASH_SCREEN_BAD_EGG_SCAN_TASKS:
            dest = CrashScreen_PrintString(dest, "TASK:");
            dest = CrashScreen_PrintTasks(dest);
            dest = CrashScreen_PrintNewline(dest);
            dest = CrashScreen_PrintString(dest,
                "PRESS A, B, AND DOWN TO EXIT,\n"
                "PRESS SELECT TO REPEAT INFO."
            );
            state = CRASH_SCREEN_BAD_EGG_SCAN_PTRS;
            break;
        }
    }
}

#define NUM_CRASH_SCREEN_TILESET_TILES 45
#define CRASH_SCREEN_TILESET_SIZE (NUM_CRASH_SCREEN_TILESET_TILES * TILE_SIZE_4BPP)
#define CRASH_SCREEN_TILEMAP_SIZE (32 * DISPLAY_TILE_HEIGHT * 2)

void CrashScreen(u32 type, const char * fmt, ...)
{
    va_list args;

    void * returnPtr;
    struct CrashScreenSavedRegs savedRegs;
    // sucks to suck if this overflows the stack
    // you could also allocate an entirely separate buffer
    u32 savedTilemap[CRASH_SCREEN_TILEMAP_SIZE/4];
    u32 savedTiles[CRASH_SCREEN_TILESET_SIZE/4];
    u32 savedPalette0;
    void * oldIntrVector;
    u16 * dest;
    u32 keyInputState;
    u32 buttonCombo;

    asm("mov %0, lr" : "=r"(returnPtr));

    if (gCrashScreenReturnPtrStackSize >= MAX_CRASH_SCREEN_RETURN_PTRS) {
        gCrashScreenReturnPtrStackSize = MAX_CRASH_SCREEN_RETURN_PTRS;
    }
    gCrashScreenReturnPtrs[gCrashScreenReturnPtrStackSize] = returnPtr;

    savedRegs.ime = REG_IME;
    savedRegs.ie = REG_IE;

    // disable all interrupts
    REG_IME = 0;
    REG_IE = 0;

    // save old IO regs
    savedRegs.soundCntL = REG_SOUNDCNT_L;
    savedRegs.dma0CntH = REG_DMA0CNT_H;
    savedRegs.dma1CntH = REG_DMA1CNT_H;
    savedRegs.dma2CntH = REG_DMA2CNT_H;
    savedRegs.dma3CntH = REG_DMA3CNT_H;

    savedRegs.dispCnt = REG_DISPCNT;
    savedRegs.bg0Cnt = REG_BG0CNT;

    // save old graphics
    // if you use a custom swi copy function, these should be changed to use the bios function
    CpuFastCopy((void *)(VRAM + 0x4000), &savedTilemap, CRASH_SCREEN_TILEMAP_SIZE);
    CpuFastCopy((void *)VRAM, &savedTiles, CRASH_SCREEN_TILESET_SIZE);
    savedPalette0 = *(u32 *)PLTT;

    // save old intr vector
    oldIntrVector = INTR_VECTOR;

    // mute music
    REG_SOUNDCNT_L = 0;

    // disable DMAs
    REG_DMA0CNT_H = 0;
    REG_DMA1CNT_H = 0;
    REG_DMA2CNT_H = 0;
    REG_DMA3CNT_H = 0;

    REG_DISPCNT = 0;
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(8) | BGCNT_TXT256x256;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    // clear tilemap
    CpuFastFill16(CRASH_SCREEN_CHAR_SPACE, (void *)(VRAM + 0x4000), CRASH_SCREEN_TILEMAP_SIZE);

    // load tiles
    LZ77UnCompVram(sCrashScreenFontGfx, (void *)VRAM);
    // write palette
    *(u32 *)PLTT = 0x00007fff;

    va_start(args, fmt);

    switch (type) {
    case CRASH_SCREEN_UNKNOWN:
        fmt = "AN UNKNOWN CRASH HAS OCCURRED.";
        break;
    }

    dest = (u16 *)(VRAM + 0x4000);

    while (*fmt) {
        char curChar;

        curChar = *fmt++;
        if (curChar == '%') {
            u32 printNumMode = CRASH_SCREEN_DECIMAL_NORMAL;
            u32 numDigits = 0;
            u32 value;
            curChar = *fmt++;
            if (curChar == 's') {
                const char * argStr;
                argStr = va_arg(args, const char *);
                dest = CrashScreen_PrintString(dest, argStr);
            } else {
                if (curChar == '0') {
                    printNumMode = CRASH_SCREEN_DECIMAL_LEADING_ZEROS;
                    curChar = *fmt++;
                }
                if (curChar >= '1' && curChar <= '9') {
                    if (printNumMode == CRASH_SCREEN_DECIMAL_NORMAL) {
                        printNumMode = CRASH_SCREEN_DECIMAL_LEADING_SPACES;
                    }
                    numDigits = curChar - '0';
                    curChar = *fmt++;
                }
                
                value = va_arg(args, u32);
                if (curChar == 'd') {
                    dest = CrashScreen_PrintU32DecimalNumber(dest, value, numDigits, printNumMode);
                } else if (curChar == 'x') {
                    dest = CrashScreen_PrintU32HexNumber(dest, value, numDigits);
                } else {
                    dest = CrashScreen_PrintString(dest, "ENAN");
                }
            }
        } else {
            dest = CrashScreen_PrintCharacter(dest, curChar);
        }
    }

    if (type == CRASH_BAD_EGG_SCAN) {
        INTR_VECTOR = CrashScreenIntrHandler;
        REG_IE = INTR_FLAG_VBLANK;
        REG_IME = 1;
        REG_DISPCNT = DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;
        CrashScreen_BadEggScanInputLoop();
        dest = (u16 *)(VRAM + 0x4000);
    }

    dest = CrashScreen_PrintString(dest, "\nVERSION: ");
    dest = CrashScreen_PrintU32DecimalNumber(dest, ROM_VERSION, 0, CRASH_SCREEN_DECIMAL_NORMAL);

    dest = CrashScreen_PrintNewline(dest);
    dest = CrashScreen_PrintString(dest, "NUM CRASHES: ");
    if (gCrashScreenNumCalls < 65536) {
        gCrashScreenNumCalls++;
    }
    dest = CrashScreen_PrintU32DecimalNumber(dest, gCrashScreenNumCalls, 0, CRASH_SCREEN_DECIMAL_NORMAL);
    dest = CrashScreen_PrintString(dest, ", CALLSTACK:\n");
    dest = CrashScreen_PrintCallStack(dest);

    dest = (u16 *)(VRAM + 0x4400);

    // you can write a custom message here
    dest = CrashScreen_PrintString(dest, 
        "PLEASE REPORT THIS TO THE DEVS\n"
        "AT (LINK PENDING)\n"
    );

    REG_DISPCNT = DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;

    dest = CrashScreen_PrintString(dest,
        "PRESS B AND SELECT TO RESUME\n"
        "(MAY CRASH)"
    );
    buttonCombo = (B_BUTTON | SELECT_BUTTON);

    va_end(args);

    INTR_VECTOR = CrashScreenIntrHandler;
    REG_IE = INTR_FLAG_VBLANK;
    REG_IME = 1;

    keyInputState = KEY_INPUT_NONE_PRESSED;
    while (TRUE) {
        u16 keyInput;

        VBlankIntrWait();
        keyInput = REG_KEYINPUT ^ KEYS_MASK;
        switch (keyInputState) {
        case KEY_INPUT_NONE_PRESSED:
            if ((keyInput & buttonCombo) != buttonCombo) {
                keyInputState = KEY_INPUT_COMBO_PRESSED;
            }
            break;
        case KEY_INPUT_COMBO_PRESSED:
            if ((keyInput & buttonCombo) == buttonCombo) {
                keyInputState = KEY_INPUT_COMBO_RELEASED;
            }
            break;
        case KEY_INPUT_COMBO_RELEASED:
            if ((keyInput & buttonCombo) != buttonCombo) {
                goto label_input_successful;
            }
            break;
        }
    }

label_input_successful:
    REG_IME = 0;
    REG_IE = 1;
    REG_DISPCNT = 0;

    // restore old intr vector
    INTR_VECTOR = oldIntrVector;

    // restore old graphics
    *(u32 *)PLTT = savedPalette0;
    CpuFastCopy(&savedTilemap, (void *)(VRAM + 0x4000), CRASH_SCREEN_TILEMAP_SIZE);
    CpuFastCopy(&savedTiles, (void *)VRAM, CRASH_SCREEN_TILESET_SIZE);

    // restore old IO regs
    REG_DISPCNT = savedRegs.dispCnt;
    REG_BG0CNT = savedRegs.bg0Cnt;
    REG_BG0HOFS = GetGpuReg(REG_OFFSET_BG0HOFS);
    REG_BG0VOFS = GetGpuReg(REG_OFFSET_BG0VOFS);

    REG_SOUNDCNT_L = savedRegs.soundCntL;
    REG_DMA0CNT_H = savedRegs.dma0CntH;
    REG_DMA1CNT_H = savedRegs.dma1CntH;
    REG_DMA2CNT_H = savedRegs.dma2CntH;
    REG_DMA3CNT_H = savedRegs.dma3CntH;

    REG_IF = 0;

    // restore old IME/IE
    REG_IME = savedRegs.ime;
    REG_IE = savedRegs.ie;

}
