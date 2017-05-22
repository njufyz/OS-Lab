#include "lib.h"
#include "types.h"
#include<stdarg.h>

/*
 * io lib here
 * 库函数写在这
 */
int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;

	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/

	asm volatile("int $0x80": "=a"(ret): "a"(num), "b"(a1), "c"(a2), "d"(a3));	
	return ret;
}

void printf(const char* fmt,...)
{
    char str[256] = { 0 };
    char* p =str;

    va_list arg;
    va_start(arg, fmt);
    int i;
    for(i=0;fmt[i]!=0;i++)
    {
        if(fmt[i] != '%') 
        {
            *p++ = fmt[i];
            continue;
        }
        i++;
        char *s = NULL;
        char num[33] = { 0 };
        int temp = 0;

        switch (fmt[i])
        {
            case '%':                         break;       
            case 'c':*p++ = va_arg(arg, int); break;
            case 'd':temp = itoa(va_arg(arg, int), num, 10); strcat(p, num); p += temp; break;
            case 's':s = va_arg(arg, char*);  strcat(p, s); if(s!=NULL) p += strlen(s);  break;
            case 'x':temp = itoa_x(va_arg(arg, unsigned), num); strcat(p, num); p += temp; break;                          break;           
            default: *p++ = fmt[i];
        }
    }
    va_end(arg);
	syscall(SYS_WRITE, 1, (uint32_t)str, strlen(str), 0, 0);
}

int fork()
{
    return syscall(SYS_FORK, 0, 0, 0, 0, 0);
}

int sleep(uint32_t time)
{
    return syscall(SYS_SLEEP, time, 0, 0, 0, 0);
}

int exit()
{
     return syscall(SYS_EXIT, 0, 0, 0, 0, 0);
}

int getpid()
{
    return syscall(SYS_GETPID, 0, 0, 0, 0, 0);
}