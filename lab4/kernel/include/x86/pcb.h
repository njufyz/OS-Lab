#ifndef _PCB_H_
#define _PCB_H_

#define PCB_MAX 2
#define RUNTIME 10
enum stat{NEW, RUNNABLE, RUNNING, SLEEPING, BLOCKED, DEAD};


void initPCB();
void initUserProcess();
void schedule();

extern PCB idle;
extern PCB pcb[PCB_MAX];

#endif