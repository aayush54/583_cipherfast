#include <stdio.h>

int main()
{
    int arr[10000]; // Declare an integer array with 10000 elements
    int i;

    // Initialize each element of the array to 0
    for (i = 0; i < 10000; i++)
    {
        arr[i] = 0;
    }

    // Update each element of the array by 1 using a for loop
    for (i = 0; i < 10000; i++)
    {
        arr[i] = arr[i] + 1;
    }

    // Print the updated array
    for (i = 0; i < 10000; i++)
    {
        printf("%d ", arr[i]);
    }

    return 0;
}