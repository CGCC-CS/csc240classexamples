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
    char str2[] = "ABC123";

    /* Pointer Variables */
    int * i_ptr = &num;     /* Integer pointer */
    char * c_ptr = str1;    /* Character pointer - points to the first char of str1 */
    csc240_t * struct_ptr = &struct_var;    /* Pointer to a struct */

    /* Printing out pointers & address */
    printf("Initial values:\n");
    printf("Variables:\n");
    printf("  num=%d (address=%p)\n", num, (void*) &num);
    printf("  str1=%s (address=%p)\n", str1, (void*) &str1);
    printf("  str2=%s (address=%p)\n", str2, (void*) &str2);
    printf("  struct_var={%d,%s} (address=%p)\n", struct_var.x, struct_var.n, (void*) &struct_var);
    printf("Pointers:\n");
    printf("  i_ptr=%p (address=%p) *i_ptr=%d\n", (void*) i_ptr, (void*) &i_ptr, *i_ptr);
    printf("  c_ptr=%p (address=%p) *c_ptr=%c [%X]  ", (void*) c_ptr, (void*) &c_ptr, *c_ptr, *c_ptr);
    printf("c_ptr as a string: %s\n", c_ptr);
    printf("  str1=%p (address=%p) *str1=%c [%X]  ", (void*) str1, (void*) &str1, *str1, *str1);
    printf("str1 as a string: %s\n", str1);
    printf("  str2=%p (address=%p) *str2=%c [%X]  ", (void*) str2, (void*) &str2, *str2, *str2);
    printf("str2 as a string: %s\n", str2);
    printf("  str1+3=%p (address=%p) *str1+3=%c [%X]  ", (void*) (str1+3), (void*) (&str1+3), *(str1+3), *(str1+3));
    printf("str1+3 as a string: %s\n", str1+3);
    printf("\n");

    /* Change values of variables with a pointer */
    *i_ptr = 24;         /* dereferencing i_ptr gives an alias to num */
    *c_ptr = '@';        /* dereferencing c_ptr gives an alias to str1[0] */
    *(c_ptr+4) = 'A';    /* dereferencing c_ptr+4 gives an alias to str1[4] */
    struct_ptr->x = 75;  /* user -> to access fields using a struct pointer */
    printf("After Changes:\n");
    printf("Variables:\n");
    printf("  num=%d (address=%p)\n", num, (void*) &num);
    printf("  str1=%s (address=%p)\n", str1, (void*) &str1);
    printf("  struct_var={%d,%s} (address=%p)\n", struct_var.x, struct_var.n, (void*) &struct_var);
    printf("Pointers:\n");
    printf("  i_ptr=%p (address=%p) *i_ptr=%d\n", (void*) i_ptr, (void*) &i_ptr, *i_ptr);
    printf("  c_ptr=%p (address=%p) *c_ptr=%c [%X]  ", (void*) c_ptr, (void*) &c_ptr, *c_ptr, *c_ptr);
    printf("c_ptr as a string: %s\n", c_ptr);
    printf("  str1=%p (address=%p) *str1=%c [%X]  ", (void*) str1, (void*) &str1, *str1, *str1);
    printf("str1 as a string: %s\n", str1);
    printf("  str1+3=%p (address=%p) *str1+3=%c [%X]  ", (void*) (str1+3), (void*) (&str1+3), *(str1+3), *(str1+3));
    printf("str1+3 as a string: %s\n", str1+3);
    printf("\n");

    /* Using a char pointer to go through a string */
    printf("Print the characters of str2 (%s) using c_ptr:\n", str2);
    printf("   1 - in a while loop: ");
    c_ptr = str2;
    /* This while loop iterates until it finds a null - 
            so, whatever c_ptr is pointing to better be a valid string */
    while (*c_ptr != '\0') {
        putchar(*c_ptr);
        c_ptr++;
    }
    printf("\n");

    printf("   2 - in a for loop: ");
    c_ptr = str2;
    for(int ii=0;ii<strlen(str1)+1;ii++) {
        printf("%c [%d] ",(*(c_ptr+ii)), (*(c_ptr+ii)));
    }
    printf("\n");
    printf("\n");

    /* Changing a struct with a pointer */
    struct_ptr->x = 23;
    strncpy(struct_ptr->n, "PointerFun", LENGTH);
    printf("After struct changes:");
    printf("  struct_var={%d,%s} (address=%p)\n", struct_var.x, struct_var.n, (void*) &struct_var);
    printf("  struct_ptr=%p, {%d,%s} (address=%p)\n", (void*) struct_ptr, struct_ptr->x, struct_ptr->n, (void*) &struct_ptr);
    printf("\n");

    /* Look at memory character by characters */
    c_ptr = str1;
    printf("Memory starting at &str1:\n");
    for (int ii=0;ii<25;ii++) {
        printf ("   %d: *(c_ptr+ii)=%c [%d|%X]\n", ii, *(c_ptr+ii), *(c_ptr+ii), *(c_ptr+ii));
    }
    printf("\n");
    printf("\n");

    /* Looking at a struct with a pointer */
    printf("Look at a struct byte-by-byte:\n");
    struct_var.x = 0x4748494A;
    printf("  struct_var={%d,%s} (address=%p)\n", struct_var.x, struct_var.n, (void*) &struct_var);
    char * scan = (char *) &struct_var;
    for (int ii=0;ii<sizeof(struct_var);ii++) {
        printf("    %d: *scan+ii=%c [%d | %X]\n", ii, *(scan+ii), *(scan+ii), *(scan+ii));
    }
    return 0;
}
