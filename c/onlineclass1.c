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
    int array[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9,10};

    char c = 'A';
    char d = 67;    /* Char is an integer type */
    char e = '4';
    char str1[] = "CSC240";  /* Initialize with string literal */

    csc240_t struct1 = {40, "Struct1"};
    csc240_t struct2;

    printf("Hello, world!\n");

    /* Read user input */
    printf("Enter a number: ");
    scanf("%d", &count);   /* Don't forget the 2nd parameter neesds & */

    printf("LENGTH = %d\n", LENGTH);
    printf("num=%d, count=%d\n", num, count);
    printf("(as chars)c=%c, d=%c, e=%c\n", c, d, e);
    printf("(as ints) c=%d, d=%d, e=%d\n", c, d, e);

    /* Loops */
    for (int ii=0;ii<count;ii++) {
        printf("%d ", ii+1);
    }
    printf("\n");
    printf("array: ");
    for (int ii=0;ii<count;ii++) {
        printf("%d ", array[ii]);
    }
    printf("\n");


    /* Print int in different bases */
    num=123;
    printf("\n");
    printf("num: decimal=%d, octal=%o, hex=%X\n", num, num, num);
    printf("count: decimal=%d, octal=%o, hex=%X\n", count, count, count);

    /* Print char in different bases */
    printf("c: char=%c, decimal=%d, octal=%o, hex=%X\n", c, c, c, c);
    printf("c+1: char=%c, decimal=%d, octal=%o, hex=%X\n", c+1, c+1, c+1, c+1);
    printf("'I': char=%c, decimal=%d, octal=%o, hex=%X\n", 'I', 'I', 'I', 'I');
    printf("'I'+1: char=%c, decimal=%d, octal=%o, hex=%X\n", 'I'+1, 'I'+1, 'I'+1, 'I'+1);
    printf("'!': char=%c, decimal=%d, octal=%o, hex=%X\n", '!', '!', '!', '!');
    printf("'I'+'!': char=%c, decimal=%d, octal=%o, hex=%X\n", 'I'+'!', 'I'+'!', 'I'+'!', 'I'+'!');

    /* Printing a string */
    printf("\n");
    printf("str1 as a string: %s\n", str1);
    printf("str1+2 as a string: %s\n", str1+2);
    printf("str1[0] = %c %d %o %x\n", str1[0], str1[0], str1[0], str1[0]);
    printf("str1[4] = %c %d %o %x\n", str1[4], str1[4], str1[4], str1[4]);

    /* Printing a string char by char */
    printf("Characters of str1: ");
    for (int ii=0;ii<strlen(str1);ii++) {
        putchar('[');
        putchar(str1[ii]);
        putchar(']');
    }
    printf("\n");

    /* Print the characters of the alphabet */
    for(int ii=0;ii<26;ii++) {
        printf("%c", 'A'+ii);
    }
    printf("\n");

    /* Working with structs */
    printf("\n");
    struct2.x = 20;
    strncpy(struct2.n, "STRUCT2", LENGTH);
    printf("struct1: x=%d, n=%s\n", struct1.x, struct1.n);
    printf("struct2: x=%d, n=%s\n", struct2.x, struct2.n);

    /* Blame Spring 2022 for the following */
    printf("sizeof(char) = %lu\n", sizeof(char));
    printf("sizeof('A') = %lu\n", sizeof('A'));
    printf("sizeof(\"A\") = %lu\n", sizeof("A"));
    printf("sizeof(int) = %lu\n", sizeof(int));
    printf("sizeof(c) = %lu\n", sizeof(c));  /* c is a char */
    printf("sizeof(num) = %lu\n", sizeof(num));  /* num is an int */

    /* Pointers, rediculously quick */
    int var = 10;    /* Variable */
    int* ptr;       /* Pointer */

    ptr = &var;  /* &var evaluates to the address of var */
    printf("var=%d, &var=%p\n", var, (void *) &var);
    printf("ptr=%p, &ptr=%p, *ptr=%d\n", (void *) ptr, (void *) &ptr, *ptr);

    *ptr = 15;   /* *ptr gives an alias of what ptr pointing to */
    printf("after *ptr=15:\n");
    printf("var=%d, &var=%p\n", var, (void *) &var);
    printf("ptr=%p, &ptr=%p, *ptr=%d\n", (void *) ptr, (void *) &ptr, *ptr);

    return 0;
}