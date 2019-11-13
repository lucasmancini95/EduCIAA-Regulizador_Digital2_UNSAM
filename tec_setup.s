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
	.file	"tec_setup.c"
	.text
	.align	2
	.global	TEC_cfg
	.syntax unified
	.arm
	.fpu softvfp
	.type	TEC_cfg, %function
TEC_cfg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	mov	r3, #1
	strb	r3, [fp, #-8]
	mov	r3, #0
	strb	r3, [fp, #-9]
	mov	r3, #6
	strb	r3, [fp, #-10]
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
	mov	r3, #0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4
	mov	r3, #0
	strb	r3, [fp, #-5]
	mov	r3, #4
	strb	r3, [fp, #-7]
	b	.L8
.L4:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L6
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #8
	strb	r3, [fp, #-7]
	b	.L8
.L6:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L8
	mov	r3, #2
	strb	r3, [fp, #-5]
	mov	r3, #9
	strb	r3, [fp, #-7]
	b	.L8
.L3:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L7
	mov	r3, #6
	strb	r3, [fp, #-5]
	mov	r3, #1
	strb	r3, [fp, #-6]
	mov	r3, #9
	strb	r3, [fp, #-7]
	b	.L7
.L8:
	nop
.L7:
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldrb	r1, [fp, #-8]	@ zero_extendqisi2
	ldr	r0, .L9
	bl	SCU_SetPin
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldrb	r1, [fp, #-8]	@ zero_extendqisi2
	ldr	r0, .L9
	bl	SCU_SetEZI
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	ldrb	r1, [fp, #-6]	@ zero_extendqisi2
	mov	r3, #0
	ldr	r0, .L9+4
	bl	GPIO_SetPinDIR
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	1074290688
	.word	1074741248
	.size	TEC_cfg, .-TEC_cfg
	.align	2
	.global	TEC_GetState
	.syntax unified
	.arm
	.fpu softvfp
	.type	TEC_GetState, %function
TEC_GetState:
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
	beq	.L12
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L12
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L13
.L12:
	mov	r3, #0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L14
	mov	r3, #4
	strb	r3, [fp, #-6]
	b	.L19
.L14:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L16
	mov	r3, #8
	strb	r3, [fp, #-6]
	b	.L19
.L16:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L19
	mov	r3, #9
	strb	r3, [fp, #-6]
	b	.L19
.L13:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L17
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #9
	strb	r3, [fp, #-6]
	b	.L17
.L19:
	nop
.L17:
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L20
	bl	GPIO_GetPinState
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	1074741248
	.size	TEC_GetState, .-TEC_GetState
	.align	2
	.global	TEC_ALL
	.syntax unified
	.arm
	.fpu softvfp
	.type	TEC_ALL, %function
TEC_ALL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #0
	bl	TEC_cfg
	mov	r0, #1
	bl	TEC_cfg
	mov	r0, #2
	bl	TEC_cfg
	mov	r0, #3
	bl	TEC_cfg
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	TEC_ALL, .-TEC_ALL
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
