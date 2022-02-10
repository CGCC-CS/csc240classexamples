#include<stdio.h>
#include<string.h>
#include"header.h"

int main(void) {
    int x = LENGTH;
    char str[LENGTH];
    int y;

    y = fact(5);
    strncpy(str, "Hello", LENGTH);

    printf("x=%d, str=%s, y=%d\n", x, str, y);
    return 0;
}