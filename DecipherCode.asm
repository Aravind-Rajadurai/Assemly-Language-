########### decode.asm ############
         .data

chars:    .ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ .,!-'"

msg1:     .word 0x93EA9646, 0xCDE50442, 0x34D29306, 0xD1F33720

          .word 0x56033D01, 0x394D963B, 0xDE7BEFA4  

msg1end:
	 .text
	 
main:
   la $t0,msg1  
   add $t1, $zero, $zero   
   li $t3,28   
   li $s0,0      
   li $s1,0     
   li $s2,0    
   li $s3,4     
load:   lb $s7,($t0)      
   beqz $t3,exit     
   sub $t3,$t3,1      
   addi $t2, $zero, 1   
   sll $t2, $t2, 7   
 
L1:   and $t4,$t2,$s7   
   beqz $t4,nextItr  
   move $a1,$s3     
   jal pow         
   add $s0,$s0,$v0              
nextItr:
   srl $t2,$t2,1     
   sub $s3,$s3,1    
   add $s1,$s1,1    
   add $s2,$s2,1    
   beq $s1,5,reset1  
   j n1
reset1: la $t5,chars      
   add $t5,$t5,$s0      
   lb $a0,($t5)   
   li $v0,11          
   syscall          
   li $s0,0      
   li $s1,0     
   li $s3,4   
n1:   beq $s2,8,reset2   
   j n2         
reset2:   li $s2,0   
   add $t0,$t0,1      
   j load          
n2:   j L1          
exit:   li $v0, 10       
   syscall
   
######## pow function #########

pow:   beqz $a1,returnOne
   sub $a1,$a1,1
   li $t7,2
powLoop: beqz $a1,returnPowLoop
   mul $t7,$t7,2
   sub $a1,$a1,1
   j powLoop
returnOne: li $t7,1
returnPowLoop:
   move $v0,$t7  
   jr $ra              