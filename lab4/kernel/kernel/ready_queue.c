#include "device.h"
#include "x86.h"

#define QUEUE_SIZE 5

 int queue[QUEUE_SIZE];
 int head = 0;
 int tail = 0;

//进队列
 inline void EnQueue(int value){
    if ((tail + 1) % QUEUE_SIZE == head) 
       assert(0);
    else
    {
        queue[tail] = value;
        tail = (tail + 1) % QUEUE_SIZE;
    }
}

//出队列
 inline int DeQueue(){
    int temp = 0;
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
 inline int IsEmpty(){
    if (head == tail)
        return 1;
    return 0;
}

//判断队列是否已满
 inline int IsFull(){
    if ((tail + 1) % QUEUE_SIZE == head)
        return 1;
    return 0;
}
