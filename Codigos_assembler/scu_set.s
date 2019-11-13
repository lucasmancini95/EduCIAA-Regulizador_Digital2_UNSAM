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
	.file	"scu_set.c"
	.text
	.align	2
	.global	SCU_SetPin
	.syntax unified
	.arm
	.fpu softvfp
	.type	SCU_SetPin, %function
SCU_SetPin:
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
	ldrb	r0, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	ldrb	ip, [fp, #-9]	@ zero_extendqisi2
	ldrb	r1, [fp, #-10]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	lsl	ip, ip, #5
	add	r1, ip, r1
	ldr	r3, [r3, r1, lsl #2]
	ldrb	r1, [fp, #-11]
	orr	r1, r1, #16
	and	r1, r1, #255
	orr	r1, r3, r1
	ldr	r3, [fp, #-8]
	lsl	r0, r0, #5
	add	r2, r0, r2
	str	r1, [r3, r2, lsl #2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SCU_SetPin, .-SCU_SetPin
	.align	2
	.global	SCU_SetEZI
	.syntax unified
	.arm
	.fpu softvfp
	.type	SCU_SetEZI, %function
SCU_SetEZI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
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
	ldr	ip, .L3
	ldrb	r1, [fp, #-9]	@ zero_extendqisi2
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	ldr	lr, .L3
	ldrb	r0, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	lsl	r0, r0, #5
	add	r2, r0, r2
	ldr	r2, [lr, r2, lsl #2]
	ldrb	r0, [fp, #-11]	@ zero_extendqisi2
	mov	lr, #1
	lsl	r0, lr, r0
	orr	r2, r2, r0
	lsl	r1, r1, #5
	add	r3, r1, r3
	str	r2, [ip, r3, lsl #2]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	1074290688
	.size	SCU_SetEZI, .-SCU_SetEZI
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
