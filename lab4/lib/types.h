#ifndef __TYPES_H__
#define __TYPES_H__

typedef unsigned int   uint32_t;
typedef          int   int32_t;
typedef unsigned short uint16_t;
typedef          short int16_t;
typedef unsigned char  uint8_t;
typedef          char  int8_t;
typedef unsigned char  boolean;
#define NULL ((void*)0)

typedef uint32_t size_t;
typedef int32_t  pid_t;

struct Semaphore {
    int value;
};
typedef struct Semaphore sem_t;

#define SYS_EXIT 1
#define SYS_FORK 2
#define SYS_READ 3
#define SYS_WRITE 4
#define SYS_SLEEP 5
#define SYS_GETPID 6


#endif
