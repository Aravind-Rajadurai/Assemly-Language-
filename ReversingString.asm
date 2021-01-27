############################ data segment ################################
.data
prompt: .asciiz "\nEnter a string: " #prompt for string
nameReversePrompt: .asciiz "Reversed name is : " #prompt for string
commaInsertion: .asciiz ", " #prompt for string
input: .space 300 #string
.text
############################ code segment ################################ 
main:

li $v0, 4
la $a0, prompt #prompt for string
syscall

li $v0, 8
la $a0, input #ask for input
li $a1, 100
syscall
move $s0, $a0 #move data to s0

li $v0, 4
la $a0, nameReversePrompt #prompt for string
syscall

move $s1,$s0
loop: #loop while end of string
lb $a0, 0($s0) #load first character to a0
addi $s0, $s0, 1 #add index by one
beq $a0, $zero, exit #else print character
beq $a0, 32, exitLoop #if current character is space go to loop
j loop

exitLoop:

loopPrint: #loop while end of string
lb $a0, 0($s0) #load first character to a0
addi $s0, $s0, 1 #add index by one
beq $a0, $zero, printOtherStr #else print character
beq $a0, 10, printOtherStr #else print character
beq $a0, 32, exit #if current character is space go to loop
li $v0, 11
syscall
j loopPrint

printOtherStr:
li $v0, 4
la $a0, commaInsertion #prompt for string
syscall

printOther:
lb $a0, 0($s1) #load first character to a0
addi $s1, $s1, 1 #add index by one
beq $a0, $zero, exit #else print character
beq $a0, 32, exit #if current character is space go to loop
li $v0, 11
syscall
j printOther

exit: