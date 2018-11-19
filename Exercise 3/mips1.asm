# Take only positive integer input
# Calculate the sum
# Print result

.data
prompt: .asciiz "Value of number: "
output: .asciiz "Sum of all: "

.text
main:

# $s2 is sum
# $a0 is input 
InfLoop:li $v0, 4
        la $a0, prompt
        syscall
        # Input a number
        li $v0, 5
        syscall
        add $a0, $0, $v0 
        # Check that number
        ble $a0, 0, Exit	# if $a0 <= 0 then Exit
        add $s2, $s2, $a0
        j InfLoop
Exit:

    # Print value
    li $v0, 4
    la $a0, output
    syscall
    add $a0, $s2, $0
    li $v0, 1
    syscall