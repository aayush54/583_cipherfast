#include <stdio.h>
#include <stdlib.h>

int ARRAY_SIZE = 5;

// void print_loop()
// {
//     printf("")
// }

int main()
{
    int x = 0;
    int y = 20;

    for (int i = 0; i < 1000; i++)
    {
        x += i;
        x *= 20;
    }

    printf("%i\n", x);

    return 0;
}