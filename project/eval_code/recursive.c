#include <stdio.h>

// Function to calculate the factorial of a given number recursively
int factorial(int n)
{
    if (n == 0)
    {
        return 1;
    }
    else
    {
        return n * factorial(n - 1);
    }
}

int main()
{
    int num, fact;

    // Prompt the user to enter a number
    printf("Enter a positive integer: ");
    num = 15;

    // Call the factorial function to calculate the factorial of the entered number
    fact = factorial(num);

    // Display the result
    printf("Factorial of %d = %d\n", num, fact);

    return 0;
}