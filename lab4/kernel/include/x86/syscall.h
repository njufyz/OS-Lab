#ifndef _X86_SYSCALL_H
#define _X86_SYSCALL_H

int SYS_exit(struct TrapFrame *tf);
int SYS_fork(struct TrapFrame *tf);
int SYS_write(struct TrapFrame *tf);
int SYS_sleep(struct TrapFrame *tf);
int SYS_getpid(struct TrapFrame *tf);
int SYS_sem_init(struct TrapFrame *tf);
int SYS_sem_post(struct TrapFrame *tf);
int SYS_sem_wait(struct TrapFrame *tf);


void SyscallHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);
void TimerHandle(struct TrapFrame *tf);

void schedule();

#endif