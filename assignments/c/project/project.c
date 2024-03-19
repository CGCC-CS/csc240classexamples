#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"term.h"
#include"polynomial.h"
#include"basiclist.h"

#define BUFFERLEN 100

/* Parses a string into a term data structure */
term_t * string_to_term(char * buff) {
    term_t * ret = malloc(sizeof(term_t));
    ret->coefficient=atoi(strtok(buff, " "));
    ret->var=*strtok(NULL, " ");
    ret->exponent=atoi(strtok(NULL, " "));
    return ret;
}

/* Reads a text file and adds terms to a basiclist */
void read_terms_from_file(node_t ** term_list) {

    FILE *fp;
    char buffer[BUFFERLEN];

    if ( (fp = fopen("terms.txt", "r")) == NULL) {
        fprintf(stderr, "\nERROR: Missing terms.txt\n\n");
        exit(-1);
    }

    while (fgets(buffer, BUFFERLEN,fp)) {
        /* The following case ensures we aren't reading an empty line */
        if (buffer[0] < '0' || buffer[0] > '9') {
            continue;
        }

        term_t * this_term;
        this_term =  string_to_term(buffer);
        list_add(term_list, this_term);
    }
    fclose(fp);
}

int main(void) {
    term_t testterm1 = {1, 'x', 0};
    term_t testterm2 = {2, 'x', 1};
    term_t testterm3 = {3, 'x', 2};

    poly_t * poly1;
    poly_t * poly2;
    node_t * curr;

    /* Read terms into term_list */
    node_t * term_list = NULL;
    read_terms_from_file(&term_list);

    /* Test term code */
    printf("NAME: SAMPLE OUTPUT\n");
    printf("Testing term.c/h:\n");
    printf("testterm1: %s\n", term_to_string(&testterm1));
    printf("testterm2: %s\n", term_to_string(&testterm2));
    printf("testterm3: %s\n", term_to_string(&testterm3));

    /* 
        ADD CODE HERE TO ADD THE TERMS IN term_list TO A NEW POLYNOMIAL 
    */

    /* Polynomial test code */
    printf("\nTesting polynomial.c/h : \n");
    printf("Original: : ");
    print_polynomial(poly1);
    poly2 = combine_like_terms(poly1);
    printf("\nCombined: : ");
    print_polynomial(poly2);
    printf("\nNAME: SAMPLE OUTPUT\n");

    return 0;
}
