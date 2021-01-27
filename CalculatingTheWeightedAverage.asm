.data
ExamScore1: .asciiz "Please enter the integer score for Exam 1: "
ExamScore2: .asciiz "Please enter the integer score for Exam 2: "
ExamScoreF: .asciiz "Please enter the integer score for Final Exam: "
avgMsg: .asciiz "Your weighted average Score is: "


.text
.globl main
main:

# Get all three scores as input, and store in variable $t0, $t1, $t2

li $v0, 4
la $a0, ExamScore1 # prompt for a score
syscall
li $v0, 5
syscall # read an integer
move $t0, $v0

li $v0, 4
la $a0, ExamScore2 # prompt for a score
syscall
li $v0, 5
syscall # read an integer
move $t1, $v0

li $v0, 4
la $a0, ExamScoreF # prompt for a score
syscall
li $v0, 5
syscall # read an integer
move $t2, $v0


# Let's Calculate the weighted average Score and store in variable $t4

# multiply e1Score by 512
sll $t0, $t0, 9

# divide e2Score by 2048
sra $t1, $t1, 11

# divide feScore by 2
sra $t2, $t2, 1

# divide e1score by 2558
li $t5, 2558
div $t0, $t5
mfhi $t0

# multiply e2score by 614
li $t5, 614
mul $t1, $t1, $t5

li $t4, 0 # ensure $t4 is 0
add $t4, $t4, $t0
add $t4, $t4, $t1
add $t4, $t4, $t2

li $v0, 4
la $a0, avgMsg
syscall
li $v0, 1
move $a0, $t4
syscall

li $v0, 10 # graceful exit service
syscall
