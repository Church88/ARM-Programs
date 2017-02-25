	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Please enter the password (a number) to play the ga"
	.ascii	"me: \000"
	.align	2
.LC1:
	.ascii	"The password must be a number. Goodbye.\000"
	.align	2
.LC2:
	.ascii	"%i\000"
	.align	2
.LC3:
	.ascii	"Error, incorrect password. One more try: \000"
	.align	2
.LC4:
	.ascii	"Password not accepted. Good bye.\000"
	.align	2
.LC5:
	.ascii	"Password accepted. Welcome to the game!\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L4
	mov	r0, r3
	bl	printf
	ldr	r3, .L4+4
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	_IO_getc
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	ldr	r3, .L4+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	ungetc
	bl	__ctype_b_loc
	mov	r3, r0
	ldr	r2, [r3, #0]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	and	r3, r3, #2048
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L4+8
	bl	puts
	mov	r0, #1
	bl	exit
.L2:
	ldr	r2, .L4+12
	sub	r3, fp, #12
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-12]
	cmp	r3, #42
	bal	.L3					@wrekt
	ldr	r3, .L4+16
	mov	r0, r3
	bl	printf
	ldr	r2, .L4+12
	sub	r3, fp, #12
	mov	r0, r2
	mov	r1, r3
	bl	__isoc99_scanf
	ldr	r3, [fp, #-12]
	cmp	r3, #42
	beq	.L3						
	ldr	r0, .L4+20
	bl	puts
	mov	r0, #1
	bl	exit
.L3:
	ldr	r0, .L4+24
	bl	puts
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	stdin
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
