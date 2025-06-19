	.include "constants/gba_constants.inc"
	.include "asm/macros/function.inc"

	.text
	.syntax unified

	arm_func_start DecompressSpriteFrameImage
// r0 - src
// r1 - dest
// r2 - frame num
DecompressSpriteFrameImage:
	push {r4-r11,lr}
	// double r2 in advance
	// if size is 16x32, this saves 1 cycle
	// since need to double it outside of ldrh since not possible
	// and then don't need to use a shift extension on the * 6
	lsl lr, r2, #1
	ldr r3, [r0], #4 // read header
	mov r12, #0xff
	and r4, r3, #0xff // get num uncompressed tiles
	and r5, r12, r3, lsr #8 // get num compressed tiles
	lsr r6, r3, #24 // get number of frames
	lsls r3, r3, #15 // shift sprite size into negative and carry

	// 16x16 - 00
	// 16x32 - 01
	// 32x32 - 10
	// 64x64 - 11
	bcc DecompressSpriteFrameImage_16x16_or_16x32
	// either 32x32 (10) or 64x64 (11)
	bmi DecompressSpriteFrameImage_64x64

// currently
// r0 - src
// r1 - dest
// r2 - frame num
// r3 - free
// r4 - num uncompressed tiles
// r5 - num compressed tiles
// r6 - number of frames
// r7-r12 - free
// lr - frame num * 2

// r0 will become reusableTileOffsets

DecompressSpriteFrameImage_32x32:
	ldr r3, [r0, r2, lsl #2]
	add r0, r0, r6, lsl #2 // advance src pointer
	mov r7, #15 // number of tiles per inner iteration, minus 1 (equivalent to # of tiles per frame)

	// dynamic opcode for checking side
	ldr r8, DecompressSpriteFrameImage_SideCheckOpcodeWidth4
	b DecompressSpriteFrameImage_Non64x64_GotParams

DecompressSpriteFrameImage_64x64:
	// for 64x64, each bitfield is 16 bytes
	add r8, r0, r2, lsl #4
	// read four words at once, first bitfield stored in r3
	ldm r8, {r3,r9,r10,r11}
	// advance src pointer
	add r0, r0, r6, lsl #4
	// outer count for later	
	mov r7, #0
	// count and remaining 3 bitfields
	push {r7,r9,r10,r11}
	// number of tiles per inner iteration, minus 1
	mov r7, #15
	// dynamic opcode for checking side
	ldr r8, DecompressSpriteFrameImage_SideCheckOpcodeWidth8
	b DecompressSpriteFrameImage_64x64_GotParams

DecompressSpriteFrameImage_16x16:
	ldrb r3, [r0, r2] // read frame bitfield
	lsl r3, r3, #24 // shift forward for fast branching
	add r0, r0, r6 // advance src pointer
	mov r7, #3 // number of tiles per inner iteration, minus 1 (equivalent to # of tiles per frame)
	// dynamic opcode for checking side
	ldr r8, DecompressSpriteFrameImage_SideCheckOpcodeWidth2
	b DecompressSpriteFrameImage_Non64x64_GotParams

DecompressSpriteFrameImage_16x16_or_16x32:
	// either 16x16 (00) or 16x32 (01)
	bpl DecompressSpriteFrameImage_16x16

// fallthrough
DecompressSpriteFrameImage_16x32:
	ldrh r3, [r0, lr] // read frame bitfield (halfword)
	lsl r3, r3, #16 // shift forward for fast branching
	add r0, r0, r6, lsl #1 // advance src pointer
	mov r7, #7 // number of tiles per inner iteration, minus 1 (equivalent to # of tiles per frame)
	// dynamic opcode for checking side
	ldr r8, DecompressSpriteFrameImage_SideCheckOpcodeWidth2

DecompressSpriteFrameImage_Non64x64_GotParams:
	// outer count for later
	push {r7}

// r2 is now free, only need to use it to calc frame offsets ptr for current frame
// and we have that in lr (r2 * 2)
DecompressSpriteFrameImage_64x64_GotParams:
	adr r12, DecompressSpriteFrameImage_IsReusableTileCompressedSubOpcode
	// write num compressed tiles dynamically, this saves a register
	strb r5, [r12]
	// write the dynamic opcode
	str r8, [r12, #DecompressSpriteFrameImage_SideCheckOpcode - DecompressSpriteFrameImage_IsReusableTileCompressedSubOpcode]

	// r0 is now reusable tile offsets
	// need to skip ahead
	rsbs r12, r0, #4
	lsls r12, r12, #31
	addcs r0, r0, #2
	addmi r0, r0, #1

// currently
// r0 - reusable tile offsets
// r1 - dest
// r2 - free
// r3 - initial frame bitfield
// r4 - num uncompressed tiles
// r5 - num compressed tiles
// r6 - num frames
// r7 - inner count
// r8-r12 - free
// lr - frame num * 2

	// r2 will become uncompressed tile data
	add r2, r0, r5, lsl #2
	// r4 will become frame offsets table
	add r4, r2, r4, lsl #5
	// r8 will become frame offsets ptr (for current frame)
	add r8, lr, lr, lsl #1
	add r8, r4, r8
	// r4 will now become reusable tile data
	// multiply num frames by 3
	add r6, r6, r6, lsl #1
	// then multiply by 2 and add to r4
	add r4, r4, r6, lsl #1
	// align to nearest word
	lsrs r6, r4, #2
	addcs r4, r4, #2

// currently
// r0 - reusable tile offsets
// r1 - dest
// r2 - uncompressed tile data
// r3 - initial frame bitfield
// r4 - reusable tile data
// r5 - free
// r6 - free
// r7 - inner count
// r8 - frame offsets ptr
// r9-r12,lr - free

	// read word offset
	ldrh r6, [r8, #4]
	// r6 - word address
	add r6, r4, r6, lsl #2
	// possibly: halfword offset goes off of word address, and then byte offset goes off of halfword offset?
	// ordering like this so that can be done
	// read halfword offset
	ldrh r5, [r8, #2]
	add r5, r4, r5, lsl #1

	// read byte offset
	ldrh r8, [r8]
	add r8, r4, r8

	// dma enable 	
	// initialize count in advance, so don't need to spend multiple cycles generating the cnt value
	// abuse address to save a cycle
	// we write 8 words at a time
	mov r9, #REG_BASE
	mov r12, #8
	strh r12, [r9, #OFFSET_REG_DMA3CNT_L]

// currently
// r0 - reusable tile offsets
// r1 - dest
// r2 - uncompressed tile data
// r3 - initial frame bitfield
// r4 - reusable tile data
// r5 - halfword data
// r6 - word data
// r7 - inner count
// r8 - byte data
// r9-r12,lr - free

DecompressSpriteFrameImage_Loop:
	lsls r3, r3, #1
	bcs DecompressSpriteFrameImage_ModeHighBitSet
// either blank (00) or unique raw (01)
	bpl DecompressSpriteFrameImage_BlankTile
// unique raw
	mov r9, #REG_BASE
	str r6, [r9, #OFFSET_REG_DMA3SAD]
	str r1, [r9, #OFFSET_REG_DMA3DAD]
	mov r12, #(DMA_32BIT | DMA_ENABLE | DMA_START_NOW) // this is 0x8400
	strh r12, [r9, #OFFSET_REG_DMA3CNT_H]
	// update word data and dest
	add r6, r6, #0x20
	add r1, r1, #0x20
	b DecompressSpriteFrameImage_LoopEnd
DecompressSpriteFrameImage_BlankTile:
	// equivalent to if 4 regs were loaded and 2 stores were done
	mov r9, #0
	mov r10, #0
	stmia r1!, {r9,r10}
	stmia r1!, {r9,r10}
	stmia r1!, {r9,r10}
	stmia r1!, {r9,r10}
	b DecompressSpriteFrameImage_LoopEnd
DecompressSpriteFrameImage_ModeHighBitSet:

// either reusable tile (10) or unique compressed (11)
	bmi DecompressSpriteFrameImage_ReusableTile
// unique compressed
	bl DecompressSpriteFrameImage_CompressedTile
	b DecompressSpriteFrameImage_LoopEnd

// currently
// r0 - reusable tile offsets
// r1 - dest
// r2 - uncompressed tile data
// r3 - initial frame bitfield
// r4 - reusable tile data
// r5 - halfword data
// r6 - word data
// r7 - inner count
// r8 - byte data
// r9-r12,lr - free
DecompressSpriteFrameImage_ReusableTile:
	ldrb r12, [r8], #1
	
DecompressSpriteFrameImage_IsReusableTileCompressedSubOpcode:
	subs r9, r12, #0x69
	bpl DecompressSpriteFrameImage_IsReusableRawTile
	// save byte/halfword/word data since we use these as params for compressed tile
	push {r5,r6,r8}
	// read the offsets
	ldr r5, [r0, r12, lsl #2]
	// extract word offset
	// todo, reorder this
	// word offset should be lower 16 bits
	// byte offset should be last byte
	lsr r6, r5, #16
	// get word address for this reusable tile
	// probably could do this in one opcode but don't want to change the spec now
	add r6, r4, r6, lsl #2
	// extract byte offset
	and r8, r5, #0xff
	add r8, r6, r8
	// extract halfword offset
	and r5, r5, #0xff00
	add r5, r6, r5, lsr #7
	bl DecompressSpriteFrameImage_CompressedTile
	pop {r5,r6,r8}
DecompressSpriteFrameImage_LoopEnd:
	lsl r3, r3, #1
	subs r7, r7, #1
	bpl DecompressSpriteFrameImage_Loop
	pop {r3}
	// compare against 3 so can reuse initial count value
	cmp r3, #3
	popge {r4-r11,lr}
	bxge lr
	add r9, r3, #1
	mov r7, #15
	pop {r3}
	push {r9}
	b DecompressSpriteFrameImage_Loop

DecompressSpriteFrameImage_IsReusableRawTile:
	// calculate address of reusable raw tile
	add r9, r2, r9, lsl #5
	mov r10, #REG_BASE
	str r9, [r10, #OFFSET_REG_DMA3SAD]
	str r1, [r10, #OFFSET_REG_DMA3DAD]
	mov r12, #(DMA_32BIT | DMA_ENABLE | DMA_START_NOW) // this is 0x8400
	strh r12, [r10, #OFFSET_REG_DMA3CNT_H]
	// increment dest after, but not source
	add r1, #0x20
	b DecompressSpriteFrameImage_LoopEnd

// currently
// r0 - reusable tile offsets
// r1 - dest
// r2 - uncompressed tile data
// r3 - initial frame bitfield
// r4 - reusable tile data
// r5 - halfword data
// r6 - word data
// r7 - inner count
// r8 - byte data
// r9-r12,lr - free

// r5, r6, r8 can be overridden
// don't bother about calling conventions
DecompressSpriteFrameImage_CompressedTile:
	ldrh r9, [r5], #2
	lsl r9, r9, #16
	mov r10, #8

DecompressSpriteFrameImage_SideCheckOpcode:
	lsrs r12, r7, #3
	bcc DecompressSpriteFrameImage_CompressedTile_RightSideLoop
DecompressSpriteFrameImage_CompressedTile_LeftSideLoop:
// left side
	lsls r9, r9, #1
	bcs DecompressSpriteFrameImage_CompressedTile_LeftSide_HighBitSet
	// byte (00) or halfword (01)
	ldrbpl r12, [r8], #1
	lslpl r12, r12, #24
	ldrhmi r12, [r5], #2
	lslmi r12, r12, #16
	str r12, [r1], #4
	lsl r9, r9, #1
	subs r10, r10, #1
	bne DecompressSpriteFrameImage_CompressedTile_LeftSideLoop
	bx lr

DecompressSpriteFrameImage_CompressedTile_LeftSide_HighBitSet:
	// word (10) or blank (11)
	ldrpl r12, [r6], #4
	movmi r12, #0
	str r12, [r1], #4
	lsl r9, r9, #1
	subs r10, r10, #1
	bne DecompressSpriteFrameImage_CompressedTile_LeftSideLoop
	bx lr

DecompressSpriteFrameImage_CompressedTile_RightSideLoop:
	lsls r9, r9, #1
	bcs DecompressSpriteFrameImage_CompressedTile_RightSide_HighBitSet
	// byte (00) or halfword (01)
	ldrbpl r12, [r8], #1
	ldrhmi r12, [r5], #2
	str r12, [r1], #4
	lsl r9, r9, #1
	subs r10, r10, #1
	bne DecompressSpriteFrameImage_CompressedTile_RightSideLoop
	bx lr

DecompressSpriteFrameImage_CompressedTile_RightSide_HighBitSet:
	// word (10) or blank (11)
	ldrpl r12, [r6], #4
	movmi r12, #0
	str r12, [r1], #4
	lsl r9, r9, #1
	subs r10, r10, #1
	bne DecompressSpriteFrameImage_CompressedTile_RightSideLoop
	bx lr

// width: 2
// if (i & 1) >= 1: left side
// that means 1
// shift 31 then check negative
// or shift 1 right then check carry

// width: 4
// if (i & 3) >= 2: left side
// that means 10 or 11
// shift 30 then check negative
// or shift 2 right then check carry

// width: 8
// if (i & 7) >= 4: left side
// that means 100 or 101 or 110 or 111
// shift 29 then check negative
// or shift 3 right then check carry

// so can just shift once and check carry

DecompressSpriteFrameImage_SideCheckOpcodeWidth2:
	lsrs r12, r7, #1

DecompressSpriteFrameImage_SideCheckOpcodeWidth4:
	lsrs r12, r7, #2

DecompressSpriteFrameImage_SideCheckOpcodeWidth8:
	lsrs r12, r7, #3

	.global DecompressSpriteFrameImageEnd
DecompressSpriteFrameImageEnd:
