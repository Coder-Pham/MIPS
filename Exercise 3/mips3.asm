# Declare 10 synthetic data elements
# Input a number
# Find it in array and print its index

.data
array:  .word   1,2,3,4,5,6,7,8,9,10
input:  .asciiz "Input value: "
index:  .asciiz "Index of input: "
nexist: .asciiz "Not exist"

.text
main:
    la $s1, array
    # Print prompt
    li $v0, 4
    la $a0, input
    syscall
    # Take input
    li $v0, 5
    syscall
    add $a0, $0, $v0
Loop:   sll $t0, $s0, 2
    add $t0, $t0, $s1
    lw $s2, 0($t0)
    beq $a0, $s2, FOUND
    beq $s0, 9, Exit
    add $s0, $s0, 1
    j Loop
FOUND:  li $v0, 4
        la $a0, index
        syscall
        add $a0, $s0, $0
        li, $v0, 1
        syscall
        j Out
Exit:   li $v0, 4
        la $a0, nexist
        syscall
Out: