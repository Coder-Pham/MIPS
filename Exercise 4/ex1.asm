# Bubble sort - descending order
.data
nums:   .word 15
elems:  .word 17, 24, 19, 21, 14, 16, 18, 12, 22, 23, 11, 4, 3, 14, 21
space:  .asciiz " "

.text
main:
    la $s1, elems
    lw $s0, nums
# s2 is i
# s3 is j
# i = 0 -> n-1
subi $a1, $s0, 1    # n - 1
loopi:  sll $t0, $s2, 2
    beq $s2, $a1, Exit

    add $s3, $0, $0
    sub $a0, $s0, $s2
    subi $a0, $a0, 1    # n-i-1
    add $s2, $s2, 1

    # i = 0 -> n-i-1
    loopj:  sll $t1, $s3, 2
            add $t1, $t1, $s1
            lw $s4, 0($t1)
            lw $s5, 4($t1)
            blt	$s4, $s5, swap	# if $s4 < $s5 then swap
done_swap:  add $s3, $s3, 1  
	    beq $a0, $s3, loopi
            j loopj
swap:   addi $t2, $s4, 0
        sw $s5, 0($t1)
        sw $t2, 4($t1)
        j done_swap
Exit:

addi $s2, $0, 0
Loop_result:    sll $t0, $s2, 2
    add $t0, $t0, $s1
    # Print value
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    # print space
    li $v0, 4
    la $a0, space
    syscall
    # Branch if count equals
    addi $s2, $s2, 1
    beq $s2, 10, Exit_result
    j Loop_result
Exit_result:
