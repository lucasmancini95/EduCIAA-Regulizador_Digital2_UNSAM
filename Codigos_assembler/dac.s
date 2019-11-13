	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"dac.c"
	.global	SAMPLES_NUM
	.data
	.align	2
	.type	SAMPLES_NUM, %object
	.size	SAMPLES_NUM, 4
SAMPLES_NUM:
	.word	80
	.text
	.align	2
	.global	Enable_ENAIO
	.syntax unified
	.arm
	.fpu softvfp
	.type	Enable_ENAIO, %function
Enable_ENAIO:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L2
	ldr	r3, .L2
	ldr	r3, [r3, #3216]
	orr	r3, r3, #1
	str	r3, [r2, #3216]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	1074290688
	.size	Enable_ENAIO, .-Enable_ENAIO
	.align	2
	.global	Enable_DMA
	.syntax unified
	.arm
	.fpu softvfp
	.type	Enable_DMA, %function
Enable_DMA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L5
	ldr	r3, .L5
	ldr	r3, [r3, #4]
	orr	r3, r3, #15
	str	r3, [r2, #4]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	1074663424
	.size	Enable_DMA, .-Enable_DMA
	.align	2
	.global	Values_DAC
	.syntax unified
	.arm
	.fpu softvfp
	.type	Values_DAC, %function
Values_DAC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r2, .L8
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #6
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r3, r3, #65536
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	1074663424
	.size	Values_DAC, .-Values_DAC
	.align	2
	.global	cfg_DAC
	.syntax unified
	.arm
	.fpu softvfp
	.type	cfg_DAC, %function
cfg_DAC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	bl	Enable_ENAIO
	ldr	r3, .L11
	str	r3, [fp, #-8]
	ldr	r2, .L11+4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r3, [r2, #8]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	2549
	.word	1074663424
	.size	cfg_DAC, .-cfg_DAC
	.align	2
	.global	cfg_DMA
	.syntax unified
	.arm
	.fpu softvfp
	.type	cfg_DMA, %function
cfg_DMA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	bl	Enable_DMA
	bl	cfg_DAC
	ldr	r3, .L14
	ldr	r3, [r3]
	orr	r3, r3, #-2046820352
	orr	r3, r3, #4718592
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r2, .L14+4
	str	r2, [r3, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #12]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r2, .L14+4
	str	r2, [r3, #4]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #12]
	ldr	r3, .L14+8
	ldr	r2, [fp, #-16]
	add	ip, r3, #256
	mov	r3, r2
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, .L14+8
	ldr	r3, .L14+8
	ldr	r3, [r3, #48]
	orr	r3, r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L14+8
	ldr	r2, .L14+12
	str	r2, [r3, #272]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	SAMPLES_NUM
	.word	1074663424
	.word	1073750016
	.word	35777
	.size	cfg_DMA, .-cfg_DMA
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_dadd
	.global	__aeabi_d2iz
	.align	2
	.global	signal_fill
	.syntax unified
	.arm
	.fpu softvfp
	.type	signal_fill, %function
signal_fill:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #28
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	mov	r2, sp
	mov	r10, r2
	mov	r2, #0
	str	r2, [fp, #-40]
	mov	r2, #80
	str	r2, [fp, #-44]
	ldr	r0, [fp, #-44]
	sub	r2, r0, #1
	str	r2, [fp, #-48]
	mov	r2, r0
	mov	r1, r2
	mov	r2, #0
	lsl	r6, r2, #6
	orr	r6, r6, r1, lsr #26
	lsl	r5, r1, #6
	mov	r2, r0
	mov	r1, r2
	mov	r2, #0
	lsl	r4, r2, #6
	orr	r4, r4, r1, lsr #26
	lsl	r3, r1, #6
	mov	r3, r0
	lsl	r3, r3, #3
	add	r3, r3, #7
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L17
.L18:
	ldr	r3, .L19+32
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [fp, #-40]
	bl	__aeabi_i2d
	adr	r3, .L19
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r0, [fp, #-44]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sin
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r3, r0
	mov	r4, r1
	mov	r5, r4
	mov	r4, r3
	ldr	r3, .L19+36
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [fp, #-40]
	bl	__aeabi_i2d
	adr	r3, .L19+8
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	ldr	r0, [fp, #-44]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sin
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r5, r4
	mov	r4, r3
	ldr	r3, .L19+40
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [fp, #-40]
	bl	__aeabi_i2d
	adr	r3, .L19+16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	ldr	r0, [fp, #-44]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sin
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r5, r4
	mov	r4, r3
	ldr	r3, .L19+44
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [fp, #-40]
	bl	__aeabi_i2d
	adr	r3, .L19+24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r8, r2
	mov	r9, r3
	ldr	r0, [fp, #-44]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sin
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r3, r0
	mov	r4, r1
	mov	r5, r4
	mov	r4, r3
	ldr	r3, .L19+32
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L19+36
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r2, r3
	ldr	r2, .L19+40
	ldrb	r2, [r2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L19+44
	ldrb	r2, [r2]	@ zero_extendqisi2
	add	r3, r3, r2
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_ddiv
	mov	r3, r0
	mov	r4, r1
	ldr	r1, [fp, #-52]
	ldr	r2, [fp, #-40]
	lsl	r2, r2, #3
	add	r2, r1, r2
	stm	r2, {r3-r4}
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r4, r2, r3
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	mov	r2, #0
	ldr	r3, .L19+48
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L19+52
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	lsl	r3, r3, #6
	orr	r3, r3, #65536
	str	r3, [r4]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-60]
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-56]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L17:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	blt	.L18
	mov	sp, r10
	nop
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L20:
	.align	3
.L19:
	.word	603906762
	.word	1075388883
	.word	603906762
	.word	1076437459
	.word	603906762
	.word	1077486035
	.word	603906762
	.word	1078534611
	.word	flag_T1
	.word	flag_T2
	.word	flag_T3
	.word	flag_T4
	.word	1082126336
	.word	1082130432
	.size	signal_fill, .-signal_fill
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
