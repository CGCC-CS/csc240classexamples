#include<stdio.h>
#include"header.h"

int main(void) {

    char class[LENGTH] = "C, C++, Scheme, Prolog";
    char * c_ptr;

    printf("\nFactorial:\n");
    for (int ii=0; ii<LENGTH; ii++) {
        printf("\t%d!=%d\n", ii, fact(ii));
    }

    int jj=0;
    c_ptr = class;
    printf("\n");
    printf("Contents of %s\n", class);
    while ( (jj<LENGTH) && (*c_ptr != '\n') ) {
        printf("[%c=%d] ", *(c_ptr+jj), *(c_ptr+jj));
        if (((jj+1) % 10) == 0) {
            printf("\n");
        }
        jj++;
    }
    printf("\n");

    return 0;
}
