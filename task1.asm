.data
name_label : .asciiz "Name :  Hagar \n"
Id_label : .asciiz " ID  : 20812022200332\n"
coures_label : .asciiz "Course :  CSE321_computer_organazition\n"

.text
.globl main
main:
li $v0 , 4
la $a0 , name_label
syscall

li $v0 , 4
la $a0 , Id_label
syscall

li $v0 , 4
la $a0 , coures_label
syscall
li $v0 ,10
syscall
