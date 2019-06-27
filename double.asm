.data 
	myNum: .double 3.24256
	zeroDouble: .double 0.0
	half: .double 0.5
	newLine: .asciiz "\n\n"
.text 
	ldc1 $f2, myNum # myNum is store in f2 and f3
	ldc1 $f0, zeroDouble
	
	# print myNum
	li $v0, 3  # code to print double
	add.d $f12, $f2, $f0   #f12 is used as argument to print double
	syscall 
	
	# print newline
	li $v0, 4
	la $a0, newLine
	syscall 
	
	# print  0.5 * 0.5 => 0.25
	ldc1 $f4, half
	li $v0, 3  # code to print doule
	mul.d $f12, $f4, $f4   #f12 is used as argument to print double
	syscall 
	
	
