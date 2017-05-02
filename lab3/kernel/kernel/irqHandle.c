#include "x86.h"
#include "device.h"

extern PCB* current;
extern PCB idle;
extern TSS tss;

void SyscallHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);
void TimerHandle(struct TrapFrame *tf);

int SYS_exit(struct TrapFrame *tf);
int SYS_fork(struct TrapFrame *tf);
int SYS_write(struct TrapFrame *tf);
int SYS_sleep(struct TrapFrame *tf);
int SYS_getpid(struct TrapFrame *tf);

void schedule();
void wake(int i);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */

	//设置段寄存器
	asm volatile("movw %%ax,%%ds":: "a" (KSEL(SEG_KDATA)));
	
	current->tf = tf;
	
	
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			SyscallHandle(tf);
			break;
		case 32:	
		//	putChar(current->pid + '0');
		//	putChar('\n');
			TimerHandle(tf);
			schedule();
			break;
		case 46:
		    break;

		default:assert(0);
	}
	
}


void SyscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	switch (tf->eax)
	{
		case SYS_EXIT:  tf->eax = SYS_exit(tf);  break;
		case SYS_FORK:  tf->eax = SYS_fork(tf);  break;

		case SYS_WRITE: tf->eax = SYS_write(tf); break;
		case SYS_SLEEP: tf->eax = SYS_sleep(tf); break;
		case SYS_GETPID:tf->eax = SYS_getpid(tf); break;
		default:assert(0);
	}
}


void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}

void TimerHandle(struct TrapFrame *tf){
	putChar(current->pid + '0');
	/*int i;
	for(i = 0; i < PCB_MAX; i++)
	{
		if(pcb[i].state == RUNNING)
		{
			pcb[i].time_count--;
			if(pcb[i].time_count <= 0)
				pcb[i].state = BLOCKED;
		}
		if(pcb[i].state == BLOCKED)
		{
			pcb[i].sleep_time--;
			if(pcb[i].sleep_time == 0)
				wake(i);
		}
	}
	*/
}

void schedule()
{
	if(current != &idle && current->time_count > 0)
		return ;

    if(current == &idle)
	{
		if(pcb[0].state == RUNNABLE && pcb[1].state != RUNNABLE)
			{
				current->state = RUNNABLE;
				current = &pcb[0];
				current->state = RUNNING;
				current->time_count = RUNTIME;
			}
		else if(pcb[1].state == RUNNABLE && pcb[0].state != RUNNABLE)
			{
				current->state = RUNNABLE;
				current = &pcb[1];
				current->state = RUNNING;
				current->time_count = RUNTIME;
			}
		else 
		{
				current->state = RUNNABLE;
				current = &pcb[0];
				current->state = RUNNING;
				current->time_count = RUNTIME;
		}
	}

	else if(pcb[0].state == RUNNING || pcb[0].state == BLOCKED)
	{
		if(pcb[1].state == RUNNABLE)
		{
			current->state = BLOCKED;
			current->time_count = 0;
			current = &pcb[1];
			current->state = RUNNING;
			current->time_count = RUNTIME;
		}
		else 
		{
			current->state = BLOCKED;
			current->time_count = 0;
			current = &idle;
			current->state = RUNNING;
			current->time_count = RUNTIME;
		}
	}

	else if(pcb[1].state == RUNNING || pcb[1].state == BLOCKED)
	{
		if(pcb[0].state == RUNNABLE)
		{
			current->state = BLOCKED;
			current->time_count = 0;
			current = &pcb[0];
			current->state = RUNNING;
			current->time_count = RUNTIME;
		}
		else 
		{
			current->state = BLOCKED;
			current->time_count = 0;
			current = &idle;
			current->state = RUNNING;
			current->time_count = RUNTIME;
		}
	}

	else  assert(0);
	tss.esp0 =(uint32_t) current->stack + KSTACK_SIZE;
}

void wake(int i)
{
	pcb[i].state = RUNNABLE;
	pcb[i].time_count = RUNTIME;
}

