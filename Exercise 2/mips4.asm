# Declare array with 10 synthetic data elements
# Print request an integer (0 < i < 10)
# Print value of the element at that index

.data
# Create array
array:  .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
request:.asciiz "Input index: "
output: .asciiz "Value: "

.text
main:
    # Assign $s1 is register for array
    la $s1, array
    # Print prompt
    li $v0, 4
    la $a0, request
    syscall
    # Input index
    li $v0, 5
    syscall
    add $a0, $0, $v0
    # Get value by index
    add $s0, $a0, $0
    subi $s0, $s0, 1
    # Similar to loop array
    sll $t0, $s0, 2
    add $t0, $t0, $s1
    lw $a0, 0($t0)
    li $v0, 1
    syscall
