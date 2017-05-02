/*
就绪队列
*/

#ifndef _COMMON_QUEUE_H_
#define _COMMON_QUEUE_H_

#include "x86.h"
#include "device.h"

#define QUEUE_SIZE 5

static int queue[QUEUE_SIZE];
static int head = 0;
static int tail = 0;

//进队列
static inline void EnQueue(int value){
    if ((tail + 1) % QUEUE_SIZE == head) 
       assert(0);
    else{
        queue[tail] = value;
        tail = (tail + 1) % QUEUE_SIZE;
    }
}

//出队列
static inline int DeQueue(){
    int temp;
    if (tail == head)
        assert(0);
    else
    {
        temp = queue[head];
        head = (head + 1) % QUEUE_SIZE;
    }
    return temp;
}

//判断队列是否为空
static inline int IsEmpty(){
    if (head == tail)
        return 1;
    return 0;
}

//判断队列是否已满
static inline int IsFull(){
    if ((tail + 1) % QUEUE_SIZE == head)
        return 1;
    return 0;
}

#endif