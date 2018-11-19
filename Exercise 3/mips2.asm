# Input a number
# If = 0 then a = b+c
# If = 1 then a = b-c
# If = 2 then a = c-b
# Else print promt

.data
input:  .asciiz "Input value: "
output: .asciiz "Output: "
repeat: .asciiz "please input an another integer numbers\n"
val_b:  .word 10    # $s0
val_c:  .word 5     # $s1

.text
main:
    lw $s0, val_b
    lw $s1, val_c
    li $v0, 4		# $v0 = 4
    la $a0, input
    syscall
    li $v0, 5
    syscall
    add $a0, $0, $v0
    beq	$a0, 0, Case1	# if $a0 == 0 then Case1
    beq $a0, 1, Case2
    beq $a0, 2, Case3
    li $v0, 4 
    la $a0, repeat
    syscall	
    j Exit
Case1:
    li $v0, 4
    la $a0, output
    syscall
    li $v0, 1
    add $a0, $s0, $s1
    syscall
    j Exit
Case2:
    li $v0, 4
    la $a0, output
    syscall
    li $v0, 1
    sub $a0, $s0, $s1
    syscall
    j Exit
Case3:
    li $v0, 4
    la $a0, output
    syscall
    li $v0, 1
    sub $a0, $s1, $s0
    syscall
    j Exit
Exit:
