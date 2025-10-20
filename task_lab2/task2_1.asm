.data 
prompt : .asciiz "Enter number of integers : "
promptNumber : .asciiz "Enter an integer : "
result: .asciiz "the average is : "
newline : .asciiz "\n"

.text 
main:
move $t0 , $zero    # set inital value of sum
move $t2 , $zero     # counter = 0 "at start"
#print prompt 
li $v0,4
la $a0 , prompt
syscall

# read number 
li $v0,5
syscall
move $t1 , $v0     #   t1 = n = number of integer

while:
bge $t2 , $t1, endWhile
# print prompt number
   li $v0, 4
    la $a0, enterNum
    syscall
    li $v0, 5  # read an integer
    syscall
# operation (add)
  add $t0, $t0, $v0   # => sum += number
 addi $t2, $t2, 1   # to increament the counter
 j while
 endwhile:
# average
 div $t0, $t1
 mflo $t3    # t3 ===> result 

# to print the result
 li $v0, 4
 la $a0, result
 syscall
# 
li $v0 ,1
move $a0 , $t3
syscall

#new line 
    li $v0, 4
    la $a0, newline
    syscall

exit:
li $v0 , 10
syscall

