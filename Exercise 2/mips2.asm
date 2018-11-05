# Declare array of 10 integer
# Calculate all odd elements a[1], a[3], .. a[9]
# Calculate all even elements a[0], a[2], .. a[8]
# Print all results

.data
# Create synthetic array 
array:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
prompt: .asciiz "Value of array: "
space:  .asciiz " "
output_odd: .asciiz "\nSum of odd: "
output_even:.asciiz "\nSum of even: "

.text
main:
    # Assign $s1 is register for array
    la $s1, array
    li $v0, 4
    la $a0, prompt
    syscall

# $s0 is counting i 
# $t0 is result of shift left by 1 in decimal
Loop:   sll $t0, $s0, 2
    # In CPP, a[i] = a + i
    add $t0, $t0, $s1
    # $s2 is sum of even
    # $s3 is sum of odd
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    # AND Bitwise ($a0 && 1)
    # 1 - ODD
    # 0 - EVEN
    andi $t1, $a0, 1
    # Branch If equal Zero, mean EVEN
    beqz $t1, Sum_EVEN
    # If not branch then ODD
    add $s3, $s3, $a0
    # Space between elements
    li $v0, 4
    la $a0, space
    syscall
    # Branch if count equal 9
    beq $s0, 9, Exit
    # Increasing count
    addi $s0, $s0, 1
    j Loop

Sum_EVEN:
    add $s2, $s2, $a0
    # Space between elements
    li $v0, 4
    la $a0, space
    syscall
    # Branch if count equal 9
    beq $s0, 9, Exit
    addi $s0, $s0, 1
    j Loop

Exit:

    # Print EVEN sum
    li $v0, 4
    la $a0, output_even
    syscall
    add $a0, $s2, $0
    li $v0, 1
    syscall

    # Print ODD sum
    li $v0, 4
    la $a0, output_odd
    syscall
    add $a0, $s3, $0
    li $v0, 1
    syscall
