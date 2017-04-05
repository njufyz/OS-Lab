
#include "boot.h"

#define SECTSIZE 512

typedef  unsigned int  uint32_t;
typedef  unsigned char uint8_t;

void bootMain(void) {
	
	ELF* Elf = (ELF*)0x10000; 
	readseg((uint32_t)Elf, SECTSIZE * 8, 0);

	Proghdr* ph = (Proghdr*)( (uint8_t*)Elf + Elf->phoff);
	Proghdr* end_ph = ph + Elf->phnum;
	for(; ph < end_ph; ph++)
	{
		uint8_t *i = (uint8_t *)(ph->paddr +  ph->filesz);
		readseg((uint32_t)ph->paddr, ph->memsz, ph->off);
		for(; i<(uint8_t *)(ph->paddr + ph->memsz); *i++=0);
	}
	
	((void (*)(void)) (Elf->entry))();
	
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
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
