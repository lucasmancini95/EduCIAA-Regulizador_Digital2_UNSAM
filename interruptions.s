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
	.file	"interruptions.c"
	.text
	.align	2
	.global	Enable_NVIC
	.syntax unified
	.arm
	.fpu softvfp
	.type	Enable_NVIC, %function
Enable_NVIC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrsb	r3, [fp, #-13]
	cmp	r3, #0
	blt	.L2
	ldrsb	r3, [fp, #-13]
	cmp	r3, #31
	bgt	.L2
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L3
.L2:
	ldrsb	r3, [fp, #-13]
	cmp	r3, #31
	ble	.L6
	ldrsb	r3, [fp, #-13]
	cmp	r3, #63
	bgt	.L6
	mov	r3, #1
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	sub	r3, r3, #32
	and	r3, r3, #255
	strb	r3, [fp, #-13]
.L3:
	ldr	r0, .L7
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r1, .L7
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldr	r1, [r1, r2, lsl #2]
	ldrsb	r2, [fp, #-13]
	mov	ip, #1
	lsl	r2, ip, r2
	orr	r2, r1, r2
	str	r2, [r0, r3, lsl #2]
	b	.L1
.L6:
	nop
.L1:
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	-536813312
	.size	Enable_NVIC, .-Enable_NVIC
	.align	2
	.global	SelectEdge_PIN_INT
	.syntax unified
	.arm
	.fpu softvfp
	.type	SelectEdge_PIN_INT, %function
SelectEdge_PIN_INT:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	bgt	.L11
	ldr	r1, .L12
	ldr	r3, .L12
	ldr	r2, [r3]
	mov	r0, #1
	ldr	r3, [fp, #-8]
	lsl	r3, r0, r3
	mvn	r3, r3
	and	r3, r3, r2
	str	r3, [r1]
.L11:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	1074294784
	.size	SelectEdge_PIN_INT, .-SelectEdge_PIN_INT
	.align	2
	.global	Enable_PIN_INT
	.syntax unified
	.arm
	.fpu softvfp
	.type	Enable_PIN_INT, %function
Enable_PIN_INT:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	bgt	.L15
	ldr	r1, .L16
	ldr	r3, .L16
	ldr	r2, [r3, #8]
	mov	r0, #1
	ldr	r3, [fp, #-8]
	lsl	r3, r0, r3
	orr	r3, r2, r3
	str	r3, [r1, #8]
.L15:
	ldr	r0, [fp, #-8]
	bl	SelectEdge_PIN_INT
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	1074294784
	.size	Enable_PIN_INT, .-Enable_PIN_INT
	.align	2
	.global	Select_GPIO_interrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	Select_GPIO_interrupt, %function
Select_GPIO_interrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strb	r3, [fp, #-13]
	mov	r3, r1
	strb	r3, [fp, #-14]
	mov	r3, r2
	strb	r3, [fp, #-15]
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	lsl	r3, r3, #3
	and	r3, r3, #24
	str	r3, [fp, #-8]
	ldr	r0, .L19
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	lsr	r3, r3, #2
	and	r3, r3, #255
	mov	ip, r3
	ldr	r2, .L19
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	lsr	r3, r3, #2
	and	r3, r3, #255
	add	r3, r3, #896
	ldr	r3, [r2, r3, lsl #2]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	lsl	r2, r2, #5
	and	r1, r2, #255
	ldrb	r2, [fp, #-14]	@ zero_extendqisi2
	and	r2, r2, #31
	orr	r1, r1, r2
	ldr	r2, [fp, #-8]
	lsl	r2, r1, r2
	orr	r2, r3, r2
	add	r3, ip, #896
	str	r2, [r0, r3, lsl #2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	1074290688
	.size	Select_GPIO_interrupt, .-Select_GPIO_interrupt
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
