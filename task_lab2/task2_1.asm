 .data
 numberOfTask : .asciiz "Task 1 \n"
promptNum: .asciiz "Enter a number: "
resultMsg: .asciiz "The average is: "
newline: .asciiz "\n"

.text
main:


    li $t0, 4        
    move $t1, $zero   # sum = 0
    move $t2, $zero   # counter = 0
    
    # print number of task
    li $v0, 4
    la $a0, numberOfTask
    syscall

loop_start:
    beq $t2, $t0, done   # end condition

    li $v0, 4
    la $a0, promptNum
    syscall

   
    li $v0, 5
    syscall
    add $t1, $t1, $v0    # sum = sum + input
    addi $t2, $t2, 1     # counter++

    j loop_start           

done:
  
    div $t1, $t0
    mflo $t3              

  
    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

     
    li $v0, 4
    la $a0, newline
    syscall

exit:
    li $v0, 10
    syscall
