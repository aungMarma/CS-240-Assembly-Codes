.data 
.text 
	li $s1, 10
	li $s2, 20
	
	# a = s0, b = s1, if(a < b) => a = a + b, else b = a + b
	 		

if1:     
	sub $t1, $s1, $s2  
	bltz $t1, else1
	add $s2, $s1, $s2
     # print
    li $v0, 1
    move $a0, $s2
    syscall 
	b endif1

else1: 
	 add $s1, $s1, $s2
	 li $v0, 1
     move $a0, $s2
     syscall 
     

endif1:

exit:
    li $v0, 10
	syscall 