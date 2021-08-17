#include<stdio.h>
#include"header.h"

/* Example from online class 3 */

int main(void) {

    printf("\nFactorial:\n");
    for (int ii=0; ii<LENGTH; ii++) {
        printf("\t%d!=%d\n", ii, fact(ii));
    }

    return 0;
}
