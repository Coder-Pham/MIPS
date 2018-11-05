# Receive 10 in numbers from users
# Print sum of all elements

.data
# Create array
array:  .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
prompt: .asciiz "Input value: "
output: .asciiz "Sum of all: "

.text
main:
    # Assign $s1 is register for array
    la $s1, array

# $s0 is counting i
# $t0 is result of shift left by 1 in decimal
Loop:   sll $t0, $s0, 2
    # In CPP, a[i] = a + i
    add $t0, $t0, $s1
    # $s2 is sum
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall
    # Input to array
    li $v0, 5
    syscall
    add $a0, $0, $v0
    # Calculate to $s2
    add $s2, $s2, $a0
    # Check if full
    beq $s0, 9, Exit
    # Increase counting by 1
    addi $s0, $s0, 1
    j Loop
Exit:

    # Print value
    li $v0, 4
    la $a0, output
    syscall
    add $a0, $s2, $0
    li $v0, 1
    syscall