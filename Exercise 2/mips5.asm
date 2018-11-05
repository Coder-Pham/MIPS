# Reverses an 10 elements integer array
# Init array stores 10 elements and change in reverse order

.data
array:  .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
order:  .asciiz "Init array: "
reverse:.asciiz "\nReverse array: "
space:  .asciiz " "

.text
main:
    la $s1, array
    li $v0, 4
    la $a0, order
    syscall

# $S0 is counting i
Loop_order: sll $t0, $s0, 2
    add $t0, $t0, $s1
    # Print value
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    # Branch if count equals 9
    beq $s0, 9, Exit
    addi $s0, $s0, 1
    j Loop_order
Exit:

# Reverse (Swap 2 elements) - Ascending to 4
addi $s0, $0, 0
addi $s2, $0, 9

Loop_rev:   sll $t0, $s0, 2
            sll $t1, $s2, 2
    # $t0 is index in first half
    add $t0, $t0, $s1
    # $t1 is index in second half
    add $t1, $t1, $s1
    # Swap
    lw $a1, 0($t0)
    lw $a2, 0($t1)
    sw $a1, 0($t1)
    sw $a2, 0($t0)
    # Check exit
    beq $s0, 4, Exit_rev
    # Increase - Decrease indexes
    addi $s0, $s0, 1
    subi $s2, $s2, 1
    j Loop_rev
Exit_rev:

# Print prompt 
li $v0, 4
la $a0, reverse
syscall

addi $s0, $0, 0
Loop_result: sll $t0, $s0, 2
    add $t0, $t0, $s1
    # Print value
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    # Branch if count equals 9
    beq $s0, 9, Exit_result
    addi $s0, $s0, 1
    j Loop_result
Exit_result:
