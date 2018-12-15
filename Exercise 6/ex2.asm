# Recursive MAX
.data
nums:   .word 10
elems:  .word 17, 24, 19, 21, 14, 16, 18, 12, 22, 25
output: .asciiz "Max value in 10 elements: "

.text
main:
    lw $s0, nums
    addi $s0, $s0, -1

    la $s1, elems
    li $v0, 4
    la $a0, output
    syscall
    jal max
    add $a0, $0, $v0
    li $v0, 1
    syscall
    j Exit

# s2 is counter
# s3 is max
max:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s2, 4($sp)

    beq $s2, $s0, return_end
    addi $s2, $s2, 1
    jal max 
    # Return max to $a0
    move $a0, $v0 

    lw $ra, 0($sp)
    lw $s2, 4($sp)
    addi $sp, $sp, 8
    # $t0 is current a[i]
    sll $t0, $s2, 2
    add $t0, $t0, $s1
    lw $t0, 0($t0)

    bgt $t0, $a0, reassign
    jr $ra
    
reassign:
    move $v0, $t0
    jr $ra

return_end:
    lw $ra, 0($sp)
    lw $s2, 4($sp)
    addi $sp, $sp, 8

    sll $t0, $s2, 2
    add $t0, $t0, $s1
    lw $v0, 0($t0)

    jr $ra
Exit:
