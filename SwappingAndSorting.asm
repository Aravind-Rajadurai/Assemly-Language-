##########################################################################
# <Aravind Rajadurai>, CS 2318-251, Assignment 2 Part 1 Program C
############################ data segment ################################	
		.data
array:		.word	44, 99, 33, 11, 55
initial:	.asciiz "The initial order of array values is: "
space:		.asciiz " "
post:		.ascii "\nAfter swapping, the new order of values is: "
############################ code segment ################################
		.text
		.globl main
main:
		li $v0, 4		# print output string
		la $a0, initial
		syscall
		la $t0, array		# load the array base into $t0
		jal printArray
				
		lw $t1, 0($t0)		# put array[0] into $t1
		lw $t3, 12($t0)		# put array[4] into $t3
		sw $t1, 12($t0)		# put the value in $t3 into array[4]
		sw $t3, 0($t0)		# put the value in $t1 into array[0]
				
		lw $t1, 4($t0)		# put array[1] into $t1
		lw $t3, 16($t0)		# put array[4] into $t3
		sw $t1, 16($t0)		# put the value in $t1 into array[4]
		sw $t3, 4($t0)		# put the value in $t3 into array[1]
				
		li $v0, 4
		la $a0, post			
		syscall			# print output string
		jal printArray
				
		li $v0, 10
		syscall			# graceful exit
				
				
printSpace:
		li $v0, 4
		la $a0, space
		syscall			# print the space
		li $v0, 1		# reset $v0 for integer output
		jr $ra			# return to printArray
				
printArray:
		li $v0, 1
		lw $a0, 0($t0)
		syscall			# print array[0]
		move $t9, $ra		# save our return address
		jal printSpace
		lw $a0, 4($t0)
		syscall			# print array[1]
		jal printSpace
		lw $a0, 8($t0)
		syscall			# print array[2]
		jal printSpace
		lw $a0, 12($t0)
		syscall			# print array[3]
		jal printSpace
		lw $a0, 16($t0)
		syscall			# print array[4]
		jal printSpace
		jr $t9			# return to main
