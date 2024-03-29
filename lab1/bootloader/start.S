#include "helper.h"

.code16

.global start
start:
	
clear:

	#在实模式下清屏
	movb    $0x06,  %ah     # 功能号0x06  
    movb    $0,     %al     # 上卷全部行，即清屏  
    movb    $0,     %ch     # 左上角行  
    movb    $0,     %ch     # 左上角列    
    movb    $24,    %dh     # 右下角行  
    movb    $79,    %dl     # 右下角列  
    movb    $0x07,  %bh     # 空白区域属性  
    int     $0x10  

 	cli                             #关闭中断
	xorw    %ax,%ax             # Segment number zero
 	movw    %ax,%ds             # -> Data Segment
   	movw    %ax,%es             # -> Extra Segment
 	movw    %ax,%ss             # -> Stack Segment

#enable A20
seta20.1:  
  	inb     $0x64,%al               # Wait for not busy
  	testb   $0x2,%al
  	jnz     seta20.1

  	movb    $0xd1,%al               # 0xd1 -> port 0x64
  	outb    %al,$0x64

seta20.2:
  	inb     $0x64,%al               # Wait for not busy
  	testb   $0x2,%al
  	jnz     seta20.2

  	movb    $0xdf,%al               # 0xdf -> port 0x60
  	outb    %al,$0x60


    lgdt gdtDesc      				#加载GDTR

  	movl %cr0, %eax                 #启动保护模式
    orb $0x01, %al
    movl %eax, %cr0

	ljmp $GDT_ENTRY(1), $start32     		#长跳转切换至保护模式


.code32
start32:
	movw  $GDT_ENTRY(2), %ax 	
	movw %ax, %ds
	movw %ax, %es 
	movw %ax, %ss

	movw $GDT_ENTRY(3), %ax     
	movw %ax, %gs           

	movl $0x8000, %esp
	movl $0x0,	%ebp
	jmp bootMain
	
loop:	
	jmp loop
	

# GDT
.p2align 2                         # 对齐
gdt:    
    SEG_NULLASM 
	SEG_ASM(0X0A,0X0,0XFFFFFFFF)
	SEG_ASM(0X02,0X0,0XFFFFFFFF)
	SEG_ASM(0X02,0XB8000,0X0000)

gdtDesc:                           # GDT描述符
	.word   (gdtDesc - gdt - 1)    # GDT长度，留意地址运算
	.long   gdt                    # GDT地址
