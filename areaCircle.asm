.data 
	pi:	.double		3.14159		#$f2
	radius:	.double		0.0		#$f0
	area:	.double		0.0		#$f12
	
	outMsg:	.asciiz		"The area of the circle is: "
	prompt:	.asciiz		"What is the radius of the circle? "
	
	
	
.text
	main:
		addi $v0, $zero, 4
		la $a0, prompt
		syscall
		# ask user for radius put in $f0
		addi $v0, $zero, 7
		syscall
		#radius is now in $f0
	calculation:
		la $t0, pi  # la loads address, address is always 32 bits
		l.d $f2, ($t0)
		#calculate r squared	
		mul.d $f12, $f0, $f0
		mul.d $f12, $f12, $f2
	output:
		#prints output message
		addi $v0, $zero, 4
		la $a0, outMsg
		syscall
		#this outputs area
		addi $v0, $zero, 3
		syscall
		#this exits the program
		addi $v0, $zero, 10
		syscall
		
		
