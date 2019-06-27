.data
	Prompt:	.asciiz	"Please enter what factorial (positive integers only): "
	Output: .asciiz "The answer is: "
.text
	Main:
		addi $v0, $zero, 4
		la $a0, Prompt
		syscall
		addi $v0, $zero,5
		syscall
		add $a0,$v0, $zero
		jal Factorial
		# save the return value
		add $s0, $v0, $zero
		
		# output string description
		addi $v0, $zero, 4
		la $a0, Output
		syscall
		# output value
		addi $v0, $zero, 1
		move $a0, $s0
		syscall
		#exit
		addi $v0, $zero, 10
		syscall
	Factorial:
		#save away s registers used
		addi $sp, $sp, -8
		sw $s0, 0($sp)
		sw $ra, 4($sp)
		addi, $t0, $zero, 1
		bne $a0, $t0, RCase
	BaseCase:
		addi $v0, $zero,1
		b return
	RCase:
		#save argument for later
		add $s0, $a0, $zero
		#decrements argument
		addi $a0,$a0,-1
		jal Factorial
		mult $s0, $v0
		mflo $v0
	return:
	#save away s registers used
		lw $s0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		jr $ra

	
