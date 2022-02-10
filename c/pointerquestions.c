#include<stdio.h>
#include<stdlib.h>

/* Function with a non-pointer parameter 
     - actual paramter not changed */
void var_parm(int x) {
    printf("    VAR_PARM: x=%d, address=%p \n", x, (void*) &x);
    x = 42;
}

/* Function with a pointer parameter 
     - actual paramter is changed 
     - updates the value of the variable being pointed to */
void ptr_parm(int * x) {
    printf("    PTR_PARM: pointer %p points to the value %d\n", (void*) x, *x);
    *x = 42;
}

/* Function with a double pointer parameter 
     - address pointed to by actual parameter (pointer) is changed 
     - updates which variable is being pointed to */
void change_pointer(int ** ptr) {
    printf("    CHANGE_POINTER: pointer %p points to %p (%d)\n", (void*) ptr, (void*) *ptr, **ptr);
    (*ptr)++;
    printf("            MALLOC: pointer %p points to %p (%d)\n", (void*) ptr,(void*) *ptr, **ptr);
}

int main(void) {

    int num = 10;
    int arr[] = {12, 23, 34, 45, 56, 67, 78, 89};
    int * arr_ptr = arr;

    printf("Calling var_parm(num)\n");
    printf("  BEFORE: num=%d, address=%p \n", num, (void*) &num);
    var_parm(num);
    printf("  AFTER: num=%d, address=%p \n", num, (void*) &num);
    printf("\n");
    printf("Calling ptr_parm(&num)\n");
    printf("  BEFORE: num=%d, address=%p \n", num, (void*) &num);
    ptr_parm(&num);
    printf("  AFTER: num=%d, address=%p \n", num, (void*) &num);

    printf("\n");
    printf("Changing a pointer using a function:\n");
    printf("  BEFORE: arr_ptr=%p points to the value %d\n", (void*) arr_ptr, *arr_ptr);
    change_pointer(&arr_ptr);
    printf("  AFTER: arr_ptr=%p points to the value %d\n", (void*) arr_ptr, *arr_ptr);


    return(0);
}