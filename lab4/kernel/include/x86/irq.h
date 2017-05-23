#ifndef __IRQ_H__
#define __IRQ_H__

/* 中断处理相关函数 */
void initIdt(void);
void initIntr(void);
void initTimer();

#define SYS_EXIT            1
#define SYS_FORK            2
#define SYS_READ            3
#define SYS_WRITE           4
#define SYS_SLEEP           5
#define SYS_GETPID          6
#define SYS_SEM_INIT        7
#define SYS_SEM_POST        8
#define SYS_SEM_WAIT        9
#define SYS_SEM_DESTROY     10


#endif
