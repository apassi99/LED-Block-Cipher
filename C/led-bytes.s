	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"led-bytes.c"
	.text
	.align	2
	.global	FieldMult
	.thumb
	.thumb_func
	.type	FieldMult, %function
FieldMult:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r2, r0, #1
	push	{r4}
	uxtb	r2, r2
	ands	r4, r1, #1
	eor	r3, r2, #3
	it	ne
	movne	r4, r0
	tst	r0, #8
	it	ne
	movne	r2, r3
	tst	r1, #2
	eor	r0, r2, r4
	lsl	r3, r2, #1
	it	eq
	moveq	r0, r4
	tst	r2, #8
	uxtb	r3, r3
	eor	r2, r3, #3
	it	ne
	movne	r3, r2
	tst	r1, #4
	eor	r2, r3, r0
	lsl	r4, r3, #1
	it	eq
	moveq	r2, r0
	tst	r3, #8
	uxtb	r3, r4
	eor	r0, r3, #3
	it	ne
	movne	r3, r0
	tst	r1, #8
	eor	r3, r2, r3
	uxtb	r3, r3
	it	ne
	movne	r2, r3
	and	r0, r2, #15
	pop	{r4}
	bx	lr
	.size	FieldMult, .-FieldMult
	.global	__aeabi_idivmod
	.align	2
	.global	AddKey
	.thumb
	.thumb_func
	.type	AddKey, %function
AddKey:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	lsl	r8, r2, #4
	lsls	r7, r2, #2
	mov	r5, r0
	ldr	r3, [r4, #0]
	mov	r6, r1
	mov	r0, r8
	adds	r2, r3, #3
	bics	r3, r3, r3, asr #32
	it	cs
	movcs	r3, r2
	asrs	r1, r3, #2
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #0]	@ zero_extendqisi2
	add	r0, r8, #1
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [r5, #0]
	ldr	r3, [r4, #0]
	adds	r2, r3, #3
	bics	r3, r3, r3, asr #32
	it	cs
	movcs	r3, r2
	asrs	r1, r3, #2
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	add	r0, r8, #2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [r5, #1]
	ldr	r3, [r4, #0]
	adds	r2, r3, #3
	bics	r3, r3, r3, asr #32
	it	cs
	movcs	r3, r2
	asrs	r1, r3, #2
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	add	r0, r8, #3
	add	r8, r7, #1
	lsl	r8, r8, #2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [r5, #2]
	ldr	r3, [r4, #0]
	adds	r2, r3, #3
	bics	r3, r3, r3, asr #32
	it	cs
	movcs	r3, r2
	asrs	r1, r3, #2
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	mov	r0, r8
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [r5, #3]
	ldr	r4, [r4, #0]
	adds	r3, r4, #3
	bics	r4, r4, r4, asr #32
	it	cs
	movcs	r4, r3
	asrs	r4, r4, #2
	mov	r1, r4
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	add	r0, r8, #1
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #4]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #5]	@ zero_extendqisi2
	add	r0, r8, #2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #5]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #6]	@ zero_extendqisi2
	add	r0, r8, #3
	add	r8, r7, #2
	adds	r7, r7, #3
	lsl	r8, r8, #2
	lsls	r7, r7, #2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #6]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #7]	@ zero_extendqisi2
	mov	r0, r8
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #7]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	add	r0, r8, #1
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #8]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #9]	@ zero_extendqisi2
	add	r0, r8, #2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #9]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #10]	@ zero_extendqisi2
	add	r0, r8, #3
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #10]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #11]	@ zero_extendqisi2
	mov	r0, r7
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #11]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
	adds	r0, r7, #1
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #12]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #13]	@ zero_extendqisi2
	adds	r0, r7, #2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #13]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #14]	@ zero_extendqisi2
	adds	r0, r7, #3
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	mov	r1, r4
	eors	r3, r3, r2
	strb	r3, [r5, #14]
	bl	__aeabi_idivmod
	ldrb	r3, [r5, #15]	@ zero_extendqisi2
	ldrb	r2, [r6, r1]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [r5, #15]
	pop	{r4, r5, r6, r7, r8, pc}
	.size	AddKey, .-AddKey
	.align	2
	.global	AddConstants
	.thumb
	.thumb_func
	.type	AddConstants, %function
AddConstants:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	push	{r4, r5, r6, r7, r8, r9, sl}
	movw	r2, #:lower16:.LANCHOR1
	ldr	r6, [r3, #0]
	movt	r2, #:upper16:.LANCHOR1
	ldrb	r5, [r0, #0]	@ zero_extendqisi2
	ldrb	ip, [r2, r1]	@ zero_extendqisi2
	ubfx	r6, r6, #4, #4
	eors	r6, r6, r5
	ldrb	r4, [r0, #4]	@ zero_extendqisi2
	ldrb	r7, [r0, #8]	@ zero_extendqisi2
	ubfx	r2, ip, #3, #3
	ldrb	r5, [r0, #12]	@ zero_extendqisi2
	eor	r4, r4, #1
	strb	r6, [r0, #0]
	eor	r7, r7, #2
	ldr	r6, [r3, #0]
	and	r3, ip, #7
	ldrb	r8, [r0, #1]	@ zero_extendqisi2
	eor	r5, r5, #3
	ldrb	r9, [r0, #9]	@ zero_extendqisi2
	and	r1, r6, #15
	ldrb	ip, [r0, #5]	@ zero_extendqisi2
	ubfx	r6, r6, #4, #4
	ldrb	sl, [r0, #13]	@ zero_extendqisi2
	eor	r8, r2, r8
	eor	ip, r3, ip
	eors	r4, r4, r6
	eors	r7, r7, r1
	eors	r5, r5, r1
	eor	r2, r2, r9
	eor	r3, r3, sl
	strb	r4, [r0, #4]
	strb	r7, [r0, #8]
	strb	r5, [r0, #12]
	strb	r8, [r0, #1]
	strb	r2, [r0, #9]
	strb	ip, [r0, #5]
	strb	r3, [r0, #13]
	pop	{r4, r5, r6, r7, r8, r9, sl}
	bx	lr
	.size	AddConstants, .-AddConstants
	.align	2
	.global	SubCell
	.thumb
	.thumb_func
	.type	SubCell, %function
SubCell:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, sl, fp}
	movw	r3, #:lower16:.LANCHOR1
	ldrb	r8, [r0, #0]	@ zero_extendqisi2
	movt	r3, #:upper16:.LANCHOR1
	ldrb	r7, [r0, #2]	@ zero_extendqisi2
	sub	sp, sp, #24
	ldrb	r9, [r0, #10]	@ zero_extendqisi2
	add	r8, r3, r8
	adds	r7, r3, r7
	ldrb	r2, [r0, #8]	@ zero_extendqisi2
	add	r9, r3, r9
	ldrb	ip, [r0, #1]	@ zero_extendqisi2
	str	r9, [sp, #20]
	adds	r2, r3, r2
	ldrb	r6, [r0, #3]	@ zero_extendqisi2
	add	ip, r3, ip
	ldrb	r5, [r0, #4]	@ zero_extendqisi2
	ldrb	r4, [r0, #5]	@ zero_extendqisi2
	adds	r6, r3, r6
	ldrb	r1, [r0, #6]	@ zero_extendqisi2
	adds	r5, r3, r5
	ldrb	fp, [r0, #7]	@ zero_extendqisi2
	adds	r4, r3, r4
	str	r2, [sp, #12]
	adds	r1, r3, r1
	ldrb	r8, [r8, #48]	@ zero_extendqisi2
	add	fp, r3, fp
	ldrb	r9, [r7, #48]	@ zero_extendqisi2
	ldrb	sl, [r0, #9]	@ zero_extendqisi2
	ldr	r7, [sp, #20]
	ldrb	r2, [r0, #11]	@ zero_extendqisi2
	add	sl, r3, sl
	str	sl, [sp, #16]
	adds	r2, r3, r2
	str	r2, [sp, #0]
	str	r8, [sp, #8]
	ldrb	sl, [ip, #48]	@ zero_extendqisi2
	ldrb	r8, [r6, #48]	@ zero_extendqisi2
	ldrb	ip, [r5, #48]	@ zero_extendqisi2
	ldrb	r4, [r4, #48]	@ zero_extendqisi2
	ldrb	r5, [fp, #48]	@ zero_extendqisi2
	ldrb	r6, [r1, #48]	@ zero_extendqisi2
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #12]
	ldrb	fp, [r7, #48]	@ zero_extendqisi2
	ldr	r7, [sp, #0]
	str	r4, [sp, #4]
	ldrb	r4, [r1, #48]	@ zero_extendqisi2
	ldrb	r1, [r2, #48]	@ zero_extendqisi2
	ldrb	r2, [r7, #48]	@ zero_extendqisi2
	ldr	r7, [sp, #8]
	strb	r7, [r0, #0]
	strb	r5, [r0, #7]
	strb	r4, [r0, #8]
	ldrb	r5, [r0, #15]	@ zero_extendqisi2
	ldrb	r4, [r0, #12]	@ zero_extendqisi2
	strb	r1, [r0, #9]
	strb	r2, [r0, #11]
	adds	r4, r3, r4
	ldrb	r1, [r0, #13]	@ zero_extendqisi2
	ldrb	r2, [r0, #14]	@ zero_extendqisi2
	adds	r1, r3, r1
	ldr	r7, [sp, #4]
	adds	r2, r3, r2
	adds	r3, r3, r5
	ldrb	r4, [r4, #48]	@ zero_extendqisi2
	ldrb	r1, [r1, #48]	@ zero_extendqisi2
	ldrb	r2, [r2, #48]	@ zero_extendqisi2
	ldrb	r3, [r3, #48]	@ zero_extendqisi2
	strb	sl, [r0, #1]
	strb	r9, [r0, #2]
	strb	r8, [r0, #3]
	strb	ip, [r0, #4]
	strb	r7, [r0, #5]
	strb	r6, [r0, #6]
	strb	fp, [r0, #10]
	strb	r4, [r0, #12]
	strb	r1, [r0, #13]
	strb	r2, [r0, #14]
	strb	r3, [r0, #15]
	add	sp, sp, #24
	pop	{r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	SubCell, .-SubCell
	.align	2
	.global	ShiftRow
	.thumb
	.thumb_func
	.type	ShiftRow, %function
ShiftRow:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, sl, fp}
	ldrb	ip, [r0, #4]	@ zero_extendqisi2
	ldrb	r9, [r0, #6]	@ zero_extendqisi2
	ldrb	r8, [r0, #7]	@ zero_extendqisi2
	ldrb	sl, [r0, #5]	@ zero_extendqisi2
	ldrb	r5, [r0, #8]	@ zero_extendqisi2
	ldrb	r4, [r0, #9]	@ zero_extendqisi2
	ldrb	r6, [r0, #11]	@ zero_extendqisi2
	ldrb	r7, [r0, #10]	@ zero_extendqisi2
	ldrb	r2, [r0, #12]	@ zero_extendqisi2
	ldrb	r3, [r0, #13]	@ zero_extendqisi2
	ldrb	fp, [r0, #14]	@ zero_extendqisi2
	ldrb	r1, [r0, #15]	@ zero_extendqisi2
	strb	sl, [r0, #4]
	strb	r9, [r0, #5]
	strb	r8, [r0, #6]
	strb	ip, [r0, #7]
	strb	r7, [r0, #8]
	strb	r6, [r0, #9]
	strb	r5, [r0, #10]
	strb	r4, [r0, #11]
	strb	r1, [r0, #12]
	strb	r2, [r0, #13]
	strb	r3, [r0, #14]
	strb	fp, [r0, #15]
	pop	{r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	ShiftRow, .-ShiftRow
	.align	2
	.global	MixColumn
	.thumb
	.thumb_func
	.type	MixColumn, %function
MixColumn:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #124
	movw	r4, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:__stack_chk_guard
	str	r0, [sp, #56]
	movs	r3, #0
	ldr	r2, [sp, #56]
	adds	r0, r0, #4
	ldr	r1, [sp, #56]
	adds	r2, r2, #12
	str	r2, [sp, #76]
	ldr	r2, [r4, #0]
	adds	r1, r1, #8
	str	r0, [sp, #68]
	str	r1, [sp, #72]
	str	r2, [sp, #116]
.L147:
	ldr	r5, [sp, #56]
	ldr	r7, [sp, #72]
	ldr	ip, [sp, #76]
	ldrb	r1, [r5, r3]	@ zero_extendqisi2
	ldrb	r5, [r7, r3]	@ zero_extendqisi2
	ands	r4, r1, #1
	ubfx	r6, r1, #1, #1
	ite	eq
	moveq	r2, r4
	movne	r2, #4
	ubfx	r8, r1, #2, #1
	orr	r2, r2, r6, lsl #3
	ubfx	r1, r1, #3, #1
	str	r1, [sp, #28]
	eor	r1, r2, #19
	cmp	r8, #0
	it	ne
	movne	r2, r1
	ubfx	r9, r5, #1, #1
	ldr	fp, [sp, #28]
	eor	r1, r2, #38
	str	r9, [sp, #24]
	lsls	r0, r4, #3
	ldr	r7, [sp, #24]
	cmp	fp, #0
	it	ne
	movne	r2, r1
	ands	r1, r5, #1
	ubfx	sl, r5, #2, #1
	strb	r2, [sp, #40]
	ite	eq
	moveq	r2, r1
	movne	r2, #2
	orr	r2, r2, r7, lsl #2
	ubfx	r5, r5, #3, #1
	str	r5, [sp, #36]
	orr	r2, r2, sl, lsl #3
	ldrb	r9, [ip, r3]	@ zero_extendqisi2
	eor	ip, r0, #19
	str	sl, [sp, #8]
	eor	r5, r2, #19
	ldr	sl, [sp, #36]
	uxtb	ip, ip
	str	r8, [sp, #32]
	ubfx	r8, r9, #1, #1
	cmp	sl, #0
	it	ne
	movne	r2, r5
	strb	r2, [sp, #48]
	ands	r2, r9, #1
	ubfx	fp, r9, #2, #1
	ite	eq
	moveq	r7, r2
	movne	r7, #2
	cmp	r6, #0
	it	eq
	moveq	ip, r0
	ldr	r0, [sp, #68]
	orr	r7, r7, r8, lsl #2
	str	r8, [sp, #20]
	ubfx	r9, r9, #3, #1
	eor	r8, ip, #38
	str	r9, [sp, #16]
	ldrb	r5, [r0, r3]	@ zero_extendqisi2
	orr	r7, r7, fp, lsl #3
	ldr	sl, [sp, #32]
	eor	r9, r7, #19
	str	fp, [sp, #12]
	and	r0, r5, #1
	ldr	fp, [sp, #16]
	uxtb	r8, r8
	cmp	sl, #0
	it	eq
	moveq	r8, ip
	ubfx	ip, r5, #1, #1
	cmp	fp, #0
	it	ne
	movne	r7, r9
	cmp	r0, #0
	ite	eq
	moveq	r9, r0
	movne	r9, #6
	strb	r7, [sp, #88]
	eor	sl, r9, #12
	ubfx	r7, r5, #2, #1
	cmp	ip, #0
	it	ne
	movne	r9, sl
	eor	fp, r8, #76
	eor	sl, r9, #27
	ubfx	r5, r5, #3, #1
	cmp	r7, #0
	it	ne
	movne	r9, sl
	ldr	sl, [sp, #28]
	uxtb	fp, fp
	cmp	sl, #0
	it	ne
	movne	r8, fp
	strb	r8, [sp, #104]
	eor	r8, r9, #53
	lsl	fp, r4, #1
	cmp	r5, #0
	it	ne
	movne	r9, r8
	cmp	r1, #0
	ite	eq
	moveq	r8, r1
	movne	r8, #5
	strb	r9, [sp, #96]
	lsl	r9, r0, #1
	str	fp, [sp, #60]
	eor	sl, fp, #4
	orr	r9, r9, ip, lsl #2
	eor	fp, r8, #10
	orr	r9, r9, r7, lsl #3
	str	r9, [sp, #64]
	uxtb	sl, sl
	ldr	r9, [sp, #24]
	uxtb	fp, fp
	str	sl, [sp, #80]
	cmp	r9, #0
	it	ne
	movne	r8, fp
	ldr	sl, [sp, #64]
	eor	fp, r8, #23
	ldrb	r9, [sp, #40]	@ zero_extendqisi2
	eor	sl, sl, #19
	str	sl, [sp, #84]
	and	r9, r9, #15
	str	r9, [sp, #4]
	uxtb	r9, fp
	ldr	fp, [sp, #8]
	orr	sl, r0, ip, lsl #1
	cmp	fp, #0
	it	ne
	movne	r8, r9
	orr	sl, sl, r7, lsl #2
	ldr	r9, [sp, #4]
	eor	fp, r8, #46
	str	fp, [sp, #4]
	orr	sl, sl, r5, lsl #3
	ldrb	fp, [sp, #48]	@ zero_extendqisi2
	eor	sl, r9, sl
	and	r9, fp, #15
	ldrb	fp, [sp, #96]	@ zero_extendqisi2
	eor	r9, sl, r9
	str	r9, [sp, #40]
	ldrb	r9, [sp, #104]	@ zero_extendqisi2
	eor	sl, r9, fp
	ldr	r9, [sp, #4]
	uxtb	fp, r9
	ldrb	r9, [sp, #88]	@ zero_extendqisi2
	and	r9, r9, #15
	str	r9, [sp, #48]
	ldr	r9, [sp, #36]
	cmp	r9, #0
	it	ne
	movne	r8, fp
	ldr	fp, [sp, #40]
	cmp	r2, #0
	eor	r8, sl, r8
	ite	eq
	moveq	r9, r2
	movne	r9, #6
	str	r8, [sp, #4]
	uxtb	r8, fp
	ldr	fp, [sp, #20]
	eor	sl, r9, #12
	cmp	fp, #0
	it	ne
	movne	r9, sl
	ldr	fp, [sp, #56]
	ldr	sl, [sp, #48]
	eor	r8, r8, sl
	strb	r8, [fp, r3]
	ldr	fp, [sp, #12]
	eor	sl, r9, #27
	strb	r8, [sp, #112]
	cmp	fp, #0
	it	ne
	movne	r9, sl
	ldr	sl, [sp, #16]
	eor	r8, r9, #53
	ldr	fp, [sp, #4]
	cmp	sl, #0
	it	eq
	moveq	r8, r9
	cmp	r4, #0
	it	ne
	movne	r4, #11
	ldr	sl, [sp, #68]
	eor	r9, r4, #21
	eor	r8, fp, r8
	and	r8, r8, #15
	strb	r8, [sp, #113]
	uxtb	r9, r9
	strb	r8, [sl, r3]
	cmp	r6, #0
	it	ne
	movne	r4, r9
	ldr	fp, [sp, #32]
	eor	r8, r4, #42
	ldr	sl, [sp, #24]
	uxtb	r8, r8
	cmp	fp, #0
	it	ne
	movne	r4, r8
	cmp	r0, #0
	it	ne
	movne	r0, #14
	eor	r8, r4, #87
	eor	r9, r0, #31
	ldr	fp, [sp, #8]
	cmp	ip, #0
	it	ne
	movne	r0, r9
	ldr	r9, [sp, #28]
	eor	ip, r0, #61
	uxtb	r8, r8
	cmp	r7, #0
	it	ne
	movne	r0, ip
	cmp	r9, #0
	it	ne
	movne	r4, r8
	eor	r7, r0, #121
	ldr	ip, [sp, #36]
	cmp	r5, #0
	it	eq
	moveq	r7, r0
	cmp	r1, #0
	ite	eq
	moveq	r0, r1
	movne	r0, #10
	eors	r7, r7, r4
	eor	r4, r0, #23
	ldr	r9, [sp, #80]
	ldr	r8, [sp, #60]
	uxtb	r4, r4
	cmp	sl, #0
	it	ne
	movne	r0, r4
	ldr	sl, [sp, #20]
	eor	r4, r0, #46
	uxtb	r4, r4
	cmp	fp, #0
	it	ne
	movne	r0, r4
	ldr	fp, [sp, #64]
	eor	r4, r0, #95
	uxtb	r4, r4
	cmp	ip, #0
	it	eq
	moveq	r4, r0
	cmp	r2, #0
	ite	eq
	moveq	r0, r2
	movne	r0, #9
	cmp	r6, #0
	it	ne
	movne	r8, r9
	eor	ip, r8, #8
	ldr	r9, [sp, #32]
	mov	r6, r8
	eor	r8, r0, #17
	cmp	sl, #0
	it	ne
	movne	r0, r8
	ldr	r8, [sp, #84]
	ldr	sl, [sp, #12]
	uxtb	ip, ip
	cmp	r5, #0
	it	ne
	movne	fp, r8
	orr	r8, r0, #34
	cmp	sl, #0
	it	ne
	movne	r0, r8
	cmp	r9, #0
	it	ne
	movne	r6, ip
	mov	r5, fp
	ldr	fp, [sp, #16]
	orr	r8, r0, #68
	eors	r4, r4, r7
	cmp	fp, #0
	it	ne
	movne	r0, r8
	eor	ip, r6, #19
	eors	r0, r0, r4
	ldr	r4, [sp, #28]
	uxtb	ip, ip
	and	r0, r0, #15
	cmp	r4, #0
	it	ne
	movne	r6, ip
	cmp	r1, #0
	eor	r4, r6, r5
	ldr	r5, [sp, #72]
	it	ne
	movne	r1, #15
	and	r4, r4, #15
	eor	r7, r1, #29
	strb	r0, [r5, r3]
	ldr	r8, [sp, #24]
	uxtb	r7, r7
	strb	r0, [sp, #114]
	cmp	r8, #0
	it	ne
	movne	r1, r7
	ldr	r9, [sp, #8]
	eor	r0, r1, #57
	ldr	fp, [sp, #20]
	ldr	sl, [sp, #36]
	uxtb	r0, r0
	ldr	ip, [sp, #12]
	cmp	r9, #0
	it	eq
	moveq	r0, r1
	cmp	r2, #0
	it	ne
	movne	r2, #11
	and	r0, r0, #15
	eor	r1, r2, #21
	eor	r0, r0, sl
	cmp	fp, #0
	it	eq
	moveq	r1, r2
	eors	r0, r0, r4
	eor	r2, r1, #42
	ldr	r4, [sp, #16]
	cmp	ip, #0
	it	ne
	movne	r1, r2
	ldr	r5, [sp, #76]
	eor	r2, r1, #87
	cmp	r4, #0
	it	eq
	moveq	r2, r1
	and	r2, r2, #15
	eors	r2, r2, r0
	strb	r2, [r5, r3]
	adds	r3, r3, #1
	strb	r2, [sp, #115]
	cmp	r3, #4
	bne	.L147
	movw	r7, #:lower16:__stack_chk_guard
	movt	r7, #:upper16:__stack_chk_guard
	ldr	r2, [sp, #116]
	ldr	r3, [r7, #0]
	cmp	r2, r3
	bne	.L151
	add	sp, sp, #124
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L151:
	bl	__stack_chk_fail
	.size	MixColumn, .-MixColumn
	.align	2
	.global	LED_enc
	.thumb
	.thumb_func
	.type	LED_enc, %function
LED_enc:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #124
	ldrb	ip, [r0, #2]	@ zero_extendqisi2
	adds	r6, r2, #3
	ldrb	fp, [r0, #1]	@ zero_extendqisi2
	ands	r6, r6, r2, asr #32
	it	cc
	movcc	r6, r2
	str	r0, [sp, #56]
	movs	r3, #0
	ldr	r8, [sp, #56]
	asrs	r6, r6, #2
	ldrb	lr, [r0, #3]	@ zero_extendqisi2
	ldrb	r7, [r0, #4]	@ zero_extendqisi2
	ldrb	r9, [r0, #0]	@ zero_extendqisi2
	ldrb	r5, [r0, #5]	@ zero_extendqisi2
	lsr	r0, fp, #4
	and	fp, fp, #15
	str	fp, [sp, #8]
	lsr	fp, ip, #4
	str	fp, [sp, #52]
	movw	fp, #:lower16:__stack_chk_guard
	movt	fp, #:upper16:__stack_chk_guard
	ldrb	r4, [r8, #6]	@ zero_extendqisi2
	lsr	sl, r9, #4
	str	r0, [sp, #48]
	and	r9, r9, #15
	ldrb	r0, [r8, #7]	@ zero_extendqisi2
	ldr	r8, [fp, #0]
	and	fp, ip, #15
	strb	sl, [sp, #64]
	lsr	ip, lr, #4
	strb	r9, [sp, #65]
	and	sl, r7, #15
	str	r8, [sp, #116]
	and	r9, lr, #15
	ldr	r8, [sp, #48]
	lsr	lr, r7, #4
	ldr	r7, [sp, #8]
	strb	ip, [sp, #70]
	lsr	ip, r0, #4
	strb	r8, [sp, #66]
	and	r0, r0, #15
	ldr	r8, [sp, #52]
	strb	r7, [sp, #67]
	lsrs	r7, r5, #4
	cmp	r6, r3
	and	r5, r5, #15
	strb	r8, [sp, #68]
	lsr	r8, r4, #4
	strb	fp, [sp, #69]
	and	r4, r4, #15
	strb	r9, [sp, #71]
	strb	lr, [sp, #72]
	strb	sl, [sp, #73]
	strb	r7, [sp, #74]
	strb	r5, [sp, #75]
	strb	r8, [sp, #76]
	strb	r4, [sp, #77]
	strb	ip, [sp, #78]
	strb	r0, [sp, #79]
	str	r3, [sp, #80]
	str	r3, [sp, #84]
	str	r3, [sp, #88]
	str	r3, [sp, #92]
	str	r3, [sp, #96]
	str	r3, [sp, #100]
	str	r3, [sp, #104]
	str	r3, [sp, #108]
	ble	.L153
	add	r4, sp, #80
.L156:
	asrs	r0, r3, #1
	lsls	r5, r3, #31
	ldrb	r0, [r1, r0]	@ zero_extendqisi2
	ite	mi
	andmi	r0, r0, #15
	lsrpl	r0, r0, #4
	strb	r0, [r4, r3]
	adds	r3, r3, #1
	cmp	r3, r6
	bne	.L156
	ldrb	r3, [sp, #80]	@ zero_extendqisi2
.L153:
	movw	sl, #:lower16:.LANCHOR0
	movt	sl, #:upper16:.LANCHOR0
	ldrb	r5, [sp, #64]	@ zero_extendqisi2
	movs	r0, #1
	str	r2, [sl, #0]
	mov	r1, r6
	cmp	r2, #64
	ite	le
	movle	r9, #8
	movgt	r9, #12
	eors	r3, r3, r5
	str	r9, [sp, #60]
	mov	fp, #1
	strb	r3, [sp, #64]
	bl	__aeabi_idivmod
	add	lr, sp, #120
	ldrb	r3, [sp, #65]	@ zero_extendqisi2
	movs	r0, #2
	mov	ip, #0
	str	fp, [sp, #52]
	add	r7, sp, #120
	str	ip, [sp, #48]
	add	r8, sp, #120
	add	r9, sp, #120
	add	sl, sp, #120
	add	fp, sp, #120
	ldr	r4, .L165
	movs	r5, #17
	add	r2, lr, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #65]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	movs	r0, #3
	adds	r2, r7, r1
	mov	r1, r6
	add	r7, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #66]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #67]	@ zero_extendqisi2
	movs	r0, #4
	add	r2, r8, r1
	mov	r1, r6
	add	r8, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #67]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #68]	@ zero_extendqisi2
	movs	r0, #5
	add	r2, r9, r1
	mov	r1, r6
	add	r9, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #68]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #69]	@ zero_extendqisi2
	movs	r0, #6
	add	r2, sl, r1
	mov	r1, r6
	add	sl, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #69]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	movs	r0, #7
	add	r2, fp, r1
	mov	r1, r6
	add	fp, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #70]
	bl	__aeabi_idivmod
	add	ip, sp, #120
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	movs	r0, #8
	add	r2, ip, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #71]
	bl	__aeabi_idivmod
	add	lr, sp, #120
	ldrb	r3, [sp, #72]	@ zero_extendqisi2
	movs	r0, #9
	add	r2, lr, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #72]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #73]	@ zero_extendqisi2
	movs	r0, #10
	adds	r2, r7, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #73]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #74]	@ zero_extendqisi2
	movs	r0, #11
	add	r2, r8, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #74]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #75]	@ zero_extendqisi2
	movs	r0, #12
	add	r2, r9, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #75]
	bl	__aeabi_idivmod
	ldrb	r2, [sp, #76]	@ zero_extendqisi2
	movs	r0, #13
	add	r3, sl, r1
	mov	r1, r6
	ldrb	r3, [r3, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #76]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #77]	@ zero_extendqisi2
	movs	r0, #14
	add	r2, fp, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #77]
	bl	__aeabi_idivmod
	add	ip, sp, #120
	ldrb	r3, [sp, #78]	@ zero_extendqisi2
	movs	r0, #15
	add	r2, ip, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #78]
	bl	__aeabi_idivmod
	add	lr, sp, #120
	ldrb	r3, [sp, #79]	@ zero_extendqisi2
	add	r1, lr, r1
	ldrb	r2, [r1, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	ldr	r2, [sp, #48]
	strb	r3, [sp, #79]
	b	.L166
.L167:
	.align	2
.L165:
	.word	.LANCHOR1
.L166:
.L158:
	lsls	r1, r2, #2
	add	r0, sp, #64
	bl	AddConstants
	ldrb	r7, [sp, #66]	@ zero_extendqisi2
	ldrb	r8, [sp, #64]	@ zero_extendqisi2
	add	r0, sp, #64
	ldrb	lr, [sp, #65]	@ zero_extendqisi2
	adds	r7, r4, r7
	ldrb	r6, [sp, #67]	@ zero_extendqisi2
	add	r8, r4, r8
	ldrb	r1, [sp, #68]	@ zero_extendqisi2
	add	lr, r4, lr
	ldrb	r9, [sp, #73]	@ zero_extendqisi2
	adds	r6, r4, r6
	ldrb	ip, [sp, #74]	@ zero_extendqisi2
	adds	r1, r4, r1
	ldrb	r7, [r7, #48]	@ zero_extendqisi2
	add	r9, r4, r9
	ldrb	fp, [sp, #72]	@ zero_extendqisi2
	add	ip, r4, ip
	str	r9, [sp, #4]
	str	ip, [sp, #24]
	add	fp, r4, fp
	ldrb	r9, [sp, #76]	@ zero_extendqisi2
	ldrb	ip, [sp, #77]	@ zero_extendqisi2
	ldrb	r8, [r8, #48]	@ zero_extendqisi2
	add	r9, r4, r9
	ldrb	lr, [lr, #48]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	r6, [r6, #48]	@ zero_extendqisi2
	ldrb	sl, [sp, #75]	@ zero_extendqisi2
	ldrb	r1, [r1, #48]	@ zero_extendqisi2
	str	r9, [sp, #32]
	add	sl, r4, sl
	ldrb	r9, [sp, #79]	@ zero_extendqisi2
	str	ip, [sp, #36]
	str	r7, [sp, #16]
	add	r9, r4, r9
	ldr	r7, [sp, #48]
	ldrb	ip, [sp, #69]	@ zero_extendqisi2
	str	sl, [sp, #28]
	adds	r7, r7, #1
	ldrb	sl, [sp, #78]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	r2, [sp, #70]	@ zero_extendqisi2
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	add	sl, r4, sl
	str	r9, [sp, #40]
	adds	r2, r4, r2
	str	r8, [sp, #8]
	adds	r3, r4, r3
	str	ip, [sp, #44]
	str	lr, [sp, #12]
	str	r7, [sp, #48]
	str	r6, [sp, #20]
	str	r1, [sp, #0]
	ldrb	r6, [fp, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #24]
	ldr	fp, [sp, #4]
	ldrb	sl, [sl, #48]	@ zero_extendqisi2
	ldrb	lr, [ip, #48]	@ zero_extendqisi2
	ldrb	r1, [fp, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #36]
	ldr	fp, [sp, #32]
	ldrb	r9, [r2, #48]	@ zero_extendqisi2
	ldrb	r8, [r3, #48]	@ zero_extendqisi2
	ldr	r2, [sp, #28]
	ldrb	r3, [fp, #48]	@ zero_extendqisi2
	str	sl, [sp, #4]
	ldrb	fp, [ip, #48]	@ zero_extendqisi2
	ldr	sl, [sp, #40]
	ldr	ip, [sp, #44]
	ldrb	r7, [r2, #48]	@ zero_extendqisi2
	ldrb	r2, [sl, #48]	@ zero_extendqisi2
	ldrb	sl, [ip, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #8]
	strb	r8, [sp, #70]
	ldr	r8, [sp, #0]
	strb	ip, [sp, #64]
	ldr	ip, [sp, #12]
	strb	lr, [sp, #72]
	strb	sl, [sp, #68]
	strb	ip, [sp, #65]
	ldr	ip, [sp, #16]
	strb	r9, [sp, #69]
	strb	r8, [sp, #71]
	strb	ip, [sp, #66]
	ldr	ip, [sp, #20]
	strb	ip, [sp, #67]
	strb	r7, [sp, #73]
	ldr	r9, [sp, #4]
	strb	r2, [sp, #76]
	strb	r3, [sp, #77]
	strb	r6, [sp, #74]
	strb	r1, [sp, #75]
	strb	fp, [sp, #78]
	strb	r9, [sp, #79]
	bl	MixColumn
	add	r0, sp, #64
	ldr	r1, [sp, #52]
	bl	AddConstants
	ldrb	r6, [sp, #67]	@ zero_extendqisi2
	ldrb	ip, [sp, #74]	@ zero_extendqisi2
	add	r0, sp, #64
	adds	r6, r4, r6
	ldrb	lr, [sp, #65]	@ zero_extendqisi2
	ldrb	r1, [sp, #68]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	fp, [sp, #72]	@ zero_extendqisi2
	add	lr, r4, lr
	str	ip, [sp, #24]
	adds	r1, r4, r1
	ldrb	ip, [sp, #77]	@ zero_extendqisi2
	add	fp, r4, fp
	ldrb	r6, [r6, #48]	@ zero_extendqisi2
	ldrb	r9, [sp, #73]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	sl, [sp, #75]	@ zero_extendqisi2
	str	ip, [sp, #36]
	add	r9, r4, r9
	ldrb	ip, [sp, #69]	@ zero_extendqisi2
	add	sl, r4, sl
	str	r9, [sp, #4]
	str	sl, [sp, #28]
	add	ip, r4, ip
	ldrb	r8, [sp, #64]	@ zero_extendqisi2
	ldrb	r7, [sp, #66]	@ zero_extendqisi2
	ldrb	r2, [sp, #70]	@ zero_extendqisi2
	add	r8, r4, r8
	ldrb	r9, [sp, #76]	@ zero_extendqisi2
	adds	r7, r4, r7
	ldrb	sl, [sp, #78]	@ zero_extendqisi2
	adds	r2, r4, r2
	ldrb	lr, [lr, #48]	@ zero_extendqisi2
	add	r9, r4, r9
	ldrb	r1, [r1, #48]	@ zero_extendqisi2
	add	sl, r4, sl
	str	ip, [sp, #44]
	str	r6, [sp, #20]
	ldr	ip, [sp, #24]
	ldrb	r6, [fp, #48]	@ zero_extendqisi2
	ldr	fp, [sp, #4]
	str	r9, [sp, #32]
	ldrb	r9, [sp, #79]	@ zero_extendqisi2
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	ldrb	r8, [r8, #48]	@ zero_extendqisi2
	add	r9, r4, r9
	ldrb	r7, [r7, #48]	@ zero_extendqisi2
	adds	r3, r4, r3
	str	r9, [sp, #40]
	str	lr, [sp, #12]
	ldrb	r9, [r2, #48]	@ zero_extendqisi2
	ldrb	lr, [ip, #48]	@ zero_extendqisi2
	ldr	r2, [sp, #28]
	ldr	ip, [sp, #36]
	str	r1, [sp, #0]
	ldrb	sl, [sl, #48]	@ zero_extendqisi2
	ldrb	r1, [fp, #48]	@ zero_extendqisi2
	ldr	fp, [sp, #32]
	str	r8, [sp, #8]
	str	r7, [sp, #16]
	ldrb	r8, [r3, #48]	@ zero_extendqisi2
	ldrb	r7, [r2, #48]	@ zero_extendqisi2
	ldrb	r3, [fp, #48]	@ zero_extendqisi2
	ldrb	fp, [ip, #48]	@ zero_extendqisi2
	str	sl, [sp, #4]
	ldr	sl, [sp, #40]
	ldr	ip, [sp, #44]
	strb	r9, [sp, #69]
	ldrb	r2, [sl, #48]	@ zero_extendqisi2
	ldrb	sl, [ip, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #8]
	ldr	r9, [sp, #4]
	strb	r8, [sp, #70]
	strb	ip, [sp, #64]
	ldr	ip, [sp, #12]
	ldr	r8, [sp, #0]
	strb	lr, [sp, #72]
	strb	ip, [sp, #65]
	ldr	ip, [sp, #16]
	strb	r2, [sp, #76]
	strb	r3, [sp, #77]
	strb	ip, [sp, #66]
	ldr	ip, [sp, #20]
	strb	sl, [sp, #68]
	strb	r8, [sp, #71]
	strb	ip, [sp, #67]
	strb	r7, [sp, #73]
	strb	r6, [sp, #74]
	strb	r1, [sp, #75]
	strb	fp, [sp, #78]
	strb	r9, [sp, #79]
	bl	MixColumn
	ldr	sl, [sp, #52]
	add	r0, sp, #64
	add	r1, sl, #1
	bl	AddConstants
	ldrb	r6, [sp, #67]	@ zero_extendqisi2
	ldrb	ip, [sp, #74]	@ zero_extendqisi2
	add	r0, sp, #64
	adds	r6, r4, r6
	ldrb	lr, [sp, #65]	@ zero_extendqisi2
	ldrb	r1, [sp, #68]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	fp, [sp, #72]	@ zero_extendqisi2
	add	lr, r4, lr
	str	ip, [sp, #24]
	adds	r1, r4, r1
	ldrb	ip, [sp, #77]	@ zero_extendqisi2
	add	fp, r4, fp
	ldrb	r6, [r6, #48]	@ zero_extendqisi2
	ldrb	r9, [sp, #73]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	sl, [sp, #75]	@ zero_extendqisi2
	str	ip, [sp, #36]
	add	r9, r4, r9
	ldrb	ip, [sp, #69]	@ zero_extendqisi2
	add	sl, r4, sl
	str	r9, [sp, #4]
	str	sl, [sp, #28]
	add	ip, r4, ip
	ldrb	r8, [sp, #64]	@ zero_extendqisi2
	ldrb	r7, [sp, #66]	@ zero_extendqisi2
	ldrb	r2, [sp, #70]	@ zero_extendqisi2
	add	r8, r4, r8
	ldrb	r9, [sp, #76]	@ zero_extendqisi2
	adds	r7, r4, r7
	ldrb	sl, [sp, #78]	@ zero_extendqisi2
	adds	r2, r4, r2
	ldrb	lr, [lr, #48]	@ zero_extendqisi2
	add	r9, r4, r9
	ldrb	r1, [r1, #48]	@ zero_extendqisi2
	add	sl, r4, sl
	str	ip, [sp, #44]
	str	r6, [sp, #20]
	ldr	ip, [sp, #24]
	ldrb	r6, [fp, #48]	@ zero_extendqisi2
	ldr	fp, [sp, #4]
	str	r9, [sp, #32]
	ldrb	r9, [sp, #79]	@ zero_extendqisi2
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	ldrb	r8, [r8, #48]	@ zero_extendqisi2
	add	r9, r4, r9
	ldrb	r7, [r7, #48]	@ zero_extendqisi2
	adds	r3, r4, r3
	str	r9, [sp, #40]
	str	lr, [sp, #12]
	ldrb	r9, [r2, #48]	@ zero_extendqisi2
	ldrb	lr, [ip, #48]	@ zero_extendqisi2
	ldr	r2, [sp, #28]
	ldr	ip, [sp, #36]
	str	r1, [sp, #0]
	ldrb	sl, [sl, #48]	@ zero_extendqisi2
	ldrb	r1, [fp, #48]	@ zero_extendqisi2
	ldr	fp, [sp, #32]
	str	r8, [sp, #8]
	str	r7, [sp, #16]
	ldrb	r8, [r3, #48]	@ zero_extendqisi2
	ldrb	r7, [r2, #48]	@ zero_extendqisi2
	ldrb	r3, [fp, #48]	@ zero_extendqisi2
	ldrb	fp, [ip, #48]	@ zero_extendqisi2
	str	sl, [sp, #4]
	ldr	sl, [sp, #40]
	ldr	ip, [sp, #44]
	strb	r9, [sp, #69]
	ldrb	r2, [sl, #48]	@ zero_extendqisi2
	ldrb	sl, [ip, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #8]
	ldr	r9, [sp, #4]
	strb	r8, [sp, #70]
	strb	ip, [sp, #64]
	ldr	ip, [sp, #12]
	ldr	r8, [sp, #0]
	strb	lr, [sp, #72]
	strb	ip, [sp, #65]
	ldr	ip, [sp, #16]
	strb	r2, [sp, #76]
	strb	r3, [sp, #77]
	strb	ip, [sp, #66]
	ldr	ip, [sp, #20]
	strb	sl, [sp, #68]
	strb	r8, [sp, #71]
	strb	ip, [sp, #67]
	strb	r7, [sp, #73]
	strb	r6, [sp, #74]
	strb	r1, [sp, #75]
	strb	fp, [sp, #78]
	strb	r9, [sp, #79]
	bl	MixColumn
	ldr	sl, [sp, #52]
	add	r0, sp, #64
	add	r1, sl, #2
	bl	AddConstants
	ldrb	ip, [sp, #74]	@ zero_extendqisi2
	ldrb	r8, [sp, #64]	@ zero_extendqisi2
	add	r0, sp, #64
	ldrb	lr, [sp, #65]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	r7, [sp, #66]	@ zero_extendqisi2
	add	r8, r4, r8
	ldrb	r6, [sp, #67]	@ zero_extendqisi2
	add	lr, r4, lr
	ldrb	r1, [sp, #68]	@ zero_extendqisi2
	adds	r7, r4, r7
	ldrb	r9, [sp, #73]	@ zero_extendqisi2
	adds	r6, r4, r6
	ldrb	sl, [sp, #75]	@ zero_extendqisi2
	adds	r1, r4, r1
	str	ip, [sp, #24]
	add	r9, r4, r9
	ldrb	ip, [sp, #77]	@ zero_extendqisi2
	add	sl, r4, sl
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	ldrb	fp, [sp, #72]	@ zero_extendqisi2
	add	ip, r4, ip
	str	r9, [sp, #4]
	adds	r3, r4, r3
	ldrb	r9, [sp, #76]	@ zero_extendqisi2
	add	fp, r4, fp
	str	sl, [sp, #28]
	str	ip, [sp, #36]
	add	r9, r4, r9
	ldrb	sl, [sp, #78]	@ zero_extendqisi2
	ldrb	ip, [sp, #69]	@ zero_extendqisi2
	ldrb	r8, [r8, #48]	@ zero_extendqisi2
	add	sl, r4, sl
	ldrb	lr, [lr, #48]	@ zero_extendqisi2
	add	ip, r4, ip
	ldrb	r7, [r7, #48]	@ zero_extendqisi2
	ldrb	r6, [r6, #48]	@ zero_extendqisi2
	ldrb	r1, [r1, #48]	@ zero_extendqisi2
	str	r9, [sp, #32]
	str	ip, [sp, #44]
	ldrb	r9, [sp, #79]	@ zero_extendqisi2
	ldr	ip, [sp, #52]
	ldrb	r2, [sp, #70]	@ zero_extendqisi2
	add	r9, r4, r9
	str	r8, [sp, #8]
	add	ip, ip, #4
	str	r9, [sp, #40]
	adds	r2, r4, r2
	str	lr, [sp, #12]
	str	r7, [sp, #16]
	str	ip, [sp, #52]
	str	r6, [sp, #20]
	str	r1, [sp, #0]
	ldrb	r8, [r3, #48]	@ zero_extendqisi2
	ldrb	r6, [fp, #48]	@ zero_extendqisi2
	ldr	r3, [sp, #28]
	ldr	fp, [sp, #32]
	ldr	ip, [sp, #36]
	ldrb	sl, [sl, #48]	@ zero_extendqisi2
	ldrb	r9, [r2, #48]	@ zero_extendqisi2
	ldr	lr, [sp, #4]
	ldr	r2, [sp, #24]
	ldrb	r7, [r3, #48]	@ zero_extendqisi2
	str	sl, [sp, #4]
	ldrb	r3, [fp, #48]	@ zero_extendqisi2
	ldr	sl, [sp, #40]
	ldrb	fp, [ip, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #44]
	ldrb	r1, [lr, #48]	@ zero_extendqisi2
	ldrb	lr, [r2, #48]	@ zero_extendqisi2
	ldrb	r2, [sl, #48]	@ zero_extendqisi2
	ldrb	sl, [ip, #48]	@ zero_extendqisi2
	ldr	ip, [sp, #8]
	strb	r8, [sp, #70]
	ldr	r8, [sp, #0]
	strb	ip, [sp, #64]
	ldr	ip, [sp, #12]
	strb	lr, [sp, #72]
	strb	sl, [sp, #68]
	movw	sl, #:lower16:.LANCHOR0
	strb	ip, [sp, #65]
	movt	sl, #:upper16:.LANCHOR0
	ldr	ip, [sp, #16]
	strb	r9, [sp, #69]
	strb	r8, [sp, #71]
	strb	ip, [sp, #66]
	ldr	ip, [sp, #20]
	strb	ip, [sp, #67]
	strb	r7, [sp, #73]
	ldr	r9, [sp, #4]
	strb	r2, [sp, #76]
	strb	r6, [sp, #74]
	strb	r1, [sp, #75]
	strb	r3, [sp, #77]
	strb	fp, [sp, #78]
	strb	r9, [sp, #79]
	bl	MixColumn
	ldr	r6, [sl, #0]
	add	r9, sp, #120
	ldr	fp, [sp, #48]
	add	sl, sp, #120
	adds	r3, r6, #3
	bics	r6, r6, r6, asr #32
	it	cs
	movcs	r6, r3
	lsl	r0, fp, #4
	add	fp, sp, #120
	asrs	r6, r6, #2
	mov	r1, r6
	bl	__aeabi_idivmod
	add	ip, sp, #120
	ldrb	r3, [sp, #64]	@ zero_extendqisi2
	mov	r0, r5
	add	r2, ip, r1
	mov	r1, r6
	ldrb	r7, [r2, #-40]	@ zero_extendqisi2
	eors	r7, r7, r3
	strb	r7, [sp, #64]
	bl	__aeabi_idivmod
	add	lr, sp, #120
	ldrb	r3, [sp, #65]	@ zero_extendqisi2
	adds	r0, r5, #1
	add	r2, lr, r1
	mov	r1, r6
	ldrb	r8, [r2, #-40]	@ zero_extendqisi2
	eor	r8, r8, r3
	strb	r8, [sp, #65]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	adds	r0, r5, #2
	add	r2, r9, r1
	mov	r1, r6
	add	r9, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #66]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #67]	@ zero_extendqisi2
	adds	r0, r5, #3
	add	r2, sl, r1
	mov	r1, r6
	add	sl, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #67]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #68]	@ zero_extendqisi2
	adds	r0, r5, #4
	add	r2, fp, r1
	mov	r1, r6
	add	fp, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #68]
	bl	__aeabi_idivmod
	add	ip, sp, #120
	ldrb	r3, [sp, #69]	@ zero_extendqisi2
	adds	r0, r5, #5
	add	r2, ip, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #69]
	bl	__aeabi_idivmod
	add	lr, sp, #120
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	adds	r0, r5, #6
	add	r2, lr, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #70]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #71]	@ zero_extendqisi2
	adds	r0, r5, #7
	add	r2, r9, r1
	mov	r1, r6
	add	r9, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #71]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #72]	@ zero_extendqisi2
	add	r0, r5, #8
	add	r2, sl, r1
	mov	r1, r6
	add	sl, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #72]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #73]	@ zero_extendqisi2
	add	r0, r5, #9
	add	r2, fp, r1
	mov	r1, r6
	add	fp, sp, #120
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #73]
	bl	__aeabi_idivmod
	add	ip, sp, #120
	ldrb	r3, [sp, #74]	@ zero_extendqisi2
	add	r0, r5, #10
	add	r2, ip, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #74]
	bl	__aeabi_idivmod
	add	lr, sp, #120
	ldrb	r3, [sp, #75]	@ zero_extendqisi2
	add	r0, r5, #11
	add	r2, lr, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #75]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #76]	@ zero_extendqisi2
	add	r0, r5, #12
	add	r2, r9, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #76]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #77]	@ zero_extendqisi2
	add	r0, r5, #13
	add	r2, sl, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #77]
	bl	__aeabi_idivmod
	ldrb	r3, [sp, #78]	@ zero_extendqisi2
	add	r0, r5, #14
	adds	r5, r5, #16
	add	r2, fp, r1
	mov	r1, r6
	ldrb	r2, [r2, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	strb	r3, [sp, #78]
	bl	__aeabi_idivmod
	add	ip, sp, #120
	ldrb	r3, [sp, #79]	@ zero_extendqisi2
	add	r1, ip, r1
	ldrb	r2, [r1, #-40]	@ zero_extendqisi2
	eors	r3, r3, r2
	ldr	r2, [sp, #48]
	strb	r3, [sp, #79]
	ldr	r3, [sp, #60]
	cmp	r2, r3
	blt	.L158
	and	r8, r8, #15
	ldrb	r9, [sp, #74]	@ zero_extendqisi2
	orr	r7, r8, r7, lsl #4
	ldrb	r8, [sp, #75]	@ zero_extendqisi2
	ldrb	r3, [sp, #67]	@ zero_extendqisi2
	movw	sl, #:lower16:__stack_chk_guard
	ldrb	r6, [sp, #66]	@ zero_extendqisi2
	and	r8, r8, #15
	and	r3, r3, #15
	ldrb	r5, [sp, #68]	@ zero_extendqisi2
	ldrb	r4, [sp, #70]	@ zero_extendqisi2
	orr	r8, r8, r9, lsl #4
	ldrb	r0, [sp, #69]	@ zero_extendqisi2
	orr	r6, r3, r6, lsl #4
	ldr	r9, [sp, #56]
	movt	sl, #:upper16:__stack_chk_guard
	ldrb	r2, [sp, #71]	@ zero_extendqisi2
	and	r0, r0, #15
	ldrb	r1, [sp, #72]	@ zero_extendqisi2
	orr	r0, r0, r5, lsl #4
	ldrb	r3, [sp, #73]	@ zero_extendqisi2
	and	r2, r2, #15
	orr	r2, r2, r4, lsl #4
	strb	r0, [r9, #2]
	and	r3, r3, #15
	ldr	r0, [sp, #116]
	strb	r7, [r9, #0]
	orr	r3, r3, r1, lsl #4
	strb	r6, [r9, #1]
	strb	r2, [r9, #3]
	ldr	r2, [sl, #0]
	ldrb	r4, [sp, #77]	@ zero_extendqisi2
	ldrb	r5, [sp, #76]	@ zero_extendqisi2
	cmp	r0, r2
	ldrb	ip, [sp, #79]	@ zero_extendqisi2
	and	r4, r4, #15
	ldrb	r1, [sp, #78]	@ zero_extendqisi2
	and	ip, ip, #15
	orr	r4, r4, r5, lsl #4
	strb	r3, [r9, #4]
	orr	r1, ip, r1, lsl #4
	strb	r8, [r9, #5]
	strb	r4, [r9, #6]
	strb	r1, [r9, #7]
	bne	.L164
	add	sp, sp, #124
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L164:
	bl	__stack_chk_fail
	.size	LED_enc, .-LED_enc
	.align	2
	.global	LED80_enc
	.thumb
	.thumb_func
	.type	LED80_enc, %function
LED80_enc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #80
	b	LED_enc
	.size	LED80_enc, .-LED80_enc
	.align	2
	.global	TestVectors
	.thumb
	.thumb_func
	.type	TestVectors, %function
TestVectors:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
	movw	r1, #:lower16:__stack_chk_guard
	sub	sp, sp, #60
	movt	r1, #:upper16:__stack_chk_guard
	movs	r3, #9
	adds	r2, r0, #7
	str	r3, [sp, #4]
	ands	r2, r2, r0, asr #32
	it	cc
	movcc	r2, r0
	ldr	r3, [r1, #0]
	asrs	r2, r2, #3
	str	r0, [sp, #20]
	str	r2, [sp, #16]
	str	r3, [sp, #52]
.L170:
	bl	rand
	uxtb	r0, r0
	str	r0, [sp, #8]
	strb	r0, [sp, #44]
	bl	rand
	uxtb	r0, r0
	str	r0, [sp, #12]
	strb	r0, [sp, #45]
	bl	rand
	uxtb	fp, r0
	strb	fp, [sp, #46]
	bl	rand
	uxtb	sl, r0
	strb	sl, [sp, #47]
	bl	rand
	uxtb	r6, r0
	strb	r6, [sp, #48]
	bl	rand
	uxtb	r7, r0
	strb	r7, [sp, #49]
	bl	rand
	uxtb	r8, r0
	strb	r8, [sp, #50]
	bl	rand
	uxtb	r9, r0
	strb	r9, [sp, #51]
	bl	rand
	strb	r0, [sp, #28]
	bl	rand
	strb	r0, [sp, #29]
	bl	rand
	strb	r0, [sp, #30]
	bl	rand
	strb	r0, [sp, #31]
	bl	rand
	strb	r0, [sp, #32]
	bl	rand
	strb	r0, [sp, #33]
	bl	rand
	strb	r0, [sp, #34]
	bl	rand
	strb	r0, [sp, #35]
	bl	rand
	strb	r0, [sp, #36]
	bl	rand
	strb	r0, [sp, #37]
	bl	rand
	strb	r0, [sp, #38]
	bl	rand
	strb	r0, [sp, #39]
	bl	rand
	strb	r0, [sp, #40]
	bl	rand
	strb	r0, [sp, #41]
	bl	rand
	strb	r0, [sp, #42]
	bl	rand
	ldr	r1, .L177
	strb	r0, [sp, #43]
	movs	r0, #1
	bl	__printf_chk
	ldr	r3, [sp, #16]
	cmp	r3, #0
	itt	gt
	addgt	r4, sp, #27
	addgt	r5, r4, r3
	ble	.L173
.L171:
	ldrb	r2, [r4, #1]!	@ zero_extendqisi2
	movs	r0, #1
	ldr	r1, .L177+4
	bl	__printf_chk
	cmp	r4, r5
	bne	.L171
.L173:
	movs	r0, #10
	bl	putchar
	ldr	r1, .L177+8
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldr	r2, [sp, #8]
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldr	r2, [sp, #12]
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	mov	r2, fp
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	mov	r2, sl
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	mov	r2, r6
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	mov	r2, r7
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	mov	r2, r8
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	mov	r2, r9
	movs	r0, #1
	bl	__printf_chk
	movs	r0, #10
	bl	putchar
	ldr	r2, [sp, #20]
	add	r0, sp, #44
	add	r1, sp, #28
	bl	LED_enc
	ldr	r1, .L177+12
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldrb	r2, [sp, #44]	@ zero_extendqisi2
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldrb	r2, [sp, #45]	@ zero_extendqisi2
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldrb	r2, [sp, #46]	@ zero_extendqisi2
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldrb	r2, [sp, #47]	@ zero_extendqisi2
	movs	r0, #1
	bl	__printf_chk
	movs	r0, #1
	ldr	r1, .L177+4
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	bl	__printf_chk
	ldr	r1, .L177+4
	ldrb	r2, [sp, #49]	@ zero_extendqisi2
	movs	r0, #1
	bl	__printf_chk
	ldr	r1, .L177+4
	ldrb	r2, [sp, #50]	@ zero_extendqisi2
	movs	r0, #1
	bl	__printf_chk
	movs	r0, #1
	ldr	r1, .L177+4
	ldrb	r2, [sp, #51]	@ zero_extendqisi2
	bl	__printf_chk
	ldr	r0, .L177+16
	bl	puts
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	str	r3, [sp, #4]
	bne	.L170
	movw	r1, #:lower16:__stack_chk_guard
	movt	r1, #:upper16:__stack_chk_guard
	ldr	r2, [sp, #52]
	ldr	r3, [r1, #0]
	cmp	r2, r3
	bne	.L176
	add	sp, sp, #60
	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L176:
	bl	__stack_chk_fail
.L178:
	.align	2
.L177:
	.word	.LC4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	TestVectors, .-TestVectors
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #36
	ldr	r5, .L182
	movs	r2, #64
	add	r0, sp, #20
	add	r1, sp, #4
	movs	r4, #0
	strb	r4, [sp, #20]
	ldr	r3, [r5, #0]
	strb	r4, [sp, #21]
	strb	r4, [sp, #22]
	str	r3, [sp, #28]
	strb	r4, [sp, #23]
	strb	r4, [sp, #24]
	strb	r4, [sp, #25]
	strb	r4, [sp, #26]
	strb	r4, [sp, #27]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	bl	LED_enc
	ldr	r2, [sp, #28]
	mov	r0, r4
	ldr	r3, [r5, #0]
	cmp	r2, r3
	bne	.L181
	add	sp, sp, #36
	pop	{r4, r5, pc}
.L181:
	bl	__stack_chk_fail
.L183:
	.align	2
.L182:
	.word	__stack_chk_guard
	.size	main, .-main
	.global	DEBUG
	.global	RC
	.global	WORDFILTER
	.global	sbox
	.global	MixColMatrix
	.global	LED
	.section	.rodata
	.align	2
.LANCHOR1 = . + 0
	.type	RC, %object
	.size	RC, 48
RC:
	.byte	1
	.byte	3
	.byte	7
	.byte	15
	.byte	31
	.byte	62
	.byte	61
	.byte	59
	.byte	55
	.byte	47
	.byte	30
	.byte	60
	.byte	57
	.byte	51
	.byte	39
	.byte	14
	.byte	29
	.byte	58
	.byte	53
	.byte	43
	.byte	22
	.byte	44
	.byte	24
	.byte	48
	.byte	33
	.byte	2
	.byte	5
	.byte	11
	.byte	23
	.byte	46
	.byte	28
	.byte	56
	.byte	49
	.byte	35
	.byte	6
	.byte	13
	.byte	27
	.byte	54
	.byte	45
	.byte	26
	.byte	52
	.byte	41
	.byte	18
	.byte	36
	.byte	8
	.byte	17
	.byte	34
	.byte	4
	.type	sbox, %object
	.size	sbox, 16
sbox:
	.byte	12
	.byte	5
	.byte	6
	.byte	11
	.byte	9
	.byte	0
	.byte	10
	.byte	13
	.byte	3
	.byte	14
	.byte	15
	.byte	8
	.byte	4
	.byte	7
	.byte	1
	.byte	2
	.type	WORDFILTER, %object
	.size	WORDFILTER, 1
WORDFILTER:
	.byte	15
	.space	3
	.type	MixColMatrix, %object
	.size	MixColMatrix, 16
MixColMatrix:
	.byte	4
	.byte	1
	.byte	2
	.byte	2
	.byte	8
	.byte	6
	.byte	5
	.byte	6
	.byte	11
	.byte	14
	.byte	10
	.byte	9
	.byte	2
	.byte	2
	.byte	15
	.byte	11
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	LED, %object
	.size	LED, 4
LED:
	.word	64
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%02x\000"
	.space	3
.LC1:
	.ascii	"P = \000"
	.space	3
.LC2:
	.ascii	"C = \000"
	.space	3
.LC3:
	.ascii	"\012\000"
	.space	2
.LC4:
	.ascii	"K = \000"
	.bss
	.align	2
	.type	DEBUG, %object
	.size	DEBUG, 4
DEBUG:
	.space	4
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
