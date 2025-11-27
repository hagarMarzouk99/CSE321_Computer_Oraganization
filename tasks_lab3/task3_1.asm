.data
prompt: .asciiz "Enter a number: "
result_msg: .asciiz "Fibonacci = "

.text
main:
    # ask user
    li $v0, 4
    la $a0, prompt
    syscall

    # read int
    li $v0, 5
    syscall
    move $a0, $v0     # n

    jal fibonacci     # compute fib(n)

    move $t4, $v0     # save result in t4  

    # print message
    li $v0, 4
    la $a0, result_msg
    syscall

    # print fibonacci result
    li $v0, 1
    move $a0, $t4     # print saved result
    syscall

    # exit
    li $v0, 10
    syscall

#============================
fibonacci:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $s0, 0($sp)

    move $s0, $a0       # n

    # base cases
    blt $s0, 2, base_case

    li $t0, 0           # fib(0)
    li $t1, 1           # fib(1)
    li $t2, 2           # counter = 2

loop:
    beq $t2, $s0, last_step

    add $t3, $t0, $t1   # next fib
    move $t0, $t1
    move $t1, $t3

    addi $t2, $t2, 1
    j loop

last_step:
    add $v0, $t0, $t1
    j restore

base_case:
    move $v0, $s0

restore:
    lw $s0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
