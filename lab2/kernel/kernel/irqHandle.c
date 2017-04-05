#include "x86.h"
#include "device.h"

static int x = 0;
static int y = 0;

static void clear(){
	int i = 0;
	int j = 0;
	int16_t* word;

	for(; j < 25;j++)
	{
	for(i = 0; i<80; i++)
	  {	
		word = (int16_t *)0xB8000 + (j * 80 + i); 
    	*word = ' ' | (0xc << 8);
	  } 
	}
}

static void putc(char ch){
	if(ch != '\n')
	{
		int16_t* word = (int16_t *)0xB8000 + (y * 80 + x); 
    	*word = ch | (0xc << 8);

		if(++x == 80)
		{
			x = 0;
			y++;
		}
		
	}

	else
	{
		x = 0;
		y++;
	}
	
	
}

static void puts(uint32_t s, int lenth)
{
	int i = 0;
	char* str = (char*)s;

	while(i < lenth)
		putc(str[i++]);
}

void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void SYS_write(struct TrapFrame *tf)
{
	assert(tf->eax == 4 && tf->ebx == 1);
	if(x == 0 && y == 0)
		clear();
	puts(tf->ecx, tf->edx);
}

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */
	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
	}
	
}

void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	if(tf->eax == 4)
		SYS_write(tf);
}


void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}
