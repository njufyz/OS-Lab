#include "lib.h"
#include "types.h"

int data = 0;

int uEntry(void) {

    int ret = fork();
    int i = 4;

    if (ret == 0) {
        data = 2;
        while( i!=0) {
            i --;
            printf("Child Process: Pong %d, %d;\n", data, i);
            sleep(128);
           // printf("1");
        }
        exit();
    }
    else if (ret != -1) {
        data = 1;
        while( i != 0) {
            i --;
            printf("Father Process: Ping %d, %d;\n", data, i);
            sleep(128);
          //  printf("2");
        }
        exit();
    }
    
    /*int x = fork();
    while(1)
    {
        if(x == 0)
            printf("1");
        else printf("0");
    }*/
    while(1); 
    
    return 0;
}