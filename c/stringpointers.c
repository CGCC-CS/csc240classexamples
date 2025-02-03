#include <stdio.h>

int main(void) {

  char str[] = "This is a char array (string)";
  char * ptr = "This is a char pointer";
 
  /* Character array */
  printf("Character array\n");
  printf("str = %p (address=%p)\n", str, &str);
  printf("str = %s\n", str);
  printf("str = %c\n", str);
  printf("str[1] = %c\n", str[1]);
  printf("*(str+2) = %c\n", *(str+2));

  /* Pointer to a string literal */
  printf("\nPointer to a string literal\n");
  printf("ptr = %p (address=%p)\n", ptr, &ptr);
  printf("ptr = %s\n", ptr);
  printf("ptr = %c\n", ptr);
  printf("ptr[1] = %c\n", ptr[1]);
  printf("*(ptr+2) = %c\n", *(ptr+2));

  return 0;
}