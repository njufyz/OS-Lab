#include "x86.h"
#include "device.h"

extern PCB* current;
extern SegDesc gdt[NR_SEGMENTS];

void schedule();

int SYS_write(struct TrapFrame *tf)
{
	puts(tf->ecx + base * (current->pid), tf->edx);
    return tf->edx;
}

int SYS_fork(struct TrapFrame *tf)
{
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
    return 0;
}

int SYS_sleep(struct TrapFrame *tf)
{
    int time = tf->ebx;
    current->state = BLOCKED;
    current->time_count = 0;
    current->sleep_time = time;
    schedule();
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

