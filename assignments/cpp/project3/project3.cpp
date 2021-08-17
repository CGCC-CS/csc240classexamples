#include<iostream>
#include<string>
#include<vector>
#include<stdlib.h>
#include<string.h>
#include"term.hpp"
#include"polynomial.hpp"

using namespace std;

#define BUFFERLEN 100

Term term_from_string(char * buff) {
    int coef = 0;
    string var = "";
    int exp = 0;
    char * tok = strtok(buff, " ");
    if(tok != NULL) {
        coef=atoi(tok);
	var = std::string(strtok(NULL, " "));
        exp=atoi(strtok(NULL, " "));
    }
    return Term(coef, std::string(var), exp);
}

void read_objects(std::vector<Term> & term_list) {

    FILE *fp;
    char buffer[BUFFERLEN];
    fp = fopen("terms.txt", "r");

    while (fgets(buffer, BUFFERLEN,fp)) {
      Term this_term;
      this_term =  term_from_string(buffer);
      term_list.push_back(this_term);
    }
    fclose(fp);
}

int main() {
    Term testterm1(1, "x", 0);
    Term testterm2(2, "x", 1);
    Term testterm3(3, "x", 2);

    Polynomial poly1;
    Polynomial poly2;

    std::vector<Term> term_list;

    cout << "NAME: SAMPLE OUTPUT" << endl << endl;
    cout << "Testing term.cpp/hpp:" << endl;
    cout << "testterm1: " << testterm1.toString() << endl;
    cout << "testterm2: " << testterm2.toString() << endl;
    cout << "testterm3: " << testterm3.toString() << endl;

    read_objects(term_list);

    // Add polynomials from term_list to polynomial
    for(unsigned int ii=0;ii<term_list.size();ii++) {
      poly1.add(term_list[ii]);
    }

    printf("\nTesting polynomial.cpp/hpp : \n");
    printf("Original: : ");
    poly1.print();
    cout << endl;
    poly2 = poly1.combineLikeTerms();
    printf("\nCombined: : ");
    poly2.print();
    cout << endl << endl;

    cout << "NAME: SAMPLE OUTPUT" << endl;;
    return 0;
}
