#include "x86.h"
#include "device.h"

#define PCB_MAX 2
#define KSTACK_SIZE 4096
//enum stat{NEW, RUNABLE, RUNNING, BLOCKED, DEAD};
/*typedef struct  {
	TrapFrame *tf;
	unsigned char stack[4096];
	int state;
	int time_count;
	int sleep_time;
	unsigned int pid;
}PCB;
*/

PCB pcb[PCB_MAX];
PCB idle;
PCB *current = &idle;

extern TSS tss;

void initPCB()
{
    current = &idle;   
    current->pid = 2;
    idle.tf = (TrapFrame*)(idle.stack + 4096 - sizeof(TrapFrame));
    
    int i = 0;
    for(; i < PCB_MAX; i++)
    {
        pcb[i].state = NEW;
        pcb[i].time_count = 0;
        pcb[i].sleep_time = 0;
        pcb[i].pid = i;
    }
}

/*
void initUserProcess()
{
    pcb[0].tf = (TrapFrame *)pcb[0].stack + KSTACK_SIZE - sizeof(TrapFrame);
    pcb[0].state = RUNABLE;
    pcb[0].tf->ss = USEL(SEG_UDATA);
	pcb[0].tf->esp = 0x200000;       
	pcb[0].tf->eflags = 0x202;
    
	pcb[0].tf->eip = loadUMain();
   
	pcb[0].tf->cs = USEL(SEG_UCODE);
	pcb[0].tf->es = USEL(SEG_UDATA);
	pcb[0].tf->ds = USEL(SEG_UDATA);
   // asm volatile("iret");

}
*/

void
initUserProcess(unsigned int Entry) {
	pcb[0].tf = (void*)(pcb[0].stack + 4096 - sizeof(TrapFrame));
	pcb[0].state = RUNNABLE;
	pcb[0].time_count = 10;
	pcb[0].sleep_time = 10;
	pcb[0].tf->ss = USEL(SEG_UDATA);
	pcb[0].tf->esp = 0x200000;
	pcb[0].tf->eflags = 0x202;
	pcb[0].tf->eip = Entry;
	pcb[0].tf->cs = USEL(SEG_UCODE);
	pcb[0].tf->es = USEL(SEG_UDATA);
	pcb[0].tf->ds = USEL(SEG_UDATA);
	
	/*RUNNABLE_table = 0;
	WAITING_table = -1;
	
	RUNNING_table = -1;
	WAITING_table2 = -1;
	*/
}

void initPCB2(void) {
    int i;
    for(i = 0; i < PCB_MAX; i ++) {
        // pcb[i].state = CREATED;
        pcb[i].state = RUNNABLE;
        //pcb[i].timeCount = 0;
       // pcb[i].sleepTime = 0;
        pcb[i].pid = i;
        // pcb[i].tf = (struct TrapFrame *)(pcb[i].stack+MAX_STACK_SIZE-sizeof(struct TrapFrame));
    }

    idle.tf = (struct TrapFrame *)(idle.stack+4096-sizeof(struct TrapFrame));
    // asm volatile("movl %%eax, %%esp"::"a"(IDLE.stack+MAX_STACK_SIZE));
    // IDLE.tf->esp = (uint32_t)(IDLE.stack+MAX_STACK_SIZE);
    pcb[0] = idle;
    
    pcb[1].tf = (struct TrapFrame *)(pcb[1].stack+4096-sizeof(struct TrapFrame));
    pcb[1].tf->eip = loadUMain();
    pcb[1].tf->esp = 0x200000;
    pcb[1].tf->es = USEL(SEG_UDATA);
    pcb[1].tf->ds = USEL(SEG_UDATA);
    pcb[1].tf->ss = USEL(SEG_UDATA);
    pcb[1].tf->cs = USEL(SEG_UCODE);
    pcb[1].tf->eflags = 0x202;
    pcb[1].state = RUNNABLE;
    //pcb[1].timeCount = RUNNING_TIME_PIECE;
}