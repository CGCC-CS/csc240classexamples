#include<stdio.h>
#include<string.h>

#define LENGTH 15

typedef struct {
    int x;
    char n[LENGTH];
} csc240_t;

int main() {
    /* Variables */
    int num = 0;
    char str1[] = "CSC240";
    csc240_t structVar = {40, "Struct"};

    /* Pointer variables */
    int * iPtr = &num;
    char * cPtr = str1;
    csc240_t * structPtr = &structVar;

    /* Printing out pointers & addresses */
    printf("Inital values:\n");
    printf("num=%d, str1=%s\n", num, str1);
    printf("iPtr=%p  address=%p, *iPtr=%d\n", (void*) iPtr, (void*) &iPtr, *iPtr);
    printf("cPtr=%p  address=%p, *cPtr=%c\n", (void*) cPtr, (void*) &cPtr, *cPtr);

    /* Changing values with a pointer */
    *iPtr = 24; /* *iPtr gives me an alias of num */
    *(cPtr+4) = '2'; /* *(cPtr+4) gives me an alias str1[4] */
    printf("\nAfter changing:\n");
    printf("num=%d, str1=%s\n", num, str1);
    printf("iPtr=%p  address=%p, *iPtr=%d\n", (void*) iPtr, (void*) &iPtr, *iPtr);
    printf("cPtr=%p  address=%p, *cPtr=%c\n", (void*) cPtr, (void*) &cPtr, *cPtr);

    /* Use char ptr to go through a string */
    printf("\nPrint str1 using cPtr: ");
    while(*cPtr != '\0') {
        putchar(*cPtr);
        cPtr++;
    }
    putchar('\n');

    /* Working with structs */
    printf("\nWorking with structs:\n");
    printf("structVar = %d %s address=%p\n", structVar.x, structVar.n, (void*) &structVar);
    printf("structPtr = %p (%d %s) address=%p\n", (void*) structPtr, structPtr->x, structPtr->n, (void*) &structPtr);

    /* Changing a struct with a pointer */
    structPtr->x = 75;
    strncpy(structPtr->n, "PointerFun", LENGTH);
    printf("\nAfter Changes:\n");
    printf("structVar = %d %s address=%p\n", structVar.x, structVar.n, (void*) &structVar);
    printf("structPtr = %p (%d %s) address=%p\n", (void*) structPtr, structPtr->x, structPtr->n, (void*) &structPtr);


    /* String character by character */
    /* cPtr = 17;  You shouldn't assign integer literals to pointers */
    /* cPtr = &structVar;  You can look at memory byte-by-byte */
    cPtr = str1;
    /* for (int ii=0;ii<15;ii++) {   DANGEROUS: hard-coded index for end of string */
    for (int ii=0;ii<strlen(str1);ii++) {   
        printf("%d: *cptr='%c' (%d)\n", ii, *(cPtr+ii), *(cPtr+ii));
    }

    return 0;
}
