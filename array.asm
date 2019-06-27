.data 
	array: .space 12 # 4 bytes for one int, 4 * 3, so 12 bytes for 3 ints

.text 
.globl main
main: 
	# 4, 10, 12 at s0, s1 and s2 in registers
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $s2, $zero, 12
	
	addi $t0, $zero, 0  #clear t0, t0 has 0 value
	sw $s0, array($t0) #array[0] = $s0 or 4
        addi $t0, $t0, 4 # move array pointer 4 bytes or 32 bits
	sw $s1, array($t0) #array[1] = $s1 or 10
	addi $t0, $t0, 4 # move array pointer 4 bytes or 32 bits
	sw $s2, array($t0) #array[2] = $s2 or 12
	
	addi $t0, $zero, 0  #clear t0, t0 has 0 value
	while: 
		beq    $t0, 12, exit   # if equal, exit
		lw $t3, array($t0)
		
		li $v0, 1
		#move $a0, $t3
		addi $a0, $t3, 0
		syscall 
		addi $t0, $t0, 4
		j while	
	
	exit: 
		li $v0, 10
		syscall 
	
