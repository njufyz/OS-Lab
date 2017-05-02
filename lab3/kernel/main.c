#include "common.h"
#include "x86.h"
#include "device.h"

void kEntry(void) {
   
	initSerial();// initialize serial port
	initIdt(); // initialize idt
	initIntr(); // iniialize 8259a
	initSeg(); // initialize gdt, tss
	initTimer(); //initialize timer 

	initPCB();
	//loadUMain();
	int Entry = loadUMain();
	initUserProcess(Entry);

	asm volatile("movl %%eax, %%esp":: "a" (idle.stack + 4096));
	
	enableInterrupt();
	 
	while(1)
	{
		waitForInterrupt();
	}
	while(1);
	assert(0);
}
