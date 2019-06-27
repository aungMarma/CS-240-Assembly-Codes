.data 
	width: .word 23
	length: .word 3245
	choice: .word 0
	
	prompt: .asciiz "What do you like to calculate? Enter 1 for area or another int for perimeter calculation \n"
	newLine: .asciiz "\n"
	msgOfArea: .asciiz "The area is: "
	msgOfPerimeter: .asciiz "The perimeter is: "
		
.text 
.globl main
main:
	# la $s0, width load the address
	#load the value of width variable
	lw $s0, width
	lw $s1, length
	
	# prompt to user
	li $v0, 4
	la $a0, prompt
	syscall 
	
	# get user input, an int and save in $v0
	li $v0, 5
	syscall 
	
	# if user entered 1, calculate area else calculate perimeter
	beq $v0, 1, calculateArea
	
	# calculate perimeter
	add $t0, $s0, $s0
	add $t1, $s1, $s1
	add $s2, $t1, $t0
	# print msg about perimter
	li $v0, 4
	la  $a0, msgOfPerimeter
	syscall
	# print perimeter
	li $v0, 1
	move $a0, $s2
	syscall
	# exit
	li $v0, 10
	syscall  
	
# calculate area
calculateArea:
	mult $s0, $s1
	mfhi $s3
	mflo $s2    # area stored in $v0
	#jr $ra   # can't, since not jal calculateArea, or called as a function
	
	# print msg about area 
	li $v0, 4
	la $a0, msgOfArea  #lw $a0 is not allowed
	syscall
	# print area
	li $v0, 1
	move $a0, $s2
	syscall
	# exit
	li $v0, 10
	syscall  
	