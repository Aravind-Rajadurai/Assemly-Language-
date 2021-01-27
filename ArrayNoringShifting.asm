##########################################################################
# <Aravind Rajadurai>, CS 2318-251, Assignment 2 Part 1 Program B
############################
# prompt user to enter an integer in the range [0, 63], read the integer, 
# and display if the integer is of type 1 ( <= 31 ) or 0 ( > 31 )
############################ data segment ################################
			.data
typeLegend:		.asciiz "1 for <=31,  0 for >31\n"
inputPrompt:		.asciiz "Enter integer between 0 and 63 (inclusive): "
outputLabel:		.asciiz "Integer entered is of type "
############################ code segment ################################
			.text
			.globl main
main:
			li $v0, 4
			la $a0, typeLegend        
			syscall			# print type legend
			la $a0, inputPrompt        
			syscall			# print input prompt
			li $v0, 5
			syscall			# read integer
			move $v1, $v0		# save integer read in $v1
			li $v0, 11
			li $a0, '\n'
			li $v0, 4
			la $a0, outputLabel        
			syscall			# print output label

			li $v0, 1

			##########################################################
			# Insert NO MORE THAN 4 lines of code that involve ONLY 
			#   bit manipulating instructions (ANDing, ORing, XORing,
			#   NORing and shifting - only whatever that are needed)
			# so that the program will work just like the sample runs 
			# shown at the bottom (some blank lines edited out).
			# HINT: Risking telling the obvious, the instructions you
			#       insert are to cause the content of $a0 to become
			#       the desive value (1 or 0) when printed as integer.
			# You MUST test your completed program for AT LEAST the 
			# test cases shown (and include the result in hardcopy).
			##########################################################
			
          #Your Code Here
          #Integer oring with 31
          ori $a0,$v1,31
          #shift right to 4 places means,<=31 get 1 >31 get 3
          srl $a0,$a0,4
          #Xor with 3 get,<=31 end digits 10 and >31 get 00
          xor $a0,3
          #right shift 1 generate proper type
          srl $a0,$a0,1
			
			
			
			
			
			syscall			# display desired output
			
	                ##########################################################
                                                
			li $v0, 10		# exit gracefully
                	syscall
			
########################## sample test runs ##############################
# 1 for <=31,  0 for >31
# Enter integer between 0 and 63 (inclusive): 0
# Integer entered is of type 1
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 1 for <=31,  0 for >31
# Enter integer between 0 and 63 (inclusive): 31
# Integer entered is of type 1
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 1 for <=31,  0 for >31
# Enter integer between 0 and 63 (inclusive): 32
# Integer entered is of type 0
# -- program is finished running --
# 
# Reset: reset completed.
# 
# 1 for <=31,  0 for >31
# Enter integer between 0 and 63 (inclusive): 63
# Integer entered is of type 0
# -- program is finished running --
######################## end sample test runs ############################
