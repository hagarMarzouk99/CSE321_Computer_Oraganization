.data
prompt: .asciiz "Enter a number (1-3): "
msg1:   .asciiz "You selected CASE 1\n"
msg2:   .asciiz "You selected CASE 2\n"
msg3:   .asciiz "You selected CASE 3\n"
msgD:   .asciiz "Invalid choice!\n"

.text
main:
   #print 
    li $v0, 4
    la $a0, prompt
    syscall

     #read integer
    li $v0, 5
    syscall
    move $t0, $v0   # number = t0

     
    beq $t0, 1, case1    
    beq $t0, 2, case2   
    beq $t0, 3, case3    
    j defaultCase         

case1:
    li $v0, 4
    la $a0, msg1
    syscall
    j endSwitch          # break

case2:
    li $v0, 4
    la $a0, msg2
    syscall
    j endSwitch

case3:
    li $v0, 4
    la $a0, msg3
    syscall
    j endSwitch

defaultCase:
    li $v0, 4
    la $a0, msgD
    syscall

endSwitch:
    li $v0, 10
    syscall
