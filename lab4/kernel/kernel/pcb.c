#include "x86.h"
#include "device.h"
#include "common.h"

PCB pcb[PCB_MAX];
PCB idle;
PCB *current = &idle;
int pronum = 1;

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

    //设置tf指向TrapFrame首地址
	pcb[0].tf = (void*)(pcb[0].stack + KSTACK_SIZE - sizeof(TrapFrame));

    //设置状态、运行时间片
	pcb[0].state = RUNNABLE;
	pcb[0].time_count = RUNTIME;
	pcb[0].sleep_time =  0;

    //设置TrapFrame的内容
	pcb[0].tf->esp = base;
	pcb[0].tf->eflags = 0x202;
	pcb[0].tf->eip = loadUMain();

    pcb[0].tf->ss = USEL(SEG_UDATA);
	pcb[0].tf->cs = USEL(SEG_UCODE);
	pcb[0].tf->es = USEL(SEG_UDATA);
	pcb[0].tf->ds = USEL(SEG_UDATA);

    //进程进入就绪队列
	EnQueue(0);
}

void schedule()
{
	//putChar('0');
	if(current != &idle && current->time_count > 0)
		return ;

	if(pronum == 0)
		current = &idle;

	else if(IsEmpty() == 1)
		current = &idle;

	else
	{
		int t = DeQueue();
		current = &pcb[t];
		current->state = RUNNING;
		current->time_count = RUNTIME;
	}
//	putChar(current->pid + '0');
	tss.esp0 =(uint32_t) current->stack + KSTACK_SIZE;
}



