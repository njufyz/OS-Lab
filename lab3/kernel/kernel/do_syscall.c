#include "x86.h"
#include "device.h"
#define base 0x200000

void SYS_write(struct TrapFrame *tf)
{
	assert(tf->eax == SYS_WRITE && tf->ebx == 1);
	puts(tf->ecx + base, tf->edx);
    tf->eax = tf->edx;
}

void SYS_fork(struct TrapFrame *tf)
{
    assert(0);
}

void SYS_sleep(struct TrapFrame *tf)
{
    assert(0);
}

void SYS_exit(struct TrapFrame *tf)
{
    assert(0);
}