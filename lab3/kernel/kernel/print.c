#include<stdarg.h>
#include "x86.h"
#include "device.h"

#define NULL ((void*)0)

int x = 0;
int y = 0;

void clear(){
	int i = 0;
	int j = 0;
	int16_t* word;

	for(; j < 25;j++)
	{
	for(i = 0; i<80; i++)
	  {	
		word = (int16_t *)0xB8000 + (j * 80 + i); 
    	*word = ' ' | (0xc << 8);
	  } 
	}
}

void putc(char ch){
     //putChar(ch);
	if(ch != '\n')
	{
		int16_t* word = (int16_t *)0xB8000 + (y * 80 + x); 
    	*word = ch | (0xc << 8);
		if(++x == 80)
		{
			x = 0;
			y++;
		}
	}
	else
	{
		x = 0;
		y++;
	}
}

void puts(uint32_t s, int lenth)
{
	if(x == 0 && y == 0)
		clear();
	int i = 0;
	char* str = (char*)s;

	while(i < lenth)
		putc(str[i++]);
}

int strlen(const char* str)
{
	int i = 0;
	for(; str[i]!= 0;i++);
	return i;
}

void strcpy(char*dest, const char*s )
{
	int i = 0;
	for(; s[i]!=0;i++)
		dest[i] = s[i];
}

void strcat(char*dest, const char*s)
{
	int i = 0;
	int j = 0;
	for(;dest[i]!=0;i++);
	for(;s[j]!=0;i++,j++)
		dest[i]=s[j];
}

int itoa(int m, char* s, int radix)
{
    if(m == 0)
    {
        s[0] = '0';
        s[1] = 0;
        return 1;
    }

    if(m == (int)0x80000000)
    {
        strcat(s,"-2147483648");
        return 11;
    }

    char number[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
    int n = m;
    s[0] = (m >= 0) ? 0 : '-' ;
    if( m < 0) n = -m;
    int i = (m >= 0) ? 0 : 1 ;
    while(n > 0)
    {
        s[i] = number[n % radix];
        n/= radix;
        i++;
    }
    s[i] = 0;
    
    char* start = (m >= 0) ? s : s + 1 ;
    char* end =  s + i - 1;
    for(;start < end; start++, end--)
    {
        char c = *start;
        *start = *end;
        *end = c;
    }
    return i;
}

int itoa_x(unsigned m, char* s)
{
    int ret;
    if(!(m>>31 & 1))
         ret = itoa((int)m, s, 16);
    else
    {
        char b[9] = {0};
        int i = 0;
        char number[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
        union Hex{
           unsigned int val;
           unsigned char a[4];
         }hex;
        hex.val = m;
       
        for(;i<4;i++)
         {
            b[2*i] = number[(hex.a[3-i] >> 4)];
            b[2*i+1] = number[(hex.a[3-i] & 0xf)];
         }
        strcpy(s,b);
        ret = 8;
    }
    return ret;
}

void printk(const char* fmt,...)
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
	puts((uint32_t)str, strlen(str));
}
