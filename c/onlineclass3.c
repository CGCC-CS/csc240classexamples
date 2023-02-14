#include<stdio.h>
#include"header.h"

int main(void) {

    printf("\nFactorial:\n");
    for (int ii=0; ii<LENGTH; ii++) {
        printf("\t%d!=%d\n", ii, fact(ii));
    }

    return 0;
}