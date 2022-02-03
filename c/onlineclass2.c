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
    csc240_t struct_var = {40, "Struct"};

    /* Pointer variables */
    int * i_ptr = &num;
    char * c_ptr = str1;  /* equivalent &str1[0] */
    csc240_t * struct_ptr = &struct_var;

    /* Printing out pointers & addresses */
    printf("Initial values:\n");
    printf("num=%d (address=%p)\n", num, (void*) &num);
    printf("str1=%s (address=%p)\n", str1, (void*) &str1[0]);
    printf("str1+2=%s (address=%p)\n", str1+2, (void*) (str1+2));
    printf("i_ptr=%p (address=%p) *i_ptr=%d\n", (void*) i_ptr, (void*) &i_ptr, *i_ptr);
    printf("c_ptr=%p (address=%p) *c_ptr=%s\n", (void*) c_ptr, (void*) &c_ptr, c_ptr);

    /* Changing values with a poitner */
    printf("\n");
    *i_ptr = 24;       /* *i_ptr gives me an alias num */
    *(c_ptr+4) = '2';  /* *(c_ptr+4) give me an alias str1[4] */
    printf("After changing:\n");
    printf("num=%d (address=%p)\n", num, (void*) &num);
    printf("str1=%s (address=%p)\n", str1, (void*) &str1[0]);
    printf("i_ptr=%p (address=%p) *i_ptr=%d\n", (void*) i_ptr, (void*) &i_ptr, *i_ptr);
    printf("c_ptr=%p (address=%p) *c_ptr=%s\n", (void*) c_ptr, (void*) &c_ptr, c_ptr);

    /* Using a char pointer to go through a string */
    printf("\n");
    printf("1 - Print str1 using c_ptr: ");
    c_ptr=str1;
    while(*c_ptr != '\0') { 
        putchar(*c_ptr);
        c_ptr++;
    }
    putchar('\n');

    printf("2 - Print str1 using c_ptr: ");
    c_ptr=str1;
    for(int ii=0;ii<strlen(c_ptr);ii++) { 
        printf("[%c]", *(c_ptr+ii));
    }
    printf("\n");

    printf("3 - Print str1 ASCII values using c_ptr: ");
    c_ptr=str1;
    for(int ii=0;ii<strlen(c_ptr);ii++) { 
        printf("[%d]", *(c_ptr+ii));
    }
    printf("\n");

    /* Working with structs */
    printf("\n");
    printf("Working with structs:\n");
    printf("struct_var = %d %s address=%p\n", struct_var.x, struct_var.n, (void*) &struct_var);
    printf("struct_ptr = %p (%d %s) address=%p\n", (void*) struct_ptr, struct_ptr->x, struct_ptr->n, (void*) &struct_ptr);

    /* Changing a struct with a pointer */
    struct_ptr->x = 75;
    strncpy(struct_ptr->n, "PointerFun", LENGTH);
    printf("After changes:\n");
    printf("struct_var = %d %s address=%p\n", struct_var.x, struct_var.n, (void*) &struct_var);
    printf("struct_ptr = %p (%d %s) address=%p\n", (void*) struct_ptr, struct_ptr->x, struct_ptr->n, (void*) &struct_ptr);

    /* Look at memory character by character */
    c_ptr = str1;
    for(int ii=0;ii<strlen(str1);ii++) {
        printf("  %d: *c_ptr+ii=%c (%d %X)\n", ii, *(c_ptr+ii), *(c_ptr+ii), *(c_ptr+ii));
    }

    struct_var.x = 0x4748494A;
    /*  Try uncommenting this and see what happens
    strncpy(struct_ptr->n, "Short", 6);
    */
    printf("\nLooking at a struct with char*\n");
    char *scan = &struct_var;
    for(int ii=0;ii<sizeof(struct_var);ii++) {
        printf("  %d: *scan+ii=%c (%d %X)\n", ii, *(scan+ii), *(scan+ii), *(scan+ii));
    }
    
    return 0;
}
