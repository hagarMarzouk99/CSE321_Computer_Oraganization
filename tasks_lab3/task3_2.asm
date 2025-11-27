.data
prompt: .asciiz "Enter a number: "
result_msg: .asciiz "Fibonacci = "

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal fibonacci
    move $t4, $v0

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall

fibonacci:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $s0, 4($sp)
    sw $t0, 0($sp)

    move $s0, $a0

    blt $s0, 2, base_case

    addi $a0, $s0, -1
    jal fibonacci
    move $t0, $v0

    addi $a0, $s0, -2
    jal fibonacci
    move $t1, $v0

    add $v0, $t0, $t1
    j restore

base_case:
    move $v0, $s0

restore:
    lw $t0, 0($sp)
    lw $s0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra
