#include <stdio.h>
#include <string.h>
 
int main(void) {
   int ii, *ptr, arr[3] = {2, 4, 6};
   char *s, str1[] = "java";
 
   /* Question a */
   printf("a) str1: size=%lu string=%s\n\n", sizeof(str1), str1);
 
   /* Question b - print str1 character by character (with ASCII value) */
   for (ii = 0; ii < 6; ii++) {
      printf("b) str1[%d]='%c' (%d)\n", ii, str1[ii], str1[ii]);
   }
   printf("\n");
 
   /* Questions c & d*/
   s = str1;
   while (*s != '\0') {
      printf("c&d) s=%p  *s=%c\n", s, *s);
      s++;
   }
   printf ("\n");
 
   /* Question e */
   ptr = arr;
   for (ii=0;ii<3;ii++) {
      printf("e) ptr=%p  *ptr=%d\n", (void *) ptr, *ptr);
      ptr++;
   }
   return 0;
}
