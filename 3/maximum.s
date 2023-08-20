# Purpose: find max value in the set of numbers

# Variables: the following registers store values:
# %eax - current data item
# %ebx - largets data item found so far 
# %edi - holds current item index in the numbers set

# Memory locations used:
# data_items - contains the items data, where 0 signal the end of set

.section .data

.globl data_items

data_items: 
  .long 3,67,34,222,25,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
.globl start_loop

_start:
 movl $0, %edi
 movl data_items (,%edi,4), %eax
 movl %eax, %ebx

.globl start_loop

start_loop:
 cmpl $0, %eax
 je loop_exit # jump equals instruction. Jumps if %eflags register has appropriate value
 incl %edi
 movl data_items(,%edi,4), %eax
 cmpl %ebx, %eax
 jle start_loop # jump less then instruction. Jumps is %eflags register has value that signify that %eax is less or equal than %ebx
 movl %eax, %ebx 
 jmp start_loop # jump no matter what

.globl loop_exit

loop_exit:
 movl $1, %eax # 1 is exit() syscall
 int $0x80 # asking kernel to execute progamm
           # As a result, the max value of the 
           # data set is in %ebx register, and
           # therefore going to be the programm
           # exit code  
