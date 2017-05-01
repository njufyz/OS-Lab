#ifndef _PCB_H_
#define _PCB_H_

enum stat{NEW, RUNNABLE, RUNNING, BLOCKED, DEAD};

void initPCB();
void initUserProcess();

extern PCB idle;
extern PCB pcb[2];

#endif