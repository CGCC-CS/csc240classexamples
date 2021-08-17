#include<stdio.h>

#define LEN 100

int main() {
  char name[LEN];
  int ii;
  int k = 0;
  printf("Enter a number between 1 & 10: ");
  scanf("%d", &k);  
  printf("Enter your name: ");
  scanf("%s", name);  
  if ((k < 1) || (k > 10)) {
      k = 1;
  }
  for (ii=0;ii<k;ii++){
      printf ("Hi, %s\n", name);
  }
  return 0;
}

