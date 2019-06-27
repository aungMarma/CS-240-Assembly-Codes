.data 
	newLine: .asciiz "\n"
.text 
main:
	addi, $s0, $zero, 10
	jal modifyS0 # call function
	
	# print $s0
	li $v0, 1
	addi $a0, $s0, 0
	syscall 
	
	# print newLine
	li, $v0, 4
	la $a0, newLine
	syscall 
	
	# end
	li $v0, 10
	syscall 
 modifyS0:
     # save #s0 value to the stack
     addi $sp, $sp, -4  # make room for an int in stack
     sw $s0, 0($sp) # store s0 to stack, old value of s0
     addi $s0, $s0, 30  # s0 is modified now
       
       # print $s0 new value
	li $v0, 1
	addi $a0, $s0, 0
	syscall 
	
	# print newLine
	li, $v0, 4
	la $a0, newLine
	syscall 
       
    # old value of s0 to s0
    lw $s0, 0($sp)
    # fix stack
    addi $sp, $sp, 4
    jr $ra   # goto the caller
       
       
