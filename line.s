#  Name:   Nguyen, Peter
#  Homework:  # 3
#  Due:        date 
#  Course:  cs-2640-04-f22 
# 
#  Description: 
#    Stores line of text in array and duplicates it into another array
          .data
LINELEN:  .ascii    40
intro:    .asciiz   "String by P. Nguyen"
prompt:   .asciiz   "Enter text? Line 1 "
str1:     .space    40
str2:     .space    40

main:
          li   $v0, 4
          la   $a0, intro
          syscall

          li   $v0, 4
          la   $a0, prompt
          syscall