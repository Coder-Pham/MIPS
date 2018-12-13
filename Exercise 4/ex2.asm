# QuickSort - ascending order
.data
nums:   .word 15
elems:  .word 24 23 22 21 21 19 18 17 16 14 14 12 11 4 3
space:  .asciiz " "

.text
.globl main
main:
    la $s1, elems
    lw $s0, nums
    # Use stack to store HEAD - TAIL SUBARRAY
    addi $a0, $0, 0
    addi $a1, $s0, -1

    # COUNT
    addi $t9, $t9, 4

    jal quicksort   # Call quicksort
    # Print
    addi $s2, $0, 0

    # COUNT
    addi $t9, $t9, 2

    j Print

quicksort:  
    # $a0 = head
    # $a1 = tail
    addi $sp, $sp, -24
    sw $a0, 0($sp)      # Head
    sw $a1, 4($sp)      # Tail
    sw $t0, 8($sp)      # i
    sw $t1, 12($sp)     # j
    sw $t2, 16($sp)     # Median
    sw $ra, 20($sp)

    # Set i and j
    move $t0, $a0
    move $t1, $a1

    # Median position - (i + j) / 2
    add $t2, $t0, $t1
    addi $t3, $0, 2
    div		$t2, $t3			# $t2 / 2
    mflo	$t2				# $t2 = floor($t2 / 2) 
    # Median 
    sll $t2, $t2, 2
    add $t2, $t2, $s1
    lw $t2, 0($t2)

    # COUNT
    addi $t9, $t9, 17

    # While (i < j)
    i_j:bge $t0, $t1, recurse1
        # while (a[i] < mid)    i++
        i_mid:  # Get a[i] -> $t3
            sll $t3, $t0, 2
            add $t3, $t3, $s1
            lw $t3, 0($t3)

            # COUNT
            addi $t9, $t9, 4

            # a[i] < mid
            bge $t3, $t2, j_mid
            addi $t0, $t0, 1

            # COUNT
            addi $t9, $t9, 2

            j i_mid

        # While (a[j] > mid)    j--
        j_mid:  # Get a[j] -> $t4
            sll $t4, $t1, 2
            add $t4, $t4, $s1
            lw $t4, 0($t4)

            # COUNT
            addi $t9, $t9, 4

            # a[j] > mid
            ble $t4, $t2, swap 
            addi $t1, $t1, -1

            # COUNT
            addi $t9, $t9, 2

            j j_mid

        # Swap a[i] - a[j]
        swap:   bgt $t0, $t1, i_j
            # $t3 = a[i]
            # $t4 = a[j]
            # a[i] = a[j]
            sll $t5, $t0, 2
            add $t5, $t5, $s1
            sw $t4, 0($t5)
            # a[j] = temp = old a[i]
            sll $t5, $t1, 2
            add $t5, $t5, $s1
            sw $t3, 0($t5)
            # i++      j--
            addi $t0, $t0, 1
            addi $t1, $t1, -1

            # COUNT
            addi $t9, $t9, 10
    j i_j

recurse1:
    # COUNT 
    addi $t9, $t9, 1

    # If head < j
    bge	$a0, $t1, recurse2	# if $a0 >= $t1 then recurse2
        move $a1, $t1
        jal quicksort
        # pop stack
        lw $a0, 0($sp)
        lw $a1, 4($sp)
        lw $ra, 20($sp)

    # COUNT
    addi $t9, $t9, 5

recurse2:
    # COUNT 
    addi $t9, $t9, 1

    # If i < tail
    bge $t0, $a1, Exit
        move $a0, $t0
        jal quicksort
        # pop stack
        lw $a0, 0($sp)
        lw $a1, 4($sp)
        lw $ra, 20($sp)

    # COUNT
    addi $t9, $t9, 5

Exit:
    lw $t0, 8($sp)
    lw $t1, 12($sp)
    lw $t2, 16($sp)
    addi $sp, $sp, 24

    # COUNT
    addi $t9, $t9, 5
    
    jr	$ra				# jump to stack

Print:  sll $t0, $s2, 2
    add $t0, $t0, $s1
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    # Print space
    li $v0, 4
    la $a0, space
    syscall
    addi $s2, $s2, 1

    # COUNT
    addi $t9, $t9, 11

    beq $s2, 15, Exit_print
    j Print
Exit_print:
