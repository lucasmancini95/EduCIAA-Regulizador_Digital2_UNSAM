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
	.file	"leds_setup.c"
	.global	toggle
	.bss
	.align	2
	.type	toggle, %object
	.size	toggle, 4
toggle:
	.space	4
	.text
	.align	2
	.global	LED_cfg
	.syntax unified
	.arm
	.fpu softvfp
	.type	LED_cfg, %function
LED_cfg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	mov	r3, #2
	strb	r3, [fp, #-9]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L2
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L3
.L2:
	mov	r3, #4
	strb	r3, [fp, #-8]
	mov	r3, #5
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #0
	strb	r3, [fp, #-7]
	b	.L11
.L4:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L6
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #1
	strb	r3, [fp, #-7]
	b	.L11
.L6:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L11
	mov	r3, #2
	strb	r3, [fp, #-5]
	mov	r3, #2
	strb	r3, [fp, #-7]
	b	.L11
.L3:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L8
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L8
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L7
.L8:
	mov	r3, #0
	strb	r3, [fp, #-8]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L9
	mov	r3, #10
	strb	r3, [fp, #-5]
	mov	r3, #0
	strb	r3, [fp, #-6]
	mov	r3, #14
	strb	r3, [fp, #-7]
	b	.L7
.L9:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L10
	mov	r3, #11
	strb	r3, [fp, #-5]
	mov	r3, #1
	strb	r3, [fp, #-6]
	mov	r3, #11
	strb	r3, [fp, #-7]
	b	.L7
.L10:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L7
	mov	r3, #12
	strb	r3, [fp, #-5]
	mov	r3, #1
	strb	r3, [fp, #-6]
	mov	r3, #12
	strb	r3, [fp, #-7]
	b	.L7
.L11:
	nop
.L7:
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldr	r0, .L12
	bl	SCU_SetPin
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	ldrb	r1, [fp, #-6]	@ zero_extendqisi2
	mov	r3, #1
	ldr	r0, .L12+4
	bl	GPIO_SetPinDIR
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	1074290688
	.word	1074741248
	.size	LED_cfg, .-LED_cfg
	.align	2
	.global	LED_high
	.syntax unified
	.arm
	.fpu softvfp
	.type	LED_high, %function
LED_high:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L15
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L15
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L16
.L15:
	mov	r3, #5
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L17
	mov	r3, #0
	strb	r3, [fp, #-6]
	b	.L24
.L17:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L19
	mov	r3, #1
	strb	r3, [fp, #-6]
	b	.L24
.L19:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L24
	mov	r3, #2
	strb	r3, [fp, #-6]
	b	.L24
.L16:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L21
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L21
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L20
.L21:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L22
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #14
	strb	r3, [fp, #-6]
	b	.L20
.L22:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L23
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #11
	strb	r3, [fp, #-6]
	b	.L20
.L23:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L20
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #12
	strb	r3, [fp, #-6]
	b	.L20
.L24:
	nop
.L20:
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrb	r1, [fp, #-5]	@ zero_extendqisi2
	mov	r3, #1
	ldr	r0, .L25
	bl	GPIO_SetPin
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	1074741248
	.size	LED_high, .-LED_high
	.align	2
	.global	LED_low
	.syntax unified
	.arm
	.fpu softvfp
	.type	LED_low, %function
LED_low:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L28
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L28
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L29
.L28:
	mov	r3, #5
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L30
	mov	r3, #0
	strb	r3, [fp, #-6]
	b	.L37
.L30:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L32
	mov	r3, #1
	strb	r3, [fp, #-6]
	b	.L37
.L32:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L37
	mov	r3, #2
	strb	r3, [fp, #-6]
	b	.L37
.L29:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L34
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L34
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L33
.L34:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L35
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #14
	strb	r3, [fp, #-6]
	b	.L33
.L35:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L36
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #11
	strb	r3, [fp, #-6]
	b	.L33
.L36:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L33
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #12
	strb	r3, [fp, #-6]
	b	.L33
.L37:
	nop
.L33:
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrb	r1, [fp, #-5]	@ zero_extendqisi2
	mov	r3, #0
	ldr	r0, .L38
	bl	GPIO_SetPin
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	1074741248
	.size	LED_low, .-LED_low
	.align	2
	.global	LED_toggle
	.syntax unified
	.arm
	.fpu softvfp
	.type	LED_toggle, %function
LED_toggle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L41
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L41
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L42
.L41:
	mov	r3, #5
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L43
	mov	r3, #0
	strb	r3, [fp, #-6]
	b	.L50
.L43:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L45
	mov	r3, #1
	strb	r3, [fp, #-6]
	b	.L50
.L45:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L50
	mov	r3, #2
	strb	r3, [fp, #-6]
	b	.L50
.L42:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L47
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L47
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L46
.L47:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L48
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #14
	strb	r3, [fp, #-6]
	b	.L46
.L48:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L49
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #11
	strb	r3, [fp, #-6]
	b	.L46
.L49:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L46
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #12
	strb	r3, [fp, #-6]
	b	.L46
.L50:
	nop
.L46:
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L51
	bl	GPIO_TogglePin
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	1074741248
	.size	LED_toggle, .-LED_toggle
	.align	2
	.global	LED_ALL
	.syntax unified
	.arm
	.fpu softvfp
	.type	LED_ALL, %function
LED_ALL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #3
	bl	LED_cfg
	mov	r0, #4
	bl	LED_cfg
	mov	r0, #5
	bl	LED_cfg
	mov	r0, #0
	bl	LED_cfg
	mov	r0, #1
	bl	LED_cfg
	mov	r0, #2
	bl	LED_cfg
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	LED_ALL, .-LED_ALL
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
