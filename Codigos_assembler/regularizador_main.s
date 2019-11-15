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
	.file	"regularizador_main.c"
	.global	flag_T1
	.bss
	.type	flag_T1, %object
	.size	flag_T1, 1
flag_T1:
	.space	1
	.global	flag_T2
	.type	flag_T2, %object
	.size	flag_T2, 1
flag_T2:
	.space	1
	.global	flag_T3
	.type	flag_T3, %object
	.size	flag_T3, 1
flag_T3:
	.space	1
	.global	flag_T4
	.type	flag_T4, %object
	.size	flag_T4, 1
flag_T4:
	.space	1
	.global	TEC_flag
	.type	TEC_flag, %object
	.size	TEC_flag, 1
TEC_flag:
	.space	1
	.text
	.align	2
	.global	GPIO0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO0_IRQHandler, %function
GPIO0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L2
	ldr	r3, .L2
	ldr	r3, [r3, #36]
	orr	r3, r3, #1
	str	r3, [r2, #36]
	mov	r0, #2
	bl	LED_toggle
	ldr	r3, .L2+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L2+4
	strb	r2, [r3]
	ldr	r3, .L2+8
	mov	r2, #1
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	1074294784
	.word	flag_T1
	.word	TEC_flag
	.size	GPIO0_IRQHandler, .-GPIO0_IRQHandler
	.align	2
	.global	GPIO1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO1_IRQHandler, %function
GPIO1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L5
	ldr	r3, .L5
	ldr	r3, [r3, #36]
	orr	r3, r3, #2
	str	r3, [r2, #36]
	mov	r0, #3
	bl	LED_toggle
	ldr	r3, .L5+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L5+4
	strb	r2, [r3]
	ldr	r3, .L5+8
	mov	r2, #1
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	1074294784
	.word	flag_T2
	.word	TEC_flag
	.size	GPIO1_IRQHandler, .-GPIO1_IRQHandler
	.align	2
	.global	GPIO2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO2_IRQHandler, %function
GPIO2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L8
	ldr	r3, .L8
	ldr	r3, [r3, #36]
	orr	r3, r3, #4
	str	r3, [r2, #36]
	mov	r0, #4
	bl	LED_toggle
	ldr	r3, .L8+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L8+4
	strb	r2, [r3]
	ldr	r3, .L8+8
	mov	r2, #1
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	1074294784
	.word	flag_T3
	.word	TEC_flag
	.size	GPIO2_IRQHandler, .-GPIO2_IRQHandler
	.align	2
	.global	GPIO3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO3_IRQHandler, %function
GPIO3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L11
	ldr	r3, .L11
	ldr	r3, [r3, #36]
	orr	r3, r3, #8
	str	r3, [r2, #36]
	mov	r0, #5
	bl	LED_toggle
	ldr	r3, .L11+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L11+4
	strb	r2, [r3]
	ldr	r3, .L11+8
	mov	r2, #1
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	1074294784
	.word	flag_T4
	.word	TEC_flag
	.size	GPIO3_IRQHandler, .-GPIO3_IRQHandler
	.align	2
	.global	DMA_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMA_IRQHandler, %function
DMA_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L14
	ldr	r3, .L14
	ldr	r3, [r3, #8]
	orr	r3, r3, #1
	str	r3, [r2, #8]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073750016
	.size	DMA_IRQHandler, .-DMA_IRQHandler
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 672
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #672
	bl	TEC_ALL
	bl	LED_ALL
	mov	r0, #0
	bl	Enable_PIN_INT
	mov	r0, #1
	bl	Enable_PIN_INT
	mov	r0, #2
	bl	Enable_PIN_INT
	mov	r0, #3
	bl	Enable_PIN_INT
	mov	r2, #0
	mov	r1, #4
	mov	r0, #0
	bl	Select_GPIO_interrupt
	mov	r2, #1
	mov	r1, #8
	mov	r0, #0
	bl	Select_GPIO_interrupt
	mov	r2, #2
	mov	r1, #9
	mov	r0, #0
	bl	Select_GPIO_interrupt
	mov	r2, #3
	mov	r1, #9
	mov	r0, #1
	bl	Select_GPIO_interrupt
	mov	r0, #32
	bl	Enable_NVIC
	mov	r0, #33
	bl	Enable_NVIC
	mov	r0, #34
	bl	Enable_NVIC
	mov	r0, #35
	bl	Enable_NVIC
	sub	r3, fp, #644
	sub	r2, fp, #324
	sub	r1, fp, #676
	sub	r0, fp, #660
	bl	cfg_DMA
	mov	r0, #2
	bl	Enable_NVIC
.L18:
	ldr	r3, .L19
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L18
	sub	r2, fp, #644
	sub	r3, fp, #324
	mov	r1, r2
	mov	r0, r3
	bl	signal_fill
	ldr	r3, .L19
	mov	r2, #0
	strb	r2, [r3]
	b	.L18
.L20:
	.align	2
.L19:
	.word	TEC_flag
	.size	main, .-main
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
