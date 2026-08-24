#include<stdio.h>
#include<string.h>

/* This file will not compile until it is complete - you can comment out
 * any failing code that you haven't completed yet.
 */

int array_max(int a[], int len);
int letter_count(char a[], int len);
void printThem(int count);

/* Define practice1_t structure below */

int main(void) {
  int nums[11] = {1, 3, 5, 7, 9, 11, 10, 8, 6, 4, 2};
  char str[] = "CSC240 Fall 2019";

  printf("triple_it: ");
  for(int ii=0;ii<10;ii++) { 
    printf("%d ", triple_it(ii));
  }
  printf("\n");

  printf("\narray_max: %d\n", array_max(nums, 11));

  printf("\nletter_count: %d\n", letter_count(str, strlen(str)));

  printf("\nprintThem:\n");
  printThem(50);

  return 0;
}

int triple_it (int x) {
  return (x * 3);
}
