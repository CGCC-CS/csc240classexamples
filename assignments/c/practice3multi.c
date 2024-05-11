/* Practice 3, part 1 - Multi-file C Programs */
#include<stdio.h>

#define PI 3.14159

int square(int x) {
    return x * x;
}

int main(void) {
  int radius;
  double area;
  printf("Enter the radius: ");
  scanf("%d", &radius);  
  area = PI * square(radius);
  printf ("The area of a circle with radius %d is %.2f\n", radius, area);
  return 0;
}

