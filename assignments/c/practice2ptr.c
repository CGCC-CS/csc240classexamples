#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* Rewrite using a pointer to char str[] */
void array_to_ptr () {
  int n=0, len; 
  char str[ ] = "Hello World!";
  len = strlen(str);
  for( n=0; n<len; n++) {
    putc(str[n], stdout);
  }
  printf("\nlength = %d\n", n);
}

int contains (char * str, char c) {
  /* To be completed as part of assignment */
}

int * makearray(int n) {
  /* To be completed as part of assignment */
}

int main (void) {
  printf("Question #2 - array_to_ptr:\n");
  array_to_ptr();   
  printf("\n------------------------------------\n\n");

  printf("Question #3 - contains:\n");
  printf("Test #1: ");
  if ( contains("Hello", 'e') == 1) {
    printf("The string \"Hello\" contains the character 'e'\n");
  }
  else {
    printf("The string \"Hello\" does not contain the character 'e'\n");
  }
  printf("Test #2: ");
  if ( contains("Hello", 'x') == 1) {
    printf("The string \"Hello\" contains the character 'x'\n");
  }
  else {
    printf("The string \"Hello\" does not contain the character 'x'\n");
  }
  printf("\n------------------------------------\n\n");

  printf("Question #4: - makearray:\n");
  int * arr = makearray(10);
  for (int ii=0;ii<10;ii++) {
    printf("%d ", *(arr+ii));
  }
  printf("\n");
  printf("\n------------------------------------\n\n");
  return 0;
}
