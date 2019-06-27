.data 
	newLine: .asciiz "\t"  # just a tab line
.text 
	# loop init
	li $t0, 10       # loop ten time
	li $t1, 2        # loop counter start at 2, cause we do first two fibs without loop
	# two variables for fib numbers
	# fibs 1, 1, 2, 3, 5, 8, ...
	li $t2, 1
	li $t3, 1
	li $t4, 0 # for temp
	
	# print first two fibs
	li $v0, 1        # system call code for print integer
	move $a0, $t2    # set the content of t2 to a0
	syscall          # print the content of $a0
	
	li $v0, 4        # system call code for print string
	la $a0, newLine  # set the content of t2 to a0
	syscall          # print the content of $a0

	li $v0, 1        # system call code for print integer
	move $a0, $t3    # set the content of t2 to a0
	syscall          # print the content of $a0
	
	li $v0, 4        # system call code for print string
	la $a0, newLine  # set the content of t2 to a0
	syscall          # print the content of $a0
loop:
	# if t1 == t0/10 done with looping
	beq $t1, $t0, loopEnd
	
	# suppose t3 = 3, t2 = 2,
	# t4 = 3, t3 = 5 ( 3 + 2), t2 = 3
	move $t4, $t3  #hold t3
	add $t3, $t3, $t2
	move $t2, $t4  #pass t3 to t2
	
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	#increment loop counter and branch to loop
	addi $t1, $t1, 1
	b loop
loopEnd: 
	li $v0, 10       # system call to exit, give control back to OS
	syscall  
	
	