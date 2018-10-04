# Take 4 values as int
# Calculate: f = (a+b) - (c-d-2)
# Calculate: g = (a+b)*3 - (c+d)*2
# Print result

	.data
a:	.asciiz "Input value for a: "
b:	.asciiz "Input value for b: "
c: 	.asciiz "Input value for c: "
d: 	.asciiz	"Input value for d: "
f:	.asciiz "\nValue of f: "
g:	.asciiz "\nValue of g: "
	.text
main:
	# Request 1st
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $a0, $v0, $0
	add $s0, $a0, $0
	
	# Request 2nd
	li $v0, 4
	la $a0, b
	syscall
	li $v0, 5
	syscall
	add $a0, $v0, $0
	add $s1, $a0, $0
	
	# Request 3rd
	li $v0, 4
	la $a0, c
	syscall
	li $v0, 5
	syscall
	add $a0, $v0, $0
	add $s2, $a0, $0
	
	# Request 4th
	li $v0, 4
	la $a0, d
	syscall
	li $v0, 5
	syscall
	add $a0, $v0, $0
	add $s3, $a0, $0
	
	# Calculate f
	li $v0, 4
	la $a0, f
	syscall
	
	add $t0, $s0, $s1
	sub $t1, $s2, $s3
	sub $t0, $t0, $t1
	addi $a0, $t0, 2
	
	li $v0, 1
	syscall 
	
	# Calculate g
	li $v0, 4
	la $a0, g
	syscall
	
	add $t0, $s0, $s1
	add $t1, $s2, $s3
	mul $t0, $t0, 3
	mul $t1, $t1, 2
	sub $a0, $t0, $t1
	
	li $v0, 1
	syscall 
	
	jr $ra		