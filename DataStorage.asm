.data

promptInt: .asciiz "\nEnter an integer: "
promptStr: .asciiz "\n\nEnter a string: "
promptChar: .asciiz "\nEnter a character: "
msgInt: .asciiz "The integer you entered is : "
msgStr: .asciiz "The string you entered is : "
msgChar: .asciiz "\nThe character you entered is : "
str: .space 25 #holds a string of max 25 

.text

#prompt for a number
li $v0, 4
la $a0, promptInt
syscall

#read int input, save it in $t0
li $v0, 5
syscall
move $t0, $v0

#display the int saved in $t0 with a msg
li $v0, 4
la $a0, msgInt
syscall

li $v0, 1
move $a0, $t0
syscall

#prompt for a string
li $v0, 4
la $a0, promptStr
syscall

#read string input, save it in location str
li $v0, 8
la $a0, str
li $a1, 25 #max length of string

syscall

#display the string str
li $v0, 4
la $a0, msgStr
syscall

li $v0, 4
la $a0, str
syscall

#prompt for a char
li $v0, 4
la $a0, promptChar
syscall

#read char input and save to $t1
li $v0, 12
syscall
move $t1, $v0

#display the char in $t1 with a msg
li $v0, 4
la $a0, msgChar
syscall

li $v0, 11
move $a0, $t1
syscall

#exit
li $v0, 10
syscall