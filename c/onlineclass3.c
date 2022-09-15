#include<stdio.h>
#include"header.h"

int main(void) {

    char class[LENGTH] = "C, C++, Scheme";

    printf("Classes: %s\n", class);

    printf("\nFactorial:\n");
    for (int ii=0; ii<LENGTH; ii++) {
        printf("\t%d!=%d\n", ii, fact(ii));
    }

    return 0;
}