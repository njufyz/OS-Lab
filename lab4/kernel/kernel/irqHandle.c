#include "x86.h"
#include "device.h"
#include "common.h"

extern PCB* current;
extern PCB idle;
extern TSS tss;
extern int pronum;

void SyscallHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);
void TimerHandle(struct TrapFrame *tf);

int SYS_exit(struct TrapFrame *tf);
int SYS_fork(struct TrapFrame *tf);
int SYS_write(struct TrapFrame *tf);
int SYS_sleep(struct TrapFrame *tf);
int SYS_getpid(struct TrapFrame *tf);

void schedule();

void irqHandle(struct TrapFrame *tf) {
	
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
			TimerHandle(tf);
			break;
		
		case 33:	
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
	//putChar(current->pid + '0');
	int i;
	for(i = 0; i < PCB_MAX; i++)
	{
		if(pcb[i].state == RUNNING)
		{
			pcb[i].time_count--;
			if(pcb[i].time_count == 0)
			{
				EnQueue(i);
				pcb[i].state = RUNNABLE;
				//pcb[i].time_count = RUNTIME;
			}
		}
		
		if(pcb[i].state == SLEEPING)
		{
			pcb[i].sleep_time--;
			if(pcb[i].sleep_time == 0)
			{
				EnQueue(i);
				pcb[i].state = RUNNABLE;
				//pcb[i].time_count = RUNTIME;
			}
		}
	}
	schedule();
}

