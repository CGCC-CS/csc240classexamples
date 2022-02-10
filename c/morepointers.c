#include<stdio.h>

int main(void) {
    int num = 7;
    char * str = "This is a string";
    char outstr[100];

    /* C doesn't care much about whitespace */
    printf
       ("Some stuff: %d %c %s" " the end"
         "\n",
            4,
            'H',
            "Wow!")
            ;
    printf("str=[%p] %s &str=%p\n", str, str, &str); 
    printf("String literal %s is stored at %p\n", "Str", "Str");
    /* Compare the address below with the address stored in str */
    printf("String literal %s is stored at %p\n", "This is a string", "This is a string");

    /* sprintf */
    sprintf(outstr, "This is a test %d %s\n", num, str);
    printf("outstr=%s\n", outstr);
    
    return(0);
}
