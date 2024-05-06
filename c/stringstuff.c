#include<stdio.h>
#include<string.h>

int main(void) {


    char example[] = "CSC240";
    char string[] = {'M', 'o', 'n', 'd', 'a', 'y', '!', '!', '!'};

    printf("example (%ld): %s\n", strlen(example), example);
    printf("string (%ld): %s\n", strlen(string), string);


    for (int ii=0;ii<20;ii++) {
        printf("example[%d]: %c (%d)\n", ii, example[ii], example[ii]);
    }

    example[6] = 'X';
    printf("example (%ld): %s\n", strlen(example), example);
    printf("string (%ld): %s\n", strlen(string), string);

    strncpy(example, "Chandler-Gilbert Community College", 6);
    printf("example (%ld): %s\n", strlen(example), example);
    printf("string (%ld): %s\n", strlen(string), string);


    return 0;
}