#include <stdio.h>
#include <stdlib.h>

#define ARRAY_SIZE 1000000

static int static_array[ARRAY_SIZE];
static int static_variable;

int main()
{
    int *dynamic_array = (int *)malloc(ARRAY_SIZE * sizeof(int));

    srand(10);

    // Fill static array and dynamic array with random values
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        static_array[i] = rand();
        dynamic_array[i] = rand();
    }

    // Read from and write to static array
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        static_array[i]++;
        static_variable += static_array[i];
    }

    // Read from and write to dynamic array
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        dynamic_array[i]++;
        static_variable += dynamic_array[i];
    }

    printf("Static variable value: %d\n", static_variable);

    free(dynamic_array);
    return 0;
}
