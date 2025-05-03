	.include "asm/macros.inc"
	.include "constants/gba_constants.inc"
	.include "constants/m4a_constants.inc"

	.syntax unified

	.text

/*
u64 DivMod10(u32 a)
{
    u32 quotient;
    u32 remainder;

    quotient = a / 10;
    remainder = a % 10;

    return quotient | ((u64)remainder) << 32;
}
*/

	thumb_func_start DivMod10
DivMod10:
	bx pc

	.arm
	.align 2, 0
DivMod10_arm:
	mov r1, r0
	ldr r3, .L203
	umull r2, r3, r0, r3
	lsr r0, r3, #3
	add r3, r0, r0, lsl #2
	sub r1, r1, r3, lsl #1
	bx lr
.L203:
	.word -858993459
	thumb_func_end DivMod10

	thumb_func_start DivMod30
DivMod30:
	bx pc

	.arm
	.align 2, 0
DivMod30_arm:
	mov r1, r0
	ldr r3, .L142
	umull r2, r3, r0, r3
	bic r2, r3, #15
	sub r2, r2, r3, lsr #4
	lsr r0, r3, #4
	sub r1, r1, r2, lsl #1
	bx lr
.L142:
	.word -2004318071
	thumb_func_end DivMod30

	arm_func_start CrashScreenIntrHandler
CrashScreenIntrHandler:
	mov r1, #REG_BASE
	add r1, r1, #OFFSET_REG_IE
	ldrh r0, [r1, #OFFSET_REG_IF - OFFSET_REG_IE]
	tst r0, #INTR_FLAG_GAMEPAK
	bne . // spin
	// don't care about anything but vblank
	ands r0, r0, #INTR_FLAG_VBLANK
	bxeq lr
	strh r0, [r1, #OFFSET_REG_IF - OFFSET_REG_IE]
	ldr r0, =INTR_CHECK
	ldr r1, [r0]
	orr r1, r1, #INTR_FLAG_VBLANK
	str r1, [r0]
	bx lr
	.pool
	arm_func_end CrashScreenIntrHandler
