.data
    prompt: .asciiz "Which number in the Fibonacci sequence do you want? \n"
    result: .asciiz "The number you asked for is "
    invalidInput: .asciiz  "Invalid entry"
.text
.globl main
main:
    # show prompt
    li $v0, 4
    la $a0, prompt
    syscall
    # read x
    li $v0, 5
    syscall
    
    # if input is valid, findFibonacci of that input
    bgt $v0, 0, findFibonacci
    # invalid input
    li $v0, 4
    la $a0, invalidInput
    syscall
    b next # escape all the codes up to next-label

# just a label, not a function
findFibonacci:    
    # move user input to $a0, and call fibonacci function
    move $a0, $v0
    jal fibonacci   # jump fibonacci function and save next instruction to $ra
    
    # save the calculated factorial number in $to, so $v0 can code to print string
    # at this point fibonacci number of user's valid input would be stored in $v0
    move $t0, $v0
    
    # print a msg about the output
    li  $v0, 4
    la  $a0, result
    syscall
    
    # print the result
    li  $v0, 1
    move  $a0, $t0
    syscall
    # b next # no needed, next label gets executed anyway
 
# exit, gives control back to 0S  
next:
    li $v0, 10
    syscall

# fibonacci function/procedure
fibonacci:
    # if (n  > 1) goto recursion
    bgt $a0,1, recursiveCase
    # base case, n == 1
    move $v0,$a0
	jr $ra
	
	recursiveCase:
		# add $sp,$sp,-12 # We need to store 3 registers to stack
		sub $sp,$sp,12 	# We need to store 3 registers to stack
		sw  $ra,0($sp) 	# $ra is the first register
		sw  $a0,4($sp)	# $a0 is the second register, we cannot assume
		# $a registers will not be over written by callee
	
		# fib(n-1)
		addi $a0,$a0,-1
		jal fibonacci
	
		sw $v0,8($sp)  # store $v0,the third register to be stored on the stack so it doesn't get over written by callee
		lw $a0,4($sp)  # retrieve original value of n 
	
		#fib(n-2)
		addi $a0,$a0,-2
		jal fibonacci
	
		# finally restore sp and return the fin(n) => fib(n) + fib(n - 2)
		b restoreStack

# restore stack and return
restoreStack:	
	lw $t0,8($sp) 	 # retrieve first function result
	add $v0,$v0,$t0  # fib(n) + fib(n - 2)
	lw $ra,0($sp) 	 # retrieve return address, so it can go back to appropriate place
	addi $sp,$sp,12  # restore stack
	jr $ra           # return
