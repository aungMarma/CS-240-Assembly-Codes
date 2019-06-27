.data 
.text 
	li $s0, 10
	li $s1, 20
	li $s2, 30
	li $s3, 40
	li $s4, 50
	
	#a = b + c;  
    add $s0, $s1, $s2
    #d = a – e;
    sub $s3, $s0, $s4
    
    li $v0, 1
    move $a0, $s3	
    syscall 
    
    li $v0, 10	
    syscall
