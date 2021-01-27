############################ data segment ################################
	.data 

prompt:	 .asciiz "Enter your name (FIRST): "
prompt1: .asciiz "Enter your name (LAST): "
print:	.asciiz "Name reversed is: "
first:	.space  101 # array of 101 bytes 
last:	.space  101 # array of 101 bytes 
############################ code segment ################################ 
	.text 
	.globl main

main:	la $a0, prompt
	li $v0, 4
	syscall

	la $a0, first
	li $a1, 101

	li $v0, 8
	syscall 



	la $a0, prompt1
	li $v0, 4
	syscall
	
	la $a0, last
	li $a1, 101

	li $v0, 8
	syscall

	la $a0, print 
	li $v0, 4
	syscall

	la $a0, last
	li $v0, 4 
	syscall 
	
	la $a0, first
	li $v0, 4 
	syscall

	li $v0, 10
	syscall

