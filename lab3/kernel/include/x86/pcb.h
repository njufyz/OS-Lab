#ifndef _PCB_H_
#define _PCB_H_

enum stat{NEW, RUNNABLE, RUNNING, BLOCKED, DEAD};
#define PCB_MAX 2

void initPCB();
void initUserProcess();

extern PCB idle;
extern PCB pcb[PCB_MAX];

#endif