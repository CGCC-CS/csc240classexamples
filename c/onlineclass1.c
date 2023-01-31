#include<stdio.h>
#include<string.h>

#define LENGTH 15

typedef struct {
    int x;
    char n[LENGTH];
} csc240_t;

int main(void) {

    /* Declare some variables */
    int num = 0;
    int count;
    int array[10] = {1,2,3,4,5,6,7,8,9,10};

    char c ='A';
    char d = 67;   /* char is an integral type */
    char e = '4';

    char str1[] = "CSC240";    /* Initialize with a string literal */
    char str2[] = "I";

    csc240_t struct1 = {40, "Struct1"};
    csc240_t struct2;

    printf("Hello, world!\n");

    /* Read user input */
    printf("Enter a number: ");
    scanf("%d", &count);      /* Don't forget the 2nd parameter needs & */

    printf("LENGTH = %d\n", LENGTH);
    printf("num=%d, count=%d\n", num, count);
    printf("(as chars) c=%c, d=%c, e=%c\n", c, d, e);
    printf(" (as ints) c=%d, d=%d, e=%d\n", c, d, e);

    /* Loops */
    for (int ii=1;ii<=count;ii++) {
        printf("%d ", ii);
    }
    printf("\n");

    int jj = 0;
    printf("Array: ");
    while (jj < 10) {
        printf("%d ", array[jj]);
        jj++;
    }
    printf("\n");

    /* Print int in  different bases*/
    printf("\n");
    num=123;
    printf("num: decimal=%d, octal=%o, hex=%X\n", num, num, num);
    printf("count: decimal=%d, octal=%o, hex=%X\n", count, count, count);
    printf("\n");

    /* Print char in different bases */
    printf("c: char=%c, decimal=%d, octal=%o, hex=%X\n", c, c, c, c);
    printf("c+1: char=%c, decimal=%d, octal=%o, hex=%X\n", c+1, c+1, c+1, c+1);
    printf("'I': char=%c, decimal=%d, octal=%o, hex=%X\n", 'I', 'I', 'I', 'I');
    printf("'I'+1: char=%c, decimal=%d, octal=%o, hex=%X\n", 'I'+1, 'I'+1, 'I'+1, 'I'+1);
    printf("'!': char=%c, decimal=%d, octal=%o, hex=%X\n", '!', '!', '!', '!');
    printf("'I'+'!': char=%c, decimal=%d, octal=%o, hex=%X\n", 'I'+'!', 'I'+'!', 'I'+'!', 'I'+'!');
    printf("\n");

    /* Printing a string */
    printf("str1 as a string: %s\n", str1);
    printf("str1[0]: char=%c, decimal=%d, octal=%o, hex=%X\n", str1[0], str1[0], str1[0], str1[0]);
    printf("str1[4]: char=%c, decimal=%d, octal=%o, hex=%X\n", str1[4], str1[4], str1[4], str1[4]);
    printf("str1+2 as a string: %s\n", str1+2);

    printf("\n");
    printf("str2 as a string: %s\n", str2);
    printf("str2[0]: char=%c, decimal=%d, octal=%o, hex=%X\n", str2[0], str2[0], str2[0], str2[0]);
    printf("str2[1]: char=%c, decimal=%d, octal=%o, hex=%X\n", str2[1], str2[1], str2[1], str2[1]);
    printf("\n");

    /* Print a string character-by-character */
    printf("Characters of str1: ");
    for(int ii=0; ii<=strlen(str1);ii++) {
        putchar('[');  /* putchar prints one character to stdout */
        putchar(str1[ii]);
        putchar(']');
    }
    putchar('\n');

    /* Print the characters of the alphabet */
    for(int ii=0;ii<26;ii++) {
        putchar('A' + ii);
    }
    printf("\n");
    for(int ii=0;ii<26;ii++) {
        putchar('a' + ii);
    }
    printf("\n");
    printf("\n");

    /* Working with structs */
    struct2.x = 20;
    strncpy(struct2.n, "STRUCT2", LENGTH);
    printf("struct1: x=%d n=%s\n", struct1.x, struct1.n);
    printf("struct2: x=%d n=%s\n", struct2.x, struct2.n);
    printf("\n");

    /* Blame Spring 2022 for the following */
    printf("sizeof(char) = %lu\n", sizeof(char));
    printf("sizeof('A') = %lu\n", sizeof('A'));
    printf("sizeof(\"A\") = %lu\n", sizeof("A"));
    printf("sizeof(int) = %lu\n", sizeof(int));
    printf("sizeof(c) = %lu\n", sizeof(c));  /* c is a char */
    printf("sizeof(num) = %lu\n", sizeof(num));  /* num is an int */
    printf("\n");

    /* Rediculously quick intro to pointers */
    int var = 10;  /* variable */
    int * ptr;     /* pointer to int - also variable */

    ptr = &var;   /* &var evaluates to the address of var */
    printf("var=%d, &var=%p\n", var, (void*) &var);
    printf("ptr=%p, &var=%p, *ptr=%d\n", (void*) ptr, (void*) &ptr, *ptr);
    printf("\n");

    *ptr = 15;   /* *ptr gives an alias of ptr is pointing to */
    printf("after *ptr = 15:\n");
    printf("var=%d, &var=%p\n", var, (void*) &var);
    printf("ptr=%p, &var=%p, *ptr=%d\n", (void*) ptr, (void*) &ptr, *ptr);
    printf("\n");

    return(0);
}