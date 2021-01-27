# Aravind Rajadurai

.data

promptMenu: .asciiz "\nEnter 1 to find minimum in array OR \nEnter 2 to find maximum in array : "

prompt: .asciiz "\nMaximum number is : "

promptInvalid: .asciiz "\nInvalid choice try again ! "

prompt1: .asciiz "\nMinimum number is : "

size: .word 10

#load array

array: .word -58, -245, 23, -45, 78, 223, 2, 346, 98, 45

.text

#load address of array and size

la $s4,array #load address of A

lw $t0,size #load i to t0

li $s1,9999

li $s0,0

li $s2,0

askInput:

#show menu and get user input

li $v0, 4

la $a0, promptMenu #prompt for string

syscall

li $v0,5

syscall #ask user input

move $t7,$v0

seq $s7,$t7,1

seq $s6,$t7,2

or $s5,$s6,$s7

#check if input is 1 or 2

bnez $s5,proceed

li $v0, 4

#if input not 1 or 2 print error!

la $a0, promptInvalid #prompt for string

syscall

j askInput

proceed:

#loop for the array

loop:

mul $t1,$s2,4 #get index of first element by multiplying it by 4

add $t1,$t1,$s4 #add index to base address of array

lw $s3,0($t1) #load base address to s0

#check for minimum

bge $s0,$s3,skip

move $s0,$s3

skip:

#check for maximum

ble $s1,$s3,skip1

move $s1,$s3

skip1:

addi $s2,$s2,1 #increase i by one

blt $s2,$t0,loop # loop until size

beq $t7,1,goTOMinimum

li $v0, 4

la $a0, prompt #prompt for string

syscall

li $v0, 1

move $a0, $s0 #prompt for string

syscall

j exit

goTOMinimum :

li $v0, 4

la $a0, prompt1 #prompt for string

syscall

li $v0, 1

move $a0, $s1 #prompt for string

syscall

exit:

