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
	.file	"gpio_set.c"
	.text
	.align	2
	.global	GPIO_SetPinDIR
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO_SetPinDIR, %function
GPIO_SetPinDIR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r0
	strb	r3, [fp, #-9]
	mov	r3, r1
	strb	r3, [fp, #-10]
	mov	r3, r2
	strb	r3, [fp, #-11]
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r1, r1, #2048
	ldr	r3, [r3, r1, lsl #2]
	ldrb	r1, [fp, #-10]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r1, r0, r1
	orr	r1, r3, r1
	ldr	r3, [fp, #-8]
	add	r2, r2, #2048
	str	r1, [r3, r2, lsl #2]
	b	.L4
.L2:
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r1, r1, #2048
	ldr	r3, [r3, r1, lsl #2]
	ldrb	r1, [fp, #-10]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r1, r0, r1
	mvn	r1, r1
	and	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r2, r2, #2048
	str	r1, [r3, r2, lsl #2]
.L4:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIO_SetPinDIR, .-GPIO_SetPinDIR
	.align	2
	.global	GPIO_SetPin
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO_SetPin, %function
GPIO_SetPin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r0
	strb	r3, [fp, #-9]
	mov	r3, r1
	strb	r3, [fp, #-10]
	mov	r3, r2
	strb	r3, [fp, #-11]
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L6
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r1, r1, #2176
	ldr	r3, [r3, r1, lsl #2]
	ldrb	r1, [fp, #-10]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r1, r0, r1
	orr	r1, r3, r1
	ldr	r3, [fp, #-8]
	add	r2, r2, #2176
	str	r1, [r3, r2, lsl #2]
	b	.L8
.L6:
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L8
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r1, r1, #2208
	ldr	r3, [r3, r1, lsl #2]
	ldrb	r1, [fp, #-10]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r1, r0, r1
	orr	r1, r3, r1
	ldr	r3, [fp, #-8]
	add	r2, r2, #2208
	str	r1, [r3, r2, lsl #2]
.L8:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIO_SetPin, .-GPIO_SetPin
	.align	2
	.global	GPIO_GetPinState
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO_GetPinState, %function
GPIO_GetPinState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r3, r1
	strb	r3, [fp, #-9]
	mov	r3, r2
	strb	r3, [fp, #-10]
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	ldr	r1, [fp, #-8]
	lsl	r2, r2, #5
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIO_GetPinState, .-GPIO_GetPinState
	.align	2
	.global	GPIO_TogglePin
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIO_TogglePin, %function
GPIO_TogglePin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r3, r1
	strb	r3, [fp, #-9]
	mov	r3, r2
	strb	r3, [fp, #-10]
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r1, r1, #2240
	ldr	r3, [r3, r1, lsl #2]
	ldrb	r1, [fp, #-10]	@ zero_extendqisi2
	mov	r0, #1
	lsl	r1, r0, r1
	orr	r1, r3, r1
	ldr	r3, [fp, #-8]
	add	r2, r2, #2240
	str	r1, [r3, r2, lsl #2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIO_TogglePin, .-GPIO_TogglePin
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
