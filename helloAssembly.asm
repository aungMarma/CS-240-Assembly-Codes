.data 
	myMessage: .asciiz "Hello Asssembly \n"

.text 
li $v0, 4
la $a0, myMessage
syscall