.section data

data_items: 
  .long 220, 44, 145, 76, 9, 13, 0

.section text
.globl _start

# eax - current value
# ebx - current min value
# edx - current value index
_start:
  movl $255, %ebx
  movl $0, %edx

_start_loop:
  movl data_items(,%edx, 4), %eax
  incl %edx
  cmpl $0, %eax
  je _exit
  cmpl %eax, %ebx
  jle _start_loop
  movl %eax, %ebx
  jmp _start_loop

_exit:
  movl $1, %eax
  int $0x80
