#include "x86.h"
#include "device.h"
#include "common.h"

PCB pcb[PCB_MAX];
PCB idle;
PCB *current = &idle;
int pronum = 1;

extern TSS tss;

void initPCB()
{
    current = &idle;   
    current->pid = 0;
    idle.tf = (TrapFrame*)(idle.stack + KSTACK_SIZE - sizeof(TrapFrame));
    
    int i = 0;
    for(; i < PCB_MAX; i++)
    {
        pcb[i].state = NEW;
        pcb[i].time_count = 0;
        pcb[i].sleep_time = 0;
        pcb[i].pid = i + 1;
    }
}


void
initUserProcess() {
	pcb[0].tf = (void*)(pcb[0].stack + KSTACK_SIZE - sizeof(TrapFrame));
	pcb[0].state = RUNNABLE;
	EnQueue(0);

	pcb[0].time_count = RUNTIME;
	pcb[0].sleep_time =  0;
	pcb[0].tf->esp = base;
	pcb[0].tf->eflags = 0x202;
	pcb[0].tf->eip = loadUMain();

    pcb[0].tf->ss = USEL(SEG_UDATA);
	pcb[0].tf->cs = USEL(SEG_UCODE);
	pcb[0].tf->es = USEL(SEG_UDATA);
	pcb[0].tf->ds = USEL(SEG_UDATA);
	
}

