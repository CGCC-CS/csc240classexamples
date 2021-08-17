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
    char c = 'A';
    char str1[] = "CSC240";

    csc240_t struct1 = {40, "Struct"};
    csc240_t struct2;
    
    printf("Hello, World!\n");

    /* Reading user input */
    printf("Enter a number: ");
    scanf("%d", &count);
    for (int ii=0;ii<count;ii++) {
        printf("%d ", ii+1);
    }
    printf("\n");
    printf("\n");

    /* for-loop */
    for (int ii=0;ii<10;ii++) {
        printf("array[%d] = %d\n", ii, array[ii]);
        num += ii;
    }
    printf("\n");

    /* printing a number as decimal, octal, & hexadecimal */
    printf("num = %d %o %x %X\n", num, num, num, num);
    printf("\n");

    /* printing a character as a character, decimal, & hex */
    printf("c = %c %d %X\n", c, c, c);
    printf("c+10 = %c %d %X\n", c+10, c+10, c+10);
    printf("'I' + '!' = %c %d %X\n", 'I'+'!', 'I'+'!', 'I'+'!'); 
    printf("\n");

    /* printing a string */
    printf("String as a string: %s\n", str1);
    printf("Character from a string: %c\n", str1[0]);
    printf("Character from a string: %c\n", str1[3]);

    for(int ii=0;ii<strlen(str1);ii++) {
        printf("%c ", str1[ii]);
    }
    printf("\n");
    printf("\n");

    /* Working with structs */
    struct2.x = 20;
    strncpy(struct2.n, "Program", LENGTH);

    printf("struct1: x=%d n=%s\n", struct1.x, struct1.n);
    printf("struct2: x=%d n=%s\n", struct2.x, struct2.n);


}

