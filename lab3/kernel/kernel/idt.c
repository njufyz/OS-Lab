#include "x86.h"
#include "device.h"

#define INTERRUPT_GATE_32   0xE
#define TRAP_GATE_32        0xF

/* IDT表的内容 */
struct GateDescriptor idt[NR_IRQ]; // NR_IRQ=256, defined in x86/cpu.h

/* 初始化一个中断门(interrupt gate) */
static void setIntr(struct GateDescriptor *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
	ptr->offset_15_0 = offset & 0xFFFF;
	ptr->segment = selector << 3;
	ptr->pad0 = 
	ptr->type = INTERRUPT_GATE_32;
	ptr->system = FALSE;
	ptr->privilege_level = dpl;
	ptr->present = TRUE;
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
}

/* 初始化一个陷阱门(trap gate) */
static void setTrap(struct GateDescriptor *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
	ptr->offset_15_0 = offset & 0xFFFF;
	ptr->segment = selector << 3;
	ptr->pad0 = 0;
	ptr->type = TRAP_GATE_32;
	ptr->system = FALSE;
	ptr->privilege_level = dpl;
	ptr->present = TRUE;
	ptr->offset_31_16 = (offset >> 16) & 0xFFFF;
}

/* 声明函数，这些函数在汇编代码里定义 */
void irq0();
void irq1();
void irq14();
void vec0();
void vec1();
void vec2();
void vec3();
void vec4();
void vec5();
void vec6();
void vec7();
void vec8();
void vec9();
void vec10();
void vec11();
void vec12();
void vec13();
void vec14();
void vecsys();
void irq_empty();

void initIdt() {
	int i;
	/* 为了防止系统异常终止，所有irq都有处理函数(irqEmpty)。 */
	for (i = 0; i < NR_IRQ; i ++) {
		setTrap(idt + i, SEG_KCODE, (uint32_t)irq_empty, DPL_KERN);
	}
	/*
	 * init your idt here
	 * 初始化 IDT 表, 为中断设置中断处理函数
	 */

	setTrap(idt + 0x0, SEG_KCODE, (uint32_t)vec0, DPL_KERN);
	setTrap(idt + 0x1, SEG_KCODE, (uint32_t)vec1, DPL_KERN);
	setTrap(idt + 0x2, SEG_KCODE, (uint32_t)vec2, DPL_KERN);
	setTrap(idt + 0x3, SEG_KCODE, (uint32_t)vec3, DPL_KERN);
	setTrap(idt + 0x4, SEG_KCODE, (uint32_t)vec4, DPL_KERN);
	setTrap(idt + 0x5, SEG_KCODE, (uint32_t)vec5, DPL_KERN);
	setTrap(idt + 0x6, SEG_KCODE, (uint32_t)vec6, DPL_KERN);
	setTrap(idt + 0x7, SEG_KCODE, (uint32_t)vec7, DPL_KERN);
	setTrap(idt + 0x8, SEG_KCODE, (uint32_t)vec8, DPL_KERN);
	setTrap(idt + 0x9, SEG_KCODE, (uint32_t)vec9, DPL_KERN);
	setTrap(idt + 0xa, SEG_KCODE, (uint32_t)vec10, DPL_KERN);
	setTrap(idt + 0xb, SEG_KCODE, (uint32_t)vec11, DPL_KERN);
	setTrap(idt + 0xc, SEG_KCODE, (uint32_t)vec12, DPL_KERN);
	setTrap(idt + 0xd, SEG_KCODE, (uint32_t)vec13, DPL_KERN);
	setTrap(idt + 0xe, SEG_KCODE, (uint32_t)vec14, DPL_KERN);
	
	setIntr(idt + 0x80, SEG_KCODE, (uint32_t)vecsys, DPL_USER);
	// for int 0x80, interrupt vector is 0x80, Interruption is disabled

	setIntr(idt + 32 + 0, SEG_KCODE, (uint32_t)irq0, DPL_KERN);
	setIntr(idt + 32 + 1, SEG_KCODE, (uint32_t)irq1, DPL_KERN);
	setIntr(idt + 32 + 14, SEG_KCODE, (uint32_t)irq14, DPL_KERN);
	
	/* 写入IDT */
	saveIdt(idt, sizeof(idt));
}
