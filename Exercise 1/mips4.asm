# Take 5 int as input
# Print all values in reverse way

	.data
array:	.word 0,0,0,0,0
input:	.asciiz "Input the value: "
output:	.asciiz "\nReverse value: "
	.text 
main:
	la $s1, array
	
# $s0 is counting i
# $s1 is array of 5
Loop:	sll $t0, $s0, 2
	add $t0, $t0, $s1
	# Print prompt
	li $v0, 4
	la $a0, input
	syscall
	# Input to array
	li $v0, 5
	syscall
	add $a0, $0, $v0
	# Store in array
	sw $a0, 0($t0)
	# Check if full
	beq $s0, 4, Exit
	# Increase counting by 1
	addi $s0, $s0, 1
	j Loop
Exit: 

# Print in reverse
addi $s0, $0, 4
Rev_Loop: 	sll $t0, $s0, 2
		add $t0, $t0, $s1
		# Print prompt
		li $v0, 4
		la $a0, output
		syscall
		# Print value
		lw $a0, 0($t0)
		li $v0, 1
		syscall
		beq $s0, 0, Rev_Exit
		subi $s0, $s0, 1
		j Rev_Loop
Rev_Exit:
