#include<stdio.h>
#include<stdlib.h>

typedef struct {
    int age;
    char * name;
} person_t;

// Recursion example
void printUpTo(int n) {
    if (n > 1) {
        printUpTo(n-1);
    }
    printf("%d ", n);
}

int main(void) {

    person_t sun = {26, "Devin Booker"};
    person_t user;
    int size;

    printUpTo(10);
    printf("\n\n");

    printf("sun: %s (Age %d)\n", sun.name, sun.age);
    printf("Memory: sun=%p, sun.name=%p\n", (void*) &sun, (void*) sun.name);
    printf("        string literal=%p\n", "STRINGLITERAL");

    printf("\n");
    printf("How many characters is your name? ");
    scanf("%d", &size);
    getchar();   // Read the newline
    user.name = (char*) malloc((size+1) * sizeof(char));
    printf("What is your name? ");
    fgets(user.name, size+1, stdin);
    printf("What is your age? ");
    scanf("%d", &user.age);
    printf("user: %s (Age %d)\n", user.name, user.age);

    free(user.name);

    return 0;
}
