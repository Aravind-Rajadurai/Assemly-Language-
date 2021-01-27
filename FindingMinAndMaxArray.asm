.data

ShowMenu: .asciiz "\nEnter 1 to Find Minimum in Array\nEnter 2 to Find Maximum in Array : "

prompt: .asciiz "\nMaximum Number is : "

ShowError: .asciiz "\nError:try again ! "

prompt1: .asciiz "\nMinimum Number is : "

size: .word 10

# Use to Load Array's

arrays: .word 43, -123, -497, 258, 9, 159, 3, -875 ,97 ,797

.text

# Make an address of Array and its Size

la $s4,arrays # load arrays

lw $t0,size # load size

li $s1,9999

li $s0,0

li $s2,0

getInput: # show user to get input

li $v0, 4 # show user to get input
la $a0, ShowMenu
syscall

li $v0,5 # for user input
syscall

move $t7,$v0
seq $s7,$t7,1
seq $s6,$t7,2
or $s5,$s6,$s7

bnez $s5,Process #Compare and get

li $v0, 4 # print the string
la $a0, ShowError
syscall

j getInput

Process:

# use loop

loop:

mul $t1,$s2,4 # add the arrays of matrix
add $t1,$t1,$s4
lw $s3,0($t1) # load to the base value

bge $s0,$s3,Toskip #checks for minimum value
move $s0,$s3

Toskip: #checks for maximum value

ble $s1,$s3,Toskip1
move $s1,$s3

Toskip1: # make increment by 1

addi $s2,$s2,1
blt $s2,$t0,loop # loop until size
beq $t7,1,GetMinimum

li $v0, 4
la $a0, prompt
syscall

li $v0, 1 # show
move $a0, $s0
syscall

j exit

GetMinimum :
li $v0, 4
la $a0, prompt1
syscall

li $v0, 1
move $a0, $s1
syscall

exit: