#include "x86.h"
#include "device.h"

extern PCB* current;
extern TSS tss;

void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void SYS_write(struct TrapFrame *tf);


void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	current->tf = tf;
	putChar(current->pid + '0');
	putChar('\n');
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		case 32:	
			current = &pcb[0];
			tss.esp0 = (uint32_t)current->stack + 4096;
			break;
		case 46:
		    break;

		default:assert(0);
	}
	
}


void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	if(tf->eax == 4)		//SYS_write
		SYS_write(tf);		//Implement in do_syscall.c
	
	else 				
		assert(0);
}


void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}
