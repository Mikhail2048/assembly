.section data

data_items: 
   .byte 15, 6, 23, 5, 12, 0

.section text


# bl - current minimum 
# al - current value
# dl - current index

.globl _start
_start:
  movb data_items, %bl
  movb $1, %dl
  cmpb $0, %bl
  je _exit_not_found

_start_loop:
  movb data_items (,%edx,1), %al
  cmpb $0, %al
  je _exit
  incb %dl
  cmpb %al, %bl
  jle _start_loop
  movb %al, %bl
  jmp _start_loop

_exit_not_found:
  movb $255, %bl
#   jmp _exit

_exit:
  movb $1, %al
  int $0x80
