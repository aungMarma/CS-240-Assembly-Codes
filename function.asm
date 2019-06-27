.data 
	msg: .asciiz "Hello World\n"
.text 
main: 
	# call printMsg
	jal printMsg
	
	
	# terminate the program 
	li $v0, 10
	syscall 
	
	printMsg:
		li $v0, 4
		la $a0, msg 
		syscall 
		jr $ra # return to caller
