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
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"led-bytes.c"
	.global	LED
	.data
	.align	2
	.type	LED, %object
	.size	LED, 4
LED:
	.word	64
	.global	MixColMatrix
	.section	.rodata
	.align	2
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
	.global	sbox
	.align	2
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
	.global	WORDFILTER
	.type	WORDFILTER, %object
	.size	WORDFILTER, 1
WORDFILTER:
	.byte	15
	.global	RC
	.align	2
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
	.global	DEBUG
	.bss
	.align	2
	.type	DEBUG, %object
	.size	DEBUG, 4
DEBUG:
	.space	4
	.text
	.align	2
	.global	FieldMult
	.thumb
	.thumb_func
	.type	FieldMult, %function
FieldMult:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	mov	r2, r0
	mov	r3, r1
	strb	r2, [r7, #7]
	strb	r3, [r7, #6]
	mov	r3, #3
	strb	r3, [r7, #15]
	ldrb	r3, [r7, #7]
	strb	r3, [r7, #13]
	mov	r3, #0
	strb	r3, [r7, #14]
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L2
.L6:
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	ldr	r3, [r7, #8]
	asr	r3, r2, r3
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L3
	ldrb	r2, [r7, #14]
	ldrb	r3, [r7, #13]
	eors	r3, r3, r2
	strb	r3, [r7, #14]
.L3:
	ldrb	r3, [r7, #13]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L4
	ldrb	r3, [r7, #13]
	lsl	r3, r3, #1
	strb	r3, [r7, #13]
	ldrb	r2, [r7, #13]
	ldrb	r3, [r7, #15]
	eors	r3, r3, r2
	strb	r3, [r7, #13]
	b	.L5
.L4:
	ldrb	r3, [r7, #13]
	lsl	r3, r3, #1
	strb	r3, [r7, #13]
.L5:
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L2:
	ldr	r3, [r7, #8]
	cmp	r3, #3
	ble	.L6
	movw	r3, #:lower16:WORDFILTER
	movt	r3, #:upper16:WORDFILTER
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldrb	r3, [r7, #14]
	ands	r3, r3, r2
	uxtb	r3, r3
	mov	r0, r3
	add	r7, r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	.size	FieldMult, .-FieldMult
	.global	__aeabi_idivmod
	.align	2
	.global	AddKey
	.thumb
	.thumb_func
	.type	AddKey, %function
AddKey:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L8
.L11:
	mov	r3, #0
	str	r3, [r7, #20]
	b	.L9
.L10:
	ldr	r3, [r7, #16]
	lsl	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r4, r2, r3
	ldr	r3, [r7, #16]
	lsl	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r2, r2, r3
	ldr	r3, [r7, #20]
	adds	r3, r2, r3
	ldrb	r5, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [r7, #4]
	lsl	r2, r3, #2
	ldr	r3, [r7, #16]
	adds	r3, r2, r3
	lsl	r2, r3, #2
	ldr	r3, [r7, #20]
	adds	r2, r2, r3
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r3, [r3, #0]
	add	r1, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r1
	asr	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	ldr	r2, [r7, #8]
	adds	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	eors	r3, r3, r5
	uxtb	r2, r3
	ldr	r3, [r7, #20]
	adds	r3, r4, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
.L9:
	ldr	r3, [r7, #20]
	cmp	r3, #3
	ble	.L10
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L8:
	ldr	r3, [r7, #16]
	cmp	r3, #3
	ble	.L11
	add	r7, r7, #24
	mov	sp, r7
	pop	{r4, r5, r7, pc}
	.size	AddKey, .-AddKey
	.align	2
	.global	AddConstants
	.thumb
	.thumb_func
	.type	AddConstants, %function
AddConstants:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r3, [r7, #4]
	add	r3, r3, #4
	ldr	r2, [r7, #4]
	add	r2, r2, #4
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r2, #1
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	add	r3, r3, #8
	ldr	r2, [r7, #4]
	add	r2, r2, #8
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r2, #2
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	add	r3, r3, #12
	ldr	r2, [r7, #4]
	add	r2, r2, #12
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	eor	r2, r2, #3
	uxtb	r2, r2
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	uxtb	r2, r3
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r3, [r3, #0]
	asr	r3, r3, #4
	uxtb	r3, r3
	and	r3, r3, #15
	uxtb	r3, r3
	eors	r3, r3, r2
	uxtb	r3, r3
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #4]
	add	r2, r3, #4
	ldr	r3, [r7, #4]
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	uxtb	r1, r3
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r3, [r3, #0]
	asr	r3, r3, #4
	uxtb	r3, r3
	and	r3, r3, #15
	uxtb	r3, r3
	eors	r3, r3, r1
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r2, #0]
	ldr	r3, [r7, #4]
	add	r2, r3, #8
	ldr	r3, [r7, #4]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	uxtb	r1, r3
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r3, [r3, #0]
	uxtb	r3, r3
	and	r3, r3, #15
	uxtb	r3, r3
	eors	r3, r3, r1
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r2, #0]
	ldr	r3, [r7, #4]
	add	r2, r3, #12
	ldr	r3, [r7, #4]
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	uxtb	r1, r3
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r3, [r3, #0]
	uxtb	r3, r3
	and	r3, r3, #15
	uxtb	r3, r3
	eors	r3, r3, r1
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r2, #0]
	movw	r3, #:lower16:RC
	movt	r3, #:upper16:RC
	ldr	r2, [r7, #0]
	adds	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	lsr	r3, r3, #3
	uxtb	r3, r3
	and	r3, r3, #7
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	ldrb	r3, [r7, #15]
	eors	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #1]
	ldr	r3, [r7, #4]
	add	r3, r3, #8
	ldr	r2, [r7, #4]
	add	r2, r2, #8
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r7, #15]
	eors	r2, r2, r1
	uxtb	r2, r2
	strb	r2, [r3, #1]
	movw	r3, #:lower16:RC
	movt	r3, #:upper16:RC
	ldr	r2, [r7, #0]
	adds	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #7
	strb	r3, [r7, #15]
	ldr	r3, [r7, #4]
	add	r3, r3, #4
	ldr	r2, [r7, #4]
	add	r2, r2, #4
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r7, #15]
	eors	r2, r2, r1
	uxtb	r2, r2
	strb	r2, [r3, #1]
	ldr	r3, [r7, #4]
	add	r3, r3, #12
	ldr	r2, [r7, #4]
	add	r2, r2, #12
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r7, #15]
	eors	r2, r2, r1
	uxtb	r2, r2
	strb	r2, [r3, #1]
	add	r7, r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	.size	AddConstants, .-AddConstants
	.align	2
	.global	SubCell
	.thumb
	.thumb_func
	.type	SubCell, %function
SubCell:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L14
.L17:
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L15
.L16:
	ldr	r3, [r7, #8]
	lsl	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r1, r2, r3
	ldr	r3, [r7, #8]
	lsl	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r2, r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	movw	r3, #:lower16:sbox
	movt	r3, #:upper16:sbox
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L15:
	ldr	r3, [r7, #12]
	cmp	r3, #3
	ble	.L16
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L14:
	ldr	r3, [r7, #8]
	cmp	r3, #3
	ble	.L17
	add	r7, r7, #20
	mov	sp, r7
	pop	{r7}
	bx	lr
	.size	SubCell, .-SubCell
	.align	2
	.global	ShiftRow
	.thumb
	.thumb_func
	.type	ShiftRow, %function
ShiftRow:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #20]
	mov	r3, #1
	str	r3, [r7, #8]
	b	.L19
.L24:
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L20
.L21:
	ldr	r3, [r7, #8]
	lsl	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r2, r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	add	r1, r7, #16
	ldr	r3, [r7, #12]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L20:
	ldr	r3, [r7, #12]
	cmp	r3, #3
	ble	.L21
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L22
.L23:
	ldr	r3, [r7, #8]
	lsl	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r1, r2, r3
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	adds	r2, r2, r3
	asr	r3, r2, #31
	lsr	r3, r3, #30
	adds	r2, r2, r3
	and	r2, r2, #3
	subs	r3, r2, r3
	add	r2, r7, #24
	adds	r3, r2, r3
	ldrb	r2, [r3, #-8]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L22:
	ldr	r3, [r7, #12]
	cmp	r3, #3
	ble	.L23
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L19:
	ldr	r3, [r7, #8]
	cmp	r3, #3
	ble	.L24
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #20]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L25
	bl	__stack_chk_fail
.L25:
	add	r7, r7, #24
	mov	sp, r7
	pop	{r7, pc}
	.size	ShiftRow, .-ShiftRow
	.align	2
	.global	MixColumn
	.thumb
	.thumb_func
	.type	MixColumn, %function
MixColumn:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #28]
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L27
.L34:
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L28
.L31:
	mov	r3, #0
	strb	r3, [r7, #23]
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L29
.L30:
	movw	r3, #:lower16:MixColMatrix
	movt	r3, #:upper16:MixColMatrix
	ldr	r2, [r7, #8]
	lsl	r1, r2, #2
	ldr	r2, [r7, #16]
	adds	r2, r1, r2
	adds	r3, r3, r2
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [r7, #16]
	lsl	r3, r3, #2
	ldr	r1, [r7, #4]
	adds	r1, r1, r3
	ldr	r3, [r7, #12]
	adds	r3, r1, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	FieldMult
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [r7, #23]
	eors	r3, r3, r2
	strb	r3, [r7, #23]
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L29:
	ldr	r3, [r7, #16]
	cmp	r3, #3
	ble	.L30
	add	r2, r7, #24
	ldr	r3, [r7, #8]
	adds	r3, r2, r3
	ldrb	r2, [r7, #23]
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L28:
	ldr	r3, [r7, #8]
	cmp	r3, #3
	ble	.L31
	mov	r3, #0
	str	r3, [r7, #8]
	b	.L32
.L33:
	ldr	r3, [r7, #8]
	lsl	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r1, r2, r3
	add	r2, r7, #24
	ldr	r3, [r7, #8]
	adds	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #8]
	add	r3, r3, #1
	str	r3, [r7, #8]
.L32:
	ldr	r3, [r7, #8]
	cmp	r3, #3
	ble	.L33
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L27:
	ldr	r3, [r7, #12]
	cmp	r3, #3
	ble	.L34
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #28]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L35
	bl	__stack_chk_fail
.L35:
	add	r7, r7, #32
	mov	sp, r7
	pop	{r7, pc}
	.size	MixColumn, .-MixColumn
	.align	2
	.global	LED80_enc
	.thumb
	.thumb_func
	.type	LED80_enc, %function
LED80_enc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	ldr	r0, [r7, #4]
	ldr	r1, [r7, #0]
	mov	r2, #80
	bl	LED_enc
	add	r7, r7, #8
	mov	sp, r7
	pop	{r7, pc}
	.size	LED80_enc, .-LED80_enc
	.align	2
	.global	LED_enc
	.thumb
	.thumb_func
	.type	LED_enc, %function
LED_enc:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #84
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #76]
	mov	r3, #0
	str	r3, [r7, #32]
	b	.L38
.L41:
	ldr	r3, [r7, #32]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L39
	ldr	r3, [r7, #32]
	add	r2, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #2
	mov	r1, r3
	ldr	r2, [r7, #32]
	asr	r3, r2, #31
	lsr	r3, r3, #30
	adds	r2, r2, r3
	and	r2, r2, #3
	subs	r3, r2, r3
	ldr	r2, [r7, #32]
	asr	r2, r2, #1
	ldr	r0, [r7, #12]
	adds	r2, r0, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	and	r2, r2, #15
	uxtb	r2, r2
	lsl	r1, r1, #2
	add	r0, r7, #80
	adds	r1, r0, r1
	adds	r3, r1, r3
	sub	r3, r3, #64
	strb	r2, [r3, #0]
	b	.L40
.L39:
	ldr	r3, [r7, #32]
	add	r2, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #2
	mov	r1, r3
	ldr	r2, [r7, #32]
	asr	r3, r2, #31
	lsr	r3, r3, #30
	adds	r2, r2, r3
	and	r2, r2, #3
	subs	r3, r2, r3
	ldr	r2, [r7, #32]
	asr	r2, r2, #1
	ldr	r0, [r7, #12]
	adds	r2, r0, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	lsr	r2, r2, #4
	uxtb	r2, r2
	lsl	r1, r1, #2
	add	ip, r7, #80
	add	r1, ip, r1
	adds	r3, r1, r3
	sub	r3, r3, #64
	strb	r2, [r3, #0]
.L40:
	ldr	r3, [r7, #32]
	add	r3, r3, #1
	str	r3, [r7, #32]
.L38:
	ldr	r3, [r7, #32]
	cmp	r3, #15
	ble	.L41
	add	r3, r7, #44
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r3, #0
	str	r3, [r7, #32]
	b	.L42
.L45:
	ldr	r3, [r7, #32]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L43
	ldr	r3, [r7, #32]
	asr	r3, r3, #1
	ldr	r2, [r7, #8]
	adds	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	and	r3, r3, #15
	uxtb	r2, r3
	add	r1, r7, #44
	ldr	r3, [r7, #32]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	b	.L44
.L43:
	ldr	r3, [r7, #32]
	asr	r3, r3, #1
	ldr	r2, [r7, #8]
	adds	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	lsr	r3, r3, #4
	uxtb	r2, r3
	add	r1, r7, #44
	ldr	r3, [r7, #32]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
.L44:
	ldr	r3, [r7, #32]
	add	r3, r3, #1
	str	r3, [r7, #32]
.L42:
	ldr	r3, [r7, #4]
	add	r2, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #2
	mov	r2, r3
	ldr	r3, [r7, #32]
	cmp	r2, r3
	bgt	.L45
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r2, [r7, #4]
	str	r2, [r3, #0]
	mov	r3, #48
	str	r3, [r7, #36]
	movw	r3, #:lower16:LED
	movt	r3, #:upper16:LED
	ldr	r3, [r3, #0]
	cmp	r3, #64
	bgt	.L46
	mov	r3, #32
	str	r3, [r7, #36]
.L46:
	add	r2, r7, #16
	add	r3, r7, #44
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	bl	AddKey
	mov	r3, #0
	str	r3, [r7, #32]
	b	.L47
.L50:
	mov	r3, #0
	str	r3, [r7, #40]
	b	.L48
.L49:
	ldr	r3, [r7, #32]
	lsl	r2, r3, #2
	ldr	r3, [r7, #40]
	adds	r3, r2, r3
	add	r2, r7, #16
	mov	r0, r2
	mov	r1, r3
	bl	AddConstants
	add	r3, r7, #16
	mov	r0, r3
	bl	SubCell
	add	r3, r7, #16
	mov	r0, r3
	bl	ShiftRow
	add	r3, r7, #16
	mov	r0, r3
	bl	MixColumn
	ldr	r3, [r7, #40]
	add	r3, r3, #1
	str	r3, [r7, #40]
.L48:
	ldr	r3, [r7, #40]
	cmp	r3, #3
	ble	.L49
	ldr	r3, [r7, #32]
	add	r3, r3, #1
	add	r1, r7, #16
	add	r2, r7, #44
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	AddKey
	ldr	r3, [r7, #32]
	add	r3, r3, #1
	str	r3, [r7, #32]
.L47:
	ldr	r3, [r7, #36]
	add	r2, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #2
	mov	r2, r3
	ldr	r3, [r7, #32]
	cmp	r2, r3
	bgt	.L50
	mov	r3, #0
	str	r3, [r7, #32]
	b	.L51
.L52:
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #12]
	adds	r1, r2, r3
	ldr	r3, [r7, #32]
	lsl	r3, r3, #1
	add	r2, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #2
	mov	r0, r3
	ldr	r3, [r7, #32]
	lsl	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #30
	adds	r2, r2, r3
	and	r2, r2, #3
	subs	r3, r2, r3
	lsl	r2, r0, #2
	add	r0, r7, #80
	adds	r2, r0, r2
	adds	r3, r2, r3
	sub	r3, r3, #64
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	lsl	r3, r3, #4
	uxtb	r0, r3
	ldr	r3, [r7, #32]
	lsl	r3, r3, #1
	add	r3, r3, #1
	add	r2, r3, #3
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #2
	mov	r4, r3
	ldr	r3, [r7, #32]
	lsl	r3, r3, #1
	add	r2, r3, #1
	asr	r3, r2, #31
	lsr	r3, r3, #30
	adds	r2, r2, r3
	and	r2, r2, #3
	subs	r3, r2, r3
	lsl	r2, r4, #2
	add	ip, r7, #80
	add	r2, ip, r2
	adds	r3, r2, r3
	sub	r3, r3, #64
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	uxtb	r3, r3
	and	r3, r3, #15
	uxtb	r3, r3
	mov	r2, r0
	orrs	r3, r3, r2
	uxtb	r3, r3
	uxtb	r3, r3
	strb	r3, [r1, #0]
	ldr	r3, [r7, #32]
	add	r3, r3, #1
	str	r3, [r7, #32]
.L51:
	ldr	r3, [r7, #32]
	cmp	r3, #7
	ble	.L52
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #76]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L53
	bl	__stack_chk_fail
.L53:
	add	r7, r7, #84
	mov	sp, r7
	pop	{r4, r7, pc}
	.size	LED_enc, .-LED_enc
	.section	.rodata
	.align	2
.LC0:
	.ascii	"K = \000"
	.align	2
.LC1:
	.ascii	"%02x\000"
	.align	2
.LC2:
	.ascii	"P = \000"
	.align	2
.LC3:
	.ascii	"C = \000"
	.align	2
.LC4:
	.ascii	"\012\000"
	.text
	.align	2
	.global	TestVectors
	.thumb
	.thumb_func
	.type	TestVectors, %function
TestVectors:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #56
	add	r7, sp, #0
	str	r0, [r7, #4]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #52]
	mov	r3, #1
	str	r3, [r7, #12]
	b	.L55
.L66:
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L56
.L57:
	bl	rand
	mov	r3, r0
	uxtb	r2, r3
	add	r1, r7, #36
	ldr	r3, [r7, #16]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	add	r2, r7, #36
	ldr	r3, [r7, #16]
	adds	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	add	r1, r7, #44
	ldr	r3, [r7, #16]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L56:
	ldr	r3, [r7, #16]
	cmp	r3, #7
	ble	.L57
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L58
.L59:
	bl	rand
	mov	r3, r0
	uxtb	r2, r3
	add	r1, r7, #20
	ldr	r3, [r7, #16]
	adds	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L58:
	ldr	r3, [r7, #16]
	cmp	r3, #15
	ble	.L59
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	mov	r0, r3
	bl	printf
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L60
.L61:
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	add	r1, r7, #20
	ldr	r2, [r7, #16]
	adds	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	printf
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L60:
	ldr	r3, [r7, #4]
	add	r2, r3, #7
	cmp	r3, #0
	it	lt
	movlt	r3, r2
	asr	r3, r3, #3
	mov	r2, r3
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bgt	.L61
	mov	r0, #10
	bl	putchar
	movw	r3, #:lower16:.LC2
	movt	r3, #:upper16:.LC2
	mov	r0, r3
	bl	printf
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L62
.L63:
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	add	r1, r7, #36
	ldr	r2, [r7, #16]
	adds	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	printf
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L62:
	ldr	r3, [r7, #16]
	cmp	r3, #7
	ble	.L63
	mov	r0, #10
	bl	putchar
	add	r2, r7, #44
	add	r3, r7, #20
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [r7, #4]
	bl	LED_enc
	movw	r3, #:lower16:.LC3
	movt	r3, #:upper16:.LC3
	mov	r0, r3
	bl	printf
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L64
.L65:
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	add	r1, r7, #44
	ldr	r2, [r7, #16]
	adds	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	printf
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L64:
	ldr	r3, [r7, #16]
	cmp	r3, #7
	ble	.L65
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	puts
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L55:
	ldr	r3, [r7, #12]
	cmp	r3, #9
	ble	.L66
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #52]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L67
	bl	__stack_chk_fail
.L67:
	add	r7, r7, #56
	mov	sp, r7
	pop	{r7, pc}
	.size	TestVectors, .-TestVectors
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7, #0]
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r3, [r3, #0]
	str	r3, [r7, #36]
	mov	r3, #0
	strb	r3, [r7, #28]
	mov	r3, #0
	strb	r3, [r7, #29]
	mov	r3, #0
	strb	r3, [r7, #30]
	mov	r3, #0
	strb	r3, [r7, #31]
	mov	r3, #0
	strb	r3, [r7, #32]
	mov	r3, #0
	strb	r3, [r7, #33]
	mov	r3, #0
	strb	r3, [r7, #34]
	mov	r3, #0
	strb	r3, [r7, #35]
	add	r3, r7, #12
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	add	r2, r7, #28
	add	r3, r7, #12
	mov	r0, r2
	mov	r1, r3
	mov	r2, #64
	bl	LED_enc
	mov	r3, #0
	mov	r0, r3
	movw	r3, #:lower16:__stack_chk_guard
	movt	r3, #:upper16:__stack_chk_guard
	ldr	r2, [r7, #36]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L69
	bl	__stack_chk_fail
.L69:
	add	r7, r7, #40
	mov	sp, r7
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
