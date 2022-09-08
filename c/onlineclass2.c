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
    int * i_ptr = &num;   /* Integer pointer */
    char * c_ptr = str1;  /* Character pointer (points to first character of str1) */
    csc240_t * struct_ptr = &struct_var;

    /* Printing out pointers & addresses */
    printf("Initial values:\n");
    printf("Variables:\n");
    printf("  num=%d (address=%p)\n", num, (void*) &num);
    printf("  str1=%s (address=%p)\n", str1, (void*) &str1);
    printf("  struct_var={%d,%s} (address=%p)\n", struct_var.x, struct_var.n, (void*) &struct_var);
    /* pointers */
    printf("Pointers:\n");
    printf("  str1+2=%s (address=%p)\n", str1+2, (void*)(str1+2));
    printf("  i_ptr=%p (address=%p) *i_ptr=%d\n", (void*) i_ptr, (void*) &i_ptr, *i_ptr);
    printf("  c_ptr=%p (address=%p) *c_ptr=%d (string=%s)\n", (void*) c_ptr, (void*) &c_ptr, *c_ptr, c_ptr);
    printf("  struct_ptr=%p (address=%p) struct_ptr->x=%d\n", (void*) struct_ptr, (void*) &struct_ptr, struct_ptr->x);
    printf("\n");

    /* Change values with a pointer */
    *i_ptr = 24;  /* dereferencing i_ptr gives an alias to num */
    *c_ptr = '@'; /* dereferencing c_ptr gives an alias to str1 (or str1[0]) */
    *(c_ptr+4) = 'A'; /* dereferencing c_ptr+4 gives an alias to str1[4] */
    struct_ptr->x = 75;  /* use -> to access fields using a struct pointer */
    printf("After changing:\n");
    printf("Variables:\n");
    printf("  num=%d (address=%p)\n", num, (void*) &num);
    printf("  str1=%s (address=%p)\n", str1, (void*) &str1);
    printf("  struct_var={%d,%s} (address=%p)\n", struct_var.x, struct_var.n, (void*) &struct_var);
    printf("Pointers:\n");
    printf("  i_ptr=%p (address=%p) *i_ptr=%d\n", (void*) i_ptr, (void*) &i_ptr, *i_ptr);
    printf("  c_ptr=%p (address=%p) *c_ptr=%d (string=%s)\n", (void*) c_ptr, (void*) &c_ptr, *c_ptr, c_ptr);
    printf("  struct_ptr=%p (address=%p) struct_ptr->x=%d\n", (void*) struct_ptr, (void*) &struct_ptr, struct_ptr->x);
    printf("\n");

    /* Using a char pointer to go through a string */
    printf("Print the characters of str1 (%s) using c_ptr:\n", str1);
    printf("1 - in a while loop: ");
    c_ptr = str1;
    /* This while loop iterates until it finds a null -
        so whatever cptr is pointing to better be a valid string */
    while(*c_ptr != '\0') { 
        putchar(*c_ptr);
        c_ptr++;
    } 
    printf("\n");

    printf("2 - in a for loop: ");
    c_ptr = str1;
    for(int ii=0;ii<strlen(str1);ii++) {
        putchar(*(c_ptr+ii));
    }
    printf("\n");
}
