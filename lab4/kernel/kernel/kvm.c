#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
TSS tss;

extern PCB idle;

#define SECTSIZE 512

void waitDisk(void) {
	while((inByte(0x1F7) & 0xC0) != 0x40); 
}

void readSect(void *dst, int offset) {
	int i;
	waitDisk();
	
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}

void readseg(uint32_t pa, uint32_t count, uint32_t offset)
{
	uint32_t end_pa;

	end_pa = pa + count;
	
	pa -= offset % SECTSIZE;

	offset = (offset / SECTSIZE) + 1;

	while (pa < end_pa) {
		readSect((uint8_t*) pa, offset);
		pa += SECTSIZE;
		offset++;
	}
}

void initSeg() {
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, base,    base      , DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         base,    base      , DPL_USER);
	gdt[SEG_UCODE_C] = SEG(STA_X | STA_R, base,  base      , DPL_USER);
	gdt[SEG_UDATA_C] = SEG(STA_W,    2 * base,    base      , DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
	tss.ss0 = KSEL(SEG_KDATA);
	tss.esp0 = (uint32_t)idle.stack + KSTACK_SIZE;
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	/*设置正确的段寄存器*/
	//movw    %ax,%ds             # -> Data Segment
	asm volatile("movw %%ax, %%ds":: "a" (KSEL(SEG_KDATA)));

   	//movw    %ax,%es             # -> Extra Segment
	asm volatile("movw %%ax, %%es":: "a" (KSEL(SEG_KDATA)));

 	//movw    %ax,%ss             # -> Stack Segment
	asm volatile("movw %%ax, %%ss":: "a" (KSEL(SEG_KDATA)));


	lLdt(0);
	
}

void enterUserSpace(uint32_t entry) {
	/*
	 * Before enter user space 
	 * you should set the right segment registers here
	 * and use 'iret' to jump to ring3
	 */

	asm volatile("movw %%ax, %%ds":: "a" (USEL(SEG_UDATA)));
	asm volatile("movw %%ax, %%es":: "a" (USEL(SEG_UDATA)));

	asm volatile("pushl %%eax":: "a" (USEL(SEG_UDATA)));
	asm volatile("pushl %%eax":: "a" (0x200000));
	asm volatile("pushfl");
	asm volatile("pushl %%eax":: "a" (USEL(SEG_UCODE)));
	asm volatile("pushl %%eax":: "a" (entry));
	asm volatile("iret");
}

uint32_t loadUMain(void) {

	ELF* Elf = (ELF*)0x10000; 
	readseg((uint32_t)Elf, SECTSIZE * 8, SECTSIZE * 200);
	
	if(Elf->magic != 0x464C457FU ) 
		while(1);

	Proghdr* ph = (Proghdr*)( (uint8_t*)Elf + Elf->phoff);
	Proghdr* end_ph = ph + Elf->phnum;
	for(; ph < end_ph; ph++)
	{
		uint8_t *i = (uint8_t *)(ph->paddr +  ph->filesz + base);
		if(ph->type == 1)
			{
				readseg((uint32_t)(ph->paddr + base), ph->filesz, ph->off + SECTSIZE * 200);
				for(;i<(uint8_t *)(ph->paddr + ph->memsz + base ); *i++ = 0);
			}
	}
	return Elf->entry;
}
