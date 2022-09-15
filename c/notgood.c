#include"header.h"

/* This is called "fact", but it calculates Fibonacci! */
int fact(int n) {
    if (n <= 1) {
        return 1;
    }
    else {
        return fact(n-1) + fact(n-2);
    }
}