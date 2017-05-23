#ifndef _X86_SEM_H
#define _X86_SEM_H

struct Semaphore {
    int value;
};

typedef struct Semaphore sem_t;


#endif