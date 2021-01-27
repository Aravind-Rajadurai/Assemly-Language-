# This program prompts the user to enter the integer scores for Exam 1,
# Exam 2 and Final Exam. It then computes the weighted average score 
# (using the formula: avg = exam1*(512/2558) + exam2*(614/2048) + final/2)
# and displays a labeled output with the weighted average score.
############################ data segment ################################

		.data
prompt1:	.asciiz	"Please enter the first exam score "
prompt2:	.asciiz	"Please enter the second exam score "
prompt3:	.asciiz	"Please enter the final exam score "
output:		.asciiz	"The weighted average is "
newline:	.asciiz	"\n"
############################ code segment ################################
		.text
		.globl main
main:
		
		la $a0, prompt1		
		li $v0, 4
		syscall			# prompt for exam 1
		li $v0, 5		
		syscall			# read in exam 1
		sll $t0, $v0, 9		# multiply by 512
		li $t1, 2558		
		div $t0, $t1		# divide by 2558
		mflo $t0
		
		la $a0, prompt2		
		li $v0, 4
		syscall			# prompt for exam 2
		li $v0, 5		
		syscall			# read in exam 2
		li $t1, 614		
		mult $t1, $v0		# multiply by 614
		mflo $t1
		srl $t1, $t1, 11	# divide by 2048
					
		
		la $a0, prompt3		
		li $v0, 4
		syscall			# Prompt for final grade
		li $v0, 5		
		syscall			# Read in final exam
		srl $v0, $v0, 1		# divide by 2
				
		
		add $v0, $v0, $t0	# sum three weighted averages
		add $t1, $v0, $t1
		
		la $a0, output		
		li $v0, 4
		syscall			# display output string
		move $a0, $t1
		li $v0, 1
		syscall			# display weighted average
					
		li $v0, 10		# graceful exit
		syscall
