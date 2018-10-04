# Take 2 values as int
# Sum of 2 values
# Print result

	.data
first: .asciiz "Input the first integer: "
second: .asciiz "Input the second integer: "
	.text
main:
	# Print 1st request
	li $v0, 4
	la $a0, first
	syscall
	
	# Get 1st
	li $v0, 5
	syscall
	add $a0, $0, $v0
	add $s0, $a0, $0
	
	# Print 2nd request
	li $v0, 4 
	la $a0, second
	syscall
	
	# Get 2nd
	li $v0, 5
	syscall 
	add $a0, $v0, $0
	add $s1, $a0, $0
	
	# Sum 
	add $a0, $s0, $s1
	li $v0, 1
	syscall
	
	jr $ra
	