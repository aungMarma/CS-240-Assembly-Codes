.data 
	msg: .asciiz "The sum of two number: "
.text 
.globl main
main:
	# two arguments
	addi $a0, $zero, 50
	addi $a1, $zero, 50
	jal addTwoNums
	
	# print msg
	li $v0, 4
	la $a0, msg
	syscall 
	
	# print the sum of a0 and a1
	li $v0, 1
	addi $a0, $v1, 0  # sum + 0 to $a0
	syscall 
	
	# terminate the program
	li $v0, 10
	syscall 

 addTwoNums:
 	add $v1, $a0, $a1 
 	jr $ra
 