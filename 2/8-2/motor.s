	.file	1 "motor.c"
	.section .mdebug.abi32
	.previous
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,88,$31		# vars= 64, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$fp,80($sp)
	move	$fp,$sp
	li	$2,72			# 0x48
	sw	$2,16($fp)
	li	$2,69			# 0x45
	sw	$2,20($fp)
	li	$2,76			# 0x4c
	sw	$2,24($fp)
	li	$2,76			# 0x4c
	sw	$2,28($fp)
	li	$2,79			# 0x4f
	sw	$2,32($fp)
	li	$2,10			# 0xa
	sw	$2,36($fp)
	sw	$0,40($fp)
	addiu	$2,$fp,16
	move	$4,$2
	jal	my_print
	nop

$L2:
	li	$2,78			# 0x4e
	sw	$2,16($fp)
	li	$2,85			# 0x55
	sw	$2,20($fp)
	li	$2,77			# 0x4d
	sw	$2,24($fp)
	li	$2,61			# 0x3d
	sw	$2,28($fp)
	sw	$0,32($fp)
	addiu	$2,$fp,16
	move	$4,$2
	jal	my_print
	nop

	jal	my_motor
	nop

	j	$L2
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.align	2
	.globl	my_motor
	.ent	my_motor
my_motor:
	.frame	$fp,96,$31		# vars= 72, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-96
	sw	$31,92($sp)
	sw	$fp,88($sp)
	move	$fp,$sp
	addiu	$2,$fp,20
	move	$4,$2
	jal	my_scan
	nop

	sw	$0,16($fp)
	j	$L5
	nop

$L6:
	addiu	$2,$fp,20
	move	$4,$2
	jal	check
	nop

	beq	$2,$0,$L7
	nop

	lw	$4,16($fp)
	jal	my_print
	nop

	jal	rotate
	nop

	j	$L9
	nop

$L7:
	jal	rotateR
	nop

$L9:
	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
$L5:
	lw	$2,16($fp)
	nop
	sltu	$2,$2,513
	bne	$2,$0,$L6
	nop

	move	$sp,$fp
	lw	$31,92($sp)
	lw	$fp,88($sp)
	addiu	$sp,$sp,96
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_motor
	.size	my_motor, .-my_motor
	.align	2
	.globl	check
	.ent	check
check:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	xori	$2,$2,0x4e
	sltu	$2,$2,1
	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	check
	.size	check, .-check
	.align	2
	.globl	rotate
	.ent	rotate
rotate:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$4,8			# 0x8
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,1			# 0x1
	jal	ext_out
	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	rotate
	.size	rotate, .-rotate
	.align	2
	.globl	rotateR
	.ent	rotateR
rotateR:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	li	$4,1			# 0x1
	jal	ext_out
	nop

	li	$4,2			# 0x2
	jal	ext_out
	nop

	li	$4,4			# 0x4
	jal	ext_out
	nop

	li	$4,8			# 0x8
	jal	ext_out
	nop

	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	rotateR
	.size	rotateR, .-rotateR
	.align	2
	.globl	my_scan
	.ent	my_scan
my_scan:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,780			# 0x30c
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	j	$L19
	nop

$L20:
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
$L19:
	li	$2,784			# 0x310
	lw	$3,0($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L20
	nop

	j	$L22
	nop

$L23:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	beq	$2,$0,$L24
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,27
	beq	$2,$0,$L24
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$3,$2,64
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	j	$L27
	nop

$L24:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	bne	$2,$0,$L28
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,58
	beq	$2,$0,$L28
	nop

	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	j	$L27
	nop

$L28:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,$L31
	nop

	lw	$3,8($fp)
	li	$2,64			# 0x40
	sw	$2,0($3)
	j	$L27
	nop

$L31:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,27			# 0x1b
	bne	$3,$2,$L33
	nop

	lw	$3,8($fp)
	li	$2,91			# 0x5b
	sw	$2,0($3)
	j	$L27
	nop

$L33:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,29			# 0x1d
	bne	$3,$2,$L35
	nop

	lw	$3,8($fp)
	li	$2,93			# 0x5d
	sw	$2,0($3)
	j	$L27
	nop

$L35:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,32
	bne	$2,$0,$L37
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	beq	$2,$0,$L37
	nop

	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	j	$L27
	nop

$L37:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,58			# 0x3a
	bne	$3,$2,$L40
	nop

	lw	$3,8($fp)
	li	$2,63			# 0x3f
	sw	$2,0($3)
	j	$L27
	nop

$L40:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,59			# 0x3b
	bne	$3,$2,$L42
	nop

	lw	$3,8($fp)
	li	$2,61			# 0x3d
	sw	$2,0($3)
	j	$L27
	nop

$L42:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,60			# 0x3c
	bne	$3,$2,$L44
	nop

	lw	$3,8($fp)
	li	$2,59			# 0x3b
	sw	$2,0($3)
	j	$L27
	nop

$L44:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L46
	nop

	lw	$3,8($fp)
	li	$2,58			# 0x3a
	sw	$2,0($3)
	j	$L27
	nop

$L46:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,62			# 0x3e
	bne	$3,$2,$L48
	nop

	lw	$3,8($fp)
	li	$2,10			# 0xa
	sw	$2,0($3)
	j	$L27
	nop

$L48:
	lw	$3,8($fp)
	li	$2,64			# 0x40
	sw	$2,0($3)
$L27:
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,4
	sw	$2,8($fp)
$L22:
	li	$2,784			# 0x310
	lw	$3,0($2)
	lw	$2,8($fp)
	nop
	sw	$3,0($2)
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,62			# 0x3e
	bne	$3,$2,$L23
	nop

	lw	$2,8($fp)
	nop
	sw	$0,0($2)
	li	$2,776			# 0x308
	sw	$0,0($2)
	li	$2,780			# 0x30c
	sw	$0,0($2)
	li	$3,776			# 0x308
	li	$2,1			# 0x1
	sw	$2,0($3)
	li	$2,776			# 0x308
	sw	$0,0($2)
	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_scan
	.size	my_scan, .-my_scan
	.align	2
	.globl	my_print
	.ent	my_print
my_print:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	j	$L53
	nop

$L54:
	li	$2,768			# 0x300
	sw	$0,0($2)
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,65
	bne	$2,$0,$L55
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,91
	beq	$2,$0,$L55
	nop

	li	$3,772			# 0x304
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$2,$2,-64
	sw	$2,0($3)
	j	$L58
	nop

$L55:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,97
	bne	$2,$0,$L59
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,123
	beq	$2,$0,$L59
	nop

	li	$3,772			# 0x304
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	addiu	$2,$2,-96
	sw	$2,0($3)
	j	$L58
	nop

$L59:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	bne	$2,$0,$L62
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,58
	beq	$2,$0,$L62
	nop

	li	$2,772			# 0x304
	lw	$3,8($fp)
	nop
	lw	$3,0($3)
	nop
	sw	$3,0($2)
	j	$L58
	nop

$L62:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,64			# 0x40
	bne	$3,$2,$L65
	nop

	li	$2,772			# 0x304
	sw	$0,0($2)
	j	$L58
	nop

$L65:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,91			# 0x5b
	bne	$3,$2,$L67
	nop

	li	$3,772			# 0x304
	li	$2,27			# 0x1b
	sw	$2,0($3)
	j	$L58
	nop

$L67:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,93			# 0x5d
	bne	$3,$2,$L69
	nop

	li	$3,772			# 0x304
	li	$2,29			# 0x1d
	sw	$2,0($3)
	j	$L58
	nop

$L69:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,32
	bne	$2,$0,$L71
	nop

	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	sltu	$2,$2,48
	beq	$2,$0,$L71
	nop

	li	$2,772			# 0x304
	lw	$3,8($fp)
	nop
	lw	$3,0($3)
	nop
	sw	$3,0($2)
	j	$L58
	nop

$L71:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,63			# 0x3f
	bne	$3,$2,$L74
	nop

	li	$3,772			# 0x304
	li	$2,58			# 0x3a
	sw	$2,0($3)
	j	$L58
	nop

$L74:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,61			# 0x3d
	bne	$3,$2,$L76
	nop

	li	$3,772			# 0x304
	li	$2,59			# 0x3b
	sw	$2,0($3)
	j	$L58
	nop

$L76:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,59			# 0x3b
	bne	$3,$2,$L78
	nop

	li	$3,772			# 0x304
	li	$2,60			# 0x3c
	sw	$2,0($3)
	j	$L58
	nop

$L78:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,58			# 0x3a
	bne	$3,$2,$L80
	nop

	li	$3,772			# 0x304
	li	$2,61			# 0x3d
	sw	$2,0($3)
	j	$L58
	nop

$L80:
	lw	$2,8($fp)
	nop
	lw	$3,0($2)
	li	$2,10			# 0xa
	bne	$3,$2,$L82
	nop

	li	$3,772			# 0x304
	li	$2,62			# 0x3e
	sw	$2,0($3)
	j	$L58
	nop

$L82:
	li	$2,772			# 0x304
	sw	$0,0($2)
$L58:
	li	$3,768			# 0x300
	li	$2,1			# 0x1
	sw	$2,0($3)
	lw	$2,8($fp)
	nop
	addiu	$2,$2,4
	sw	$2,8($fp)
$L53:
	lw	$2,8($fp)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,$L54
	nop

	move	$sp,$fp
	lw	$fp,0($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	my_print
	.size	my_print, .-my_print
	.align	2
	.globl	ext_out
	.ent	ext_out
ext_out:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	li	$3,800			# 0x320
	lw	$2,16($fp)
	nop
	sw	$2,0($3)
	move	$sp,$fp
	lw	$fp,8($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ext_out
	.size	ext_out, .-ext_out
	.ident	"GCC: (GNU) 4.2.0"