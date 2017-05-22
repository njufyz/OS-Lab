#ifndef __lib_h__
#define __lib_h__
#include "types.h"

void printf(const char *format,...);
int fork();
int getpid();
int sleep(uint32_t time);
int exit();
int sem_init(sem_t *sem, uint32_t value);
int sem_post(sem_t *sem);
int sem_wait(sem_t *sem);
int sem_destroy(sem_t *sem);

/*----------------------------------------*/

int strlen(const char* str);
void strcpy(char*dest, const char*s );
void strcat(char*dest, const char*s);
int itoa(int m, char* s, int radix);
int itoa_x(unsigned m, char* s);



#endif
