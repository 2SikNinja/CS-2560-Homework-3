#  Name:   Nguyen, Peter
#  Homework:  # 3
#  Due:        date 
#  Course:  cs-2640-04-f22 
# 
#  Description: 
#    Stores line of text in array and duplicates it into another array



          .data
intro:    .asciiz   "String by P. Nguyen\n\n"
prompt:   .asciiz   "Enter text? Line 1 : "
newLineStr1:	.asciiz	"\nThis is Str1: "
newLineStr2:	.asciiz	"\nThis is Str2: "
numberStr2:	.asciiz	"\nStr2 has this many characters: "
str1:     .space    40
str2:     .space    40

		.text
main:
		li   $v0, 4         #prints out the intro
		la   $a0, intro
          syscall

          li   $v0, 4		#prints out the "Enter Text?"
          la   $a0, prompt
          syscall
          
		la	$a0, str1
		li	$a1, 41
		li   $v0, 8
		syscall

		li   $v0, 4         #prints out newline
		la   $a0, newLineStr1
          syscall


		li   $v0, 4         #prints out str1
		la   $a0, str1
          syscall


		la	$t1, str1
		la	$t2, str2
		li	$t4,	40
		li	$t5, 0
		jal	strdup

printStr2:	
		li   $v0, 4         #prints out newline
		la   $a0, newLineStr2
          syscall


		li   $v0, 4         #prints out str1
		la   $a0, str2
          syscall

		li   $v0, 4         #prints out numbersprompt
		la   $a0, numberStr2
          syscall
		
		la	$t2,	str2		#loads up str2 into t2
		li	$t5, 0		#counter variable
		jal	strlen
		sub	$t5, 1
		li   $v0, 1         #prints out amount of numbers in str2
		move $a0,	$t5
          syscall


End:
		li	$v0,	10
		syscall

strdup:
		lb	$a1, 0($t1)	#loads 1 byte from str1
		sb	$a1, 0($t2)	#stores byte from str1 into str2
		addu	$t1, $t1, 1	#adds 1 byte
		addu $t2, $t2, 1	#adds 1 byte
		add	$t5,	1		#adds 1 to t5 to only get 40 characters
		blt	$t5, $t4, strdup	#check statement to check if its under 40 and go back
		jr	$ra

strlen:
		lb	$a1, 0($t1)
		addu $t1,	$t1,	1
		add 	$t5,	1
		beq	$a1, $zero, endLoop
		b	strlen

endLoop:
		move	$v0, $t5
		jr	$ra
