.code32

#----|-----entry------|-errorcode-|-----id-----|---handler---|
.globl vec0;    vec0:   pushl $0;  pushl    $0; jmp asm_do_irq
.globl vec1;    vec1:   pushl $0;  pushl    $1; jmp asm_do_irq
.globl vec2;    vec2:   pushl $0;  pushl    $2; jmp asm_do_irq
.globl vec3;    vec3:   pushl $0;  pushl    $3; jmp asm_do_irq
.globl vec4;    vec4:   pushl $0;  pushl    $4; jmp asm_do_irq
.globl vec5;    vec5:   pushl $0;  pushl    $5; jmp asm_do_irq
.globl vec6;    vec6:   pushl $0;  pushl    $6; jmp asm_do_irq
.globl vec7;    vec7:   pushl $0;  pushl    $7; jmp asm_do_irq
.globl vec8;    vec8:              pushl    $8; jmp asm_do_irq
.globl vec9;    vec9:   pushl $0;  pushl    $9; jmp asm_do_irq
.globl vec10;   vec10:             pushl   $10; jmp asm_do_irq
.globl vec11;   vec11:             pushl   $11; jmp asm_do_irq
.globl vec12;   vec12:             pushl   $12; jmp asm_do_irq
.globl vec13;   vec13:             pushl   $13; jmp asm_do_irq
.globl vec14;   vec14:             pushl   $14; jmp asm_do_irq

.globl vecsys; vecsys:  pushl $0;  pushl $0x80; jmp asm_do_irq

.globl irq0;     irq0:  pushl $0;  pushl $32;   jmp asm_do_irq
.globl irq1;     irq1:  pushl $0;  pushl $33;   jmp asm_do_irq
.globl irq14;   irq14:  pushl $0;  pushl $46;   jmp asm_do_irq
.globl irq_empty;
			irq_empty:	pushl $0;  pushl   $-1; jmp asm_do_irq

.globl asm_do_irq
.extern irqHandle
.extern current

asm_do_irq:
	pushal

	pushl %ds
  	pushl %es
  	pushl %fs
  	pushl %gs

	pushl %esp

#设置段寄存器
	movw $0x10, %ax
	movw %ax, %ds
	movw %ax, %es

	call irqHandle

#恢复/切换栈
	movl (current), %eax        
	movl (%eax), %esp

	popl %gs
  	popl %fs
  	popl %es
  	popl %ds

	popal

	addl $8, %esp
	iret
