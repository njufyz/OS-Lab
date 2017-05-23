#include "x86.h"
#include "device.h"
#include "common.h"

sem_t sem;

int SYS_sem_init(struct TrapFrame *tf)
{
    sem.value = tf->ebx;
    return tf->ebx;
}

int SYS_sem_wait(struct TrapFrame *tf)
{
    disableInterrupt();
    sem.value--;
    if(sem.value < 0)
    {
        current->state = BLOCKED;
        current->time_count = 0;
        wEnQueue(current->pid - 1);
        schedule();
    }
    enableInterrupt();
    return 1;
}

int SYS_sem_post(struct TrapFrame *tf)
{
    disableInterrupt();
    sem.value++;
    if(sem.value <= 0)
    {
        int t = wDeQueue();
        pcb[t].state = RUNNABLE;
        EnQueue(t);
    }
     enableInterrupt();
     
    return 1;
    
}