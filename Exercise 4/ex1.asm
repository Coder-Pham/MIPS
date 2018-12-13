# Bubble sort - descending order
.data
nums:   .word 15
elems:  .word 3,4, 11, 12, 14, 14, 16, 17, 18, 19, 21, 21, 22, 23, 24 
space:  .asciiz " "

.text
main:
    la $s1, elems
    lw $s0, nums
# s2 is i
# s3 is j
# i = 0 -> n-1
subi $a1, $s0, 1    # n - 1

# COUNT 
addi $t9, $t9, 3

loopi:  sll $t0, $s2, 2
    beq $s2, $a1, Exit

    add $s3, $0, $0
    sub $a0, $s0, $s2
    subi $a0, $a0, 1    # n-i-1
    add $s2, $s2, 1

    # COUNT
    addi $t9, $t9, 6

    # i = 0 -> n-i-1
    loopj:  sll $t1, $s3, 2
            add $t1, $t1, $s1
            lw $s4, 0($t1)
            lw $s5, 4($t1)

            # COUNT
            addi $t9, $t9, 4

            blt	$s4, $s5, swap	# if $s4 < $s5 then swap
done_swap:  add $s3, $s3, 1  

            # COUNT
            addi $t9, $t9, 2

	        beq $a0, $s3, loopi

            # COUNT
            addi $t9, $t9, 1

            j loopj
swap:   addi $t2, $s4, 0
        sw $s5, 0($t1)
        sw $t2, 4($t1)

        # COUNT
        addi $t9, $t9, 5

        j done_swap
Exit:

    # COUNT
    addi $t9, $t9, 2

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

    # COUNT
    addi $t9, $t9, 9

    beq $s2, 15, Exit_result

    # COUNT
    addi $t9, $t9, 2
    
    j Loop_result
Exit_result:

    # COUNT
    addi $t9, $t9, 1