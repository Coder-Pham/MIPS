# Recursive SUM
.data
nums:   .word 10
elems:  .word 17, 24, 19, 21, 14, 16, 18, 12, 22, 23
output: .asciiz "Sum of 10 elements: "

.text
main:
    lw $s0, nums
    addi $s0, $s0, -1

    la $s1, elems
    li $v0, 4
    la $a0, output
    syscall
    jal sum 
    add $a0, $0, $v0
    li $v0, 1
    syscall
    j Exit
# $s2 is counter
# $s3 is sum

sum:
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $s2, 4($sp)

    beq $s2, $s0, return_end
    addi $s2, $s2, 1
    jal sum

exit_sum:
    lw $ra, 0($sp)
    lw $s2, 4($sp)
    addi $sp, $sp, 8
    
    sll $t0, $s2, 2
    add $t0, $t0, $s1
    lw $t0, 0($t0)
    
    add $v0, $v0, $t0
    
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
