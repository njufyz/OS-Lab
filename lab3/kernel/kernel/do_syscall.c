#include "x86.h"
#include "device.h"

extern PCB* current;
extern SegDesc gdt[NR_SEGMENTS];

void
memcpy(unsigned char* dest, unsigned char* src, int size) {
	int i;
	for (i = 0; i < size; i++)
		*(dest+i) = *(src+i);
}

int SYS_write(struct TrapFrame *tf)
{
	puts(tf->ecx + base * (current->pid), tf->edx);
    return tf->edx;
}

int SYS_fork(struct TrapFrame *tf)
{
    //assert(pcb[1].state == NEW);
    pcb[1].state = RUNNABLE;
    pcb[1].sleep_time = 0;
    pcb[1].time_count = RUNTIME;
   
    memcpy((unsigned char*) (2 * base), (unsigned char*)base, base);
    memcpy((unsigned char*)pcb[1].stack, (unsigned char*)pcb[0].stack, KSTACK_SIZE);
    
    pcb[1].tf = (TrapFrame*)(pcb[1].stack + KSTACK_SIZE - sizeof(TrapFrame));
    pcb[1].tf->ss = USEL(SEG_UDATA_C);
	pcb[1].tf->cs = USEL(SEG_UCODE_C);
	pcb[1].tf->es = USEL(SEG_UDATA_C);
	pcb[1].tf->ds = USEL(SEG_UDATA_C);
    pcb[1].tf->eax = 2;
    pcb[1].pid = 2;

    current->tf->eax = 0;
    if(current->pid == 1)
        return 0;
    else return 1;
}

int SYS_sleep(struct TrapFrame *tf)
{
    assert(0);
    return 0;
}

int SYS_exit(struct TrapFrame *tf)
{
    assert(0);
    return 0;
}

int SYS_getpid(struct TrapFrame *tf)
{
    return current->pid;
}

void
SYS_fork2(struct TrapFrame *tf) {
	//if(current->pid > 0) 
    {
		PCB *child = &pcb[1];
        pcb[1].state = RUNNABLE;
		//int RUNNABLE_table = 1;
		char* child_begin = (char*)(2*base);
		char* parent_begin = (char*)base;
		char* parent_end = (char*)(2*base);
		while(parent_begin < parent_end)
		{
			*child_begin = *parent_begin;
			++parent_begin;
			++child_begin;
		}
		child->tf = (void *)(pcb[1].stack + KSTACK_SIZE - 68);
		child->state = RUNNABLE;
		child->time_count = 10;
		child->sleep_time = 10;
		memcpy_s(child->stack, current->stack, KSTACK_SIZE);
		((TrapFrame *)(child->tf))->cs = USEL(SEG_UCODE_C);
		((TrapFrame *)(child->tf))->ds = USEL(SEG_UDATA_C);
		((TrapFrame *)(child->tf))->es = USEL(SEG_UDATA_C);
		((TrapFrame *)(child->tf))->ss = USEL(SEG_UDATA_C);
		child->pid = 8;
		child->tf->eax = 8;
	}
	/*else if(current->pid == 0)
		current->tf->eax = RUNNING_table + 1;*/
}