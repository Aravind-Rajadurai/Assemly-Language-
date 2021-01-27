.data

    promptStart:    .asciiz "This program does AxB without using mult or div"
           num1:    .asciiz "Please enter the first number(multiplicand): "
           num2:    .asciiz "Please enter the second number(multiplier): "

          space:    .asciiz " "

         product:    .asciiz "The product: "
         ansMult:   .asciiz "The product: "

       endLine: .asciiz "\n"

.text

main:
   
    li  $v0,4           
    la  $a0,promptStart 
    syscall            


    li  $v0,4         
    la  $a0,endLine     
    syscall          


    li  $v0,4           
    la  $a0,num1       
    syscall            


    li  $v0,5        
    syscall            
    move    $s0,$v0    
    move    $s5,$s0    


    li  $v0,4        
    la  $a0,num2   
    syscall           


    li  $v0,5          
    syscall            
    move    $s1,$v0     

    move    $s6,$s1    

    jal MyMult
    j   print

MyMult:
    move $s3, $0       
    move $s4, $0     

    beq $s1, $0, done
    beq $s0, $0, done

    move $s2, $0  

loop:
    andi $t0, $s0, 1   
    beq $t0, $0, next   
    addu $s3, $s3, $s1  
    sltu $t0, $s3, $s1 
    addu $s4, $s4, $t0 
    addu $s4, $s4, $s2  
next:

    srl $t0, $s1, 31    
    sll $s1, $s1, 1
    sll $s2, $s2, 1
    addu $s2, $s2, $t0

    srl $s0, $s0, 1     
    bne $s0, $0, loop

done:
    jr $ra

print:
   
    li  $v0,4          
    la  $a0,product    
    syscall          


    li  $v0,1      
    move    $a0,$s4   
    syscall         

    li  $v0,4          
    la  $a0,space    
    syscall           

    li  $v0,1        
    move    $a0,$s3   
    syscall           



    li  $v0,4         
    la  $a0,endLine    
    syscall          

doMult:

    multu   $s5, $s6
    mfhi    $t0
    mflo    $t1

    li  $v0,4       
    la  $a0,ansMult     
    syscall


    li  $v0,1         
    move    $a0,$t0        
    syscall          

    li  $v0,4         
    la  $a0,space  

    
    li  $v0,1    
    move    $a0,$t1        
    syscall            


    li  $v0,4           
    la  $a0,endLine   
    syscall             


    li  $v0,10         
    syscall            
