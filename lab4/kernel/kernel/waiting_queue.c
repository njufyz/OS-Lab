#include "device.h"
#include "x86.h"

#define wQUEUE_SIZE 5

 int wq[wQUEUE_SIZE];
 int whead = 0;
 int wtail = 0;

//进队列
  void wEnQueue(int value){
    if ((wtail + 1) % wQUEUE_SIZE == whead) 
       assert(0);
    else
    {
        wq[wtail] = value;
        wtail = (wtail + 1) % wQUEUE_SIZE;
    }
}

//出队列
  int wDeQueue(){
    int temp = 0;
    if (wtail == whead)
        assert(0);
    else
    {
        temp = wq[whead];
        whead = (whead + 1) % wQUEUE_SIZE;
    }
    return temp;
}

//判断队列是否为空
  int wIsEmpty(){
    if (whead == wtail)
        return 1;
    return 0;
}

//判断队列是否已满
  int wIsFull(){
    if ((wtail + 1) % wQUEUE_SIZE == whead)
        return 1;
    return 0;
}
