#ifndef GUARD_CRASH_SCREEN_H
#define GUARD_CRASH_SCREEN_H

void CrashScreen(u32 type, const char * fmt, ...);

#define CRASH_GENERIC 0
#define CRASH_BAD_EGG_SCAN 1
#define CRASH_SCREEN_UNKNOWN 0xffffffff

#define MAX_CRASH_SCREEN_RETURN_PTRS 24

extern u8 gCrashScreenReturnPtrStackSize;
extern u16 gCrashScreenNumCalls;
extern void * gCrashScreenReturnPtrs[MAX_CRASH_SCREEN_RETURN_PTRS + 1];

extern const char gCrashScreenText_RanOutOfCrashScreenReturnPtrs[];
extern const char gCrashScreenText_ImbalancedCrashScreenReturnPtrs[];

// MUST BE CALLED AT THE START OF THE FUNCTION
// CANNOT EVEN DO SOMETHING LIKE
/*
void MyFunction(void)
{
    u32 var = CalculateVar();

    PushCrashScreenReturnPtr();
    // ... (rest of code)
}
*/
// BECAUSE lr (return pointer) GETS CLOBBERED

static inline void PushCrashScreenReturnPtr(void)
{
    void * returnPtr;

    asm("mov %0, lr" : "=r"(returnPtr));

    if (gCrashScreenReturnPtrStackSize >= MAX_CRASH_SCREEN_RETURN_PTRS) {
        gCrashScreenReturnPtrStackSize = MAX_CRASH_SCREEN_RETURN_PTRS - 1;
        gCrashScreenReturnPtrs[gCrashScreenReturnPtrStackSize] = returnPtr;
        CrashScreen(0,
            gCrashScreenText_RanOutOfCrashScreenReturnPtrs
        );
    } else {
        gCrashScreenReturnPtrs[gCrashScreenReturnPtrStackSize++] = returnPtr;
    }
}

// MUST BE CALLED AT THE END OF THE FUNCTION
static inline void PopCrashScreenReturnPtr(void)
{
    if (gCrashScreenReturnPtrStackSize == 0) {
        CrashScreen(0,
            gCrashScreenText_ImbalancedCrashScreenReturnPtrs
        );
    } else {
        gCrashScreenReturnPtrStackSize--;
    }
}

#endif // GUARD_CRASH_SCREEN_H