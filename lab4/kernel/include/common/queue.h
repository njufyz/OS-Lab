/*
就绪队列
*/

#ifndef _COMMON_QUEUE_H_
#define _COMMON_QUEUE_H_


//进队列
void EnQueue(int value);

//出队列
int DeQueue();
    

//判断队列是否为空
int IsEmpty();
   
//判断队列是否已满
int IsFull();

#endif