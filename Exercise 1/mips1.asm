# Take input as 1 int
# Increase value by 1
# Print result

	.data
greeting: .asciiz "Input a integer number: "
	.text
main:
	# Print request
	li	$v0, 4
	la	$a0, greeting
	syscall
	
	# Input integer
	li	$v0, 5
	syscall
	add 	$a0, $0, $v0
	
	# Increase 1
	addi 	$a0, $a0, 1
	
	# Print result
	li 	$v0, 1
	syscall
	
	jr	$ra