#include "common.h"
#include "x86.h"
#include "device.h"

void kEntry(void) {
   
	initSerial();	// initialize serial port
	initIdt();		// initialize idt
	initIntr(); 	// iniialize 8259a
	initSeg(); 		// initialize gdt, tss
	initTimer(); 	//initialize timer 
	initPCB();      //initialize PCB
	initUserProcess();
	
	//set up kernel stack
	asm volatile("movl %%eax, %%esp":: "a" (idle.stack + KSTACK_SIZE));
	
	enableInterrupt();
	 
	while(1)
	{
		waitForInterrupt();
	}
	
	while(1);
	assert(0);
}
