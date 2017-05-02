#ifndef __IRQ_H__
#define __IRQ_H__

/* 中断处理相关函数 */
void initIdt(void);
void initIntr(void);
void initTimer();

#define SYS_EXIT 1
#define SYS_FORK 2
#define SYS_READ 3
#define SYS_WRITE 4
#define SYS_SLEEP 5


#endif
