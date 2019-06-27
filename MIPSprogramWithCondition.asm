.data 
	width: .word 35
	length: .word 43
	choice: .word 1  # 1 for area
	
	prompt: .asciiz "Enter 1 to calculate area or enter any other int except 1 to calculate perimeter\n"
	msgOfArea: .asciiz "\nThe area is "
	msgOfPerimeter: .asciiz "\nThe perimeter is "
		
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
	
	# get user input a string and save in $v0
	li $v0, 5
	syscall 
	
	# if user entered any int but 1 calculate perimeter
	lw $s2, choice
	beq $v0, $s2, calculateArea
	# calculate perimeter
	add $t0, $s0, $s0
	add $t1, $s1, $s1
	add $s3, $t1, $t0    #perimeter is stored in $s3
	
	# print msg about perimter
	li $v0, 4
	la  $a0, msgOfPerimeter
	syscall
	
	b next  # branch around else
	# skip rest of codes untill next: label
	
# calculate area
calculateArea:
	mult $s0, $s1
	mfhi $s4
	mflo $s3  # area is stored in $s3
	
	# print msg about area 
	li $v0, 4
	la $a0, msgOfArea
	syscall
next:
# Run following codes, no matter what
# print perimeter or area
printCalculation:
	li $v0, 1
	move $a0, $s3  # area or peremeter is stored here already
	syscall 
# system exit
exit:
	li $v0, 10
	syscall  
	
