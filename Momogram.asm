	.data
	
prompt:	.asciiz "Enter your name (first middle last): "
mono:	.asciiz "Your monogram is "	
name:	.space 100
	
	.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, name
	li $a1, 100
	syscall

	li $v0, 4
	la $a0, mono
	syscall
			
	#print first initial
	la $t0, name
	lbu $a0,0($t0)
	li $v0, 11
	syscall	
	
	#find second initial
loop1:	addi $t0, $t0, 1
	
	lbu $t1, 0($t0)
	bne $t1, ' ', loop1
	
	addi $t0, $t0, 1
	
	#$t0 should now point to first digit of middle name
	
	lbu $a0,0($t0)
	li $v0, 11
	syscall	
		
	#find third initial
loop2:	addi $t0, $t0, 1
	
	lbu $t1, 0($t0)
	bne $t1, ' ', loop2
	
	addi $t0, $t0, 1
	
	#$t0 should now point to first digit of last name
	
	lbu $a0,0($t0)
	li $v0, 11
	syscall			
		
	li $v0, 10
	syscall
	