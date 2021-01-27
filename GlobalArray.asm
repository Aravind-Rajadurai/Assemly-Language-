#data segment
.data
   #Allocate a global array initialize the array
   array: .word 88, 77, 33, 99, 44
   #declare the string labels
   newLine: .asciiz "\n"
   arrayContent: .asciiz "The initial array from 1st to 5th elements:\n"
   afterSwap: .asciiz "After-swap array from 5th to 1st elements:\n"

#text segment
.text
   #display a labeled output about the array's initial contents
   li $v0, 4
   la $a0, arrayContent
   syscall
   #set the counter value
   li $t0,0
   li $t1,1
#printing array from 1st to 5th element
printInitialArray:
   bgt $t1,5,swapping#exit when $t1>5
   # load a word from the array into $a2  
   lw $a2, array($t0)
   # print integer
   li $v0, 1
   move $a0, $a2
   syscall
   # print new line
   li $v0, 4
   la $a0, newLine
   syscall  
   #increment $t0 by 4 to get the next value of the array
   addi $t0,$t0,4
   #increment the counter value by 1
   addi $t1,$t1,1
   #jump to printInitialArray
   j printInitialArray

#Re-order the values in the array so that the contents of the array  
swapping:
   #load the values of the array into the
   #registers $s1, $s2,$s3,$s4, and $s5
   li $t0,0
   lw $s1,array($t0)
   li $t0,4
   lw $s2,array($t0)
   li $t0,8
   lw $s3,array($t0)
   li $t0,12
   lw $s4,array($t0)
   li $t0,16
   lw $s5,array($t0)
  
   #Swap the contents in memory of
   #the 1st and 4th elements of the array.
   li $t0,0
   sw $s4,array($t0)  
   li $t0,12
   sw $s1,array($t0)  
   #Swap the contents in memory of the
   #2nd and 5th elements of the array.
   li $t0,4
   sw $s5,array($t0)
   li $t0,16
   sw $s2,array($t0)
   #print a line
   li $v0, 4
   la $a0, newLine
   syscall
  
   #display a labeled output about the array's contents
   #after swapping
   li $v0, 4
   la $a0, afterSwap
   syscall
   #set the values to print the array in reverse order
   li $t0,16
   li $t1,5

#printing array from 5th to 1st element
printReverseArray:
   blt $t1,1,Exit#exit when $t1 is less than 1
   # load a word from the array into $a2
   lw $a2, array($t0)
   # integer to print
   li $v0, 1
   move $a0, $a2
   syscall
   #print a line
   li $v0, 4
   la $a0, newLine
   syscall
   #decrement $t0 by 4 to get the next value of the array
   subi $t0,$t0,4
   #decrement $t1 by 1
   subi $t1,$t1,1
   #jump to printReverseArray
   j printReverseArray

#end the program.
Exit:
   li $v0, 10
   syscall