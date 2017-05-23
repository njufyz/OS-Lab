#include "x86.h"
#include "device.h"
#include "common.h"

extern PCB* current;
extern int processnum;
extern int processnum;
extern int pronum;

void schedule();

int SYS_write(struct TrapFrame *tf)
{
	puts(tf->ecx + base * (current->pid), tf->edx);
    return tf->edx;
}

int SYS_fork(struct TrapFrame *tf)
{
    //拷贝用户栈
    memcpy((unsigned char*) (2 * base), 
           (unsigned char*)base, 
           base);

    //拷贝内核栈
    memcpy((unsigned char*)pcb[1].stack, 
           (unsigned char*)pcb[0].stack, 
           KSTACK_SIZE);
    
    //设置TrapFrame
    pcb[1].tf = (TrapFrame*)(pcb[1].stack + KSTACK_SIZE - sizeof(TrapFrame));
    pcb[1].tf->ss = USEL(SEG_UDATA_C);
	pcb[1].tf->cs = USEL(SEG_UCODE_C);
	pcb[1].tf->es = USEL(SEG_UDATA_C);
	pcb[1].tf->ds = USEL(SEG_UDATA_C);
    pcb[1].tf->eax = 0;                  //子进程应该返回0
   
    //设置PCB状态
    pcb[1].state = RUNNABLE;
    pcb[1].sleep_time = 0;
    pcb[1].time_count = RUNTIME;
    EnQueue(1);
    
    //进程数
    pronum++;
    return 2;                           //父进程返回子进程pid
}

int SYS_sleep(struct TrapFrame *tf)
{
    int time = tf->ebx;
    current->state = SLEEPING;
    current->time_count = 0;
    current->sleep_time = time;
   // wEnQueue(current->pid);
    schedule();
    return 0;
}

int SYS_exit(struct TrapFrame *tf)
{
   // assert(0);
    current->state = DEAD;
    current->time_count = 0;
   pronum--;
    schedule();
    return 0;
}

int SYS_getpid(struct TrapFrame *tf)
{
    return current->pid;
}

