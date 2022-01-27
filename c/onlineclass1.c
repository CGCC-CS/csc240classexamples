#include<stdio.h>

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
    char c = 'A';
    char d = 68;
    char e = '4';
    char str1[] = "CSC240";

    csc240_t struct1 = {40, "Struct1"};
    csc240_t struct2;

    printf ("Hello, world!\n");

    printf("LENGTH = %d\n", LENGTH);
    printf("num = %d\n", num);
    printf("c=%c (%d / %X)\n", c, c, c);
    printf("d=%c (%d / %X)\n", d, d, d);
    printf("e=%c (%d / %X)\n", e, e, e);

    /* Read user input */
    printf("Enter a number: ");
    scanf("%d", &count);   /* Don't forget that the 2nd parameter is an address! */

    /* loops */
    for (int ii=0;ii<count;ii++) {
        printf ("%d ", ii+1);
    }
    printf("\n");

    int jj=0;
    while (jj<10) {
        printf("array[%d]=%d\n", jj, array[jj]);
        num += jj;
        jj++;
    }
    printf("\n");

    /* Printing a number as a decimal, octal, & hexidecimal */
    printf("num: dec: %d, oct: %o, hex: %X\n", num, num, num);
    printf("\n");

    /* Printing a character as a character, decimal, octal, & hexidecimal */
    printf("c: char: %c, dec: %d, oct: %o, hex: %X\n", c, c, c, c);
    printf("c+1: char: %c, dec: %d, oct: %o, hex: %X\n", c+1, c+1, c+1, c+1);
    printf("'I': char: %c, dec: %d, oct: %o, hex: %X\n", 'I', 'I', 'I', 'I');
    printf("'!': char: %c, dec: %d, oct: %o, hex: %X\n", '!', '!', '!', '!');
    printf("'I'+'!': char: %c, dec: %d, oct: %o, hex: %X\n", 'I'+'!', 'I'+'!', 'I'+'!', 'I'+'!');
    printf("\n");

    /* Printing a string */
    printf("str as a string: %s\n", str1);
    printf("str+2 as a string: %s\n", str1+2);
    printf("str[0] as a character: %c\n", str1[0]);
    printf("str[3] as a character: %c\n", str1[3]);
    printf("Characters of %s: ", str1);

    /* Printing a string character-by-character */
    for(int ii=0;ii<strlen(str1);ii++) {
        printf("%c ", str1[ii]);
    }
    printf("\n");

    printf("Ascii values of %s: ", str1);
    for(int ii=0;ii<strlen(str1);ii++) {
        printf("%d ", str1[ii]);
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

    for(int ii=0; ii<26;ii++) {
        printf("%c", 'A' + ii);
    }
    printf("\n");

    int what = 'A' + 10;
    printf("what = %d (%X hex) (or as char %c)\n", what, what, what);

    return(0);
}