#include"header.h"

int fact(int n) {
    if (n <= 1) {
        return 1;
    }
    else {
        return n + fact(n-1);  /* WRONG - this adds instead of multiply */
    }
}
