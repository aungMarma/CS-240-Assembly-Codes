.data 
.text 
	li $s0, 30
	li $s1, 20
	
	# a = s0, b = s1, if(a < b) => a = a + b
	
	sub $t1, $s0, $s1
	bgez $t1, skipIf
	# else
	add $s0, $s0, $s1
	li $v0, 1
	move $a0, $s0
	syscall 
skipIf:
exit:
    li $v0, 10
	syscall 
    
	
	#slt 
	#div 
	#bge 
	#bltz branch if less than zero
	#
