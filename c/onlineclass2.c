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
    printf("iPtr=%p  address=%p  *iPtr=%d\n", (void *) iPtr, (void *) &iPtr, *iPtr);
    printf("cPtr=%p  address=%p  *cPtr=%c\n", (void *) cPtr, (void *) &cPtr, *cPtr);

    /* Use char pointer to go through a string */
    printf("Print string using a pointer: ");
    while(*cPtr != '\0') {
        putchar(*cPtr);
        cPtr++;
    }
    printf("\n\n");

    /* Working with structs */
    printf("structVar = %d %s address=%p\n", structVar.x ,structVar.n, (void*) &structVar);
    printf("structPtr = %p  {%d %s} address=%p\n", (void *) structPtr, structPtr->x,
                                                 structPtr->n, (void*)&structPtr);
    
    /* Changing a struct with a pointer */
    structPtr->x = 75;
    strncpy(structPtr->n, "PointerFun", LENGTH);
    printf("After changes:\n");
    printf("  structVar = %d %s address=%p\n", structVar.x ,structVar.n, (void*) &structVar);
    printf("  structPtr = %p  {%d %s} address=%p\n", (void *) structPtr, structPtr->x,
                                                 structPtr->n, (void*)&structPtr);

    cPtr = str1;
    for (int ii=0;ii<10;ii++){
        printf("%d: *cPtr='%c' %d\n", ii, *(cPtr+ii), *(cPtr+ii));
    }
    
}
