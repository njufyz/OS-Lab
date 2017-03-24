.code32
.global start

start:
movl  $((80*0+0)*2), %edx             #在第5行第0列打印
movb  $0x0c, %ah                         #黑底红字
movl  $0x0, %ecx
mov   $str, %esi

l1:
    mov   (%esi), %al
    movw  %ax, %gs:(%edx)
    add   $0x2, %edx
    inc   %esi
    mov   $(end-str), %ebx
    cmp   $0x5, %ebx
    jne   l1

loop:
    jmp loop

str:
    .string "Hello World!"
end:
