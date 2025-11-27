.data 
prompt: .asciiz "Enter number of integers : "
promptNumber: .asciiz "Enter an integer : "
result: .asciiz "the average is : "
newline: .asciiz "\n"

.text 
main:
move $t0, $zero
move $t2, $zero

li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t1, $v0

while:
bge $t2, $t1, endwhile

li $v0, 4
la $a0, promptNumber
syscall

li $v0, 5
syscall

add $t0, $t0, $v0
addi $t2, $t2, 1
j while

endwhile:
div $t0, $t1
mflo $t3

li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 4
la $a0, newline
syscall

li $v0, 10
syscall 

