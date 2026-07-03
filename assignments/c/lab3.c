#include <stdio.h>
#include <stdlib.h>

/* Forward declarations */
int seq(int n);
void double_it(int * n);
int triple_it(int n);

int main(void)
{
   int n = 1;
   printf("ii    seq(ii)   double_it(n)  triple_it(ii)\n");
   for (int ii=0;ii<=10;ii++) {
       printf("%2d   ",ii);
       printf("%8d",seq(ii));
       double_it(&n);
       printf("%15d",n);
       printf("%15d",triple_it(ii));
       printf("\n");
   }
   return 0;
}

/* Include implementations of your functions below */
