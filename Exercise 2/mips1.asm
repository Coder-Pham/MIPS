# Take 10 input
# Calculate the sum of all array elements
# Print result to terminal

.data
# Create empty array with 0
array:	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
prompt:	.asciiz "Value of array: "
space: 	.asciiz " "
output:	.asciiz "\nSum of all: "

.text 
main:
	# Assign $s1 is register for array
	la $s1, array
	li $v0, 4
	la $a0, prompt
	syscall
	
# $t0 is counting i
# t0 is result of shift left by 1 in decimal
Loop_Out: sll $t0, $s0, 2
	# In CPP, a[i] = a + i
	add $t0, $t0, $s1
	# Print value and sum
	# $s2 is sum
	lw $a0, 0($t0)
	add $s2, $s2, $a0
	li $v0, 1
	syscall
	# Space between elements
	li $v0, 4
	la $a0, space
	syscall
	# Branch if count equal 9
	beq $s0, 9, Exit
	# Increasing count
	addi $s0, $s0, 1
	j Loop_Out
Exit:

	# Print sum
	li $v0, 4
	la $a0, output
	syscall
	add $a0, $s2, $0
	li $v0, 1
	syscall