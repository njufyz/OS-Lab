#include "lib.h"
#include "types.h"
#include<stdarg.h>

#define NULL ((void*)0)
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
