#include <stdio.h>

void solveEquation(double a, double b, double c)
{
    if (a == 0)
    {
        printf("a cannot be zero.\n");
        return;
    }
    double x = (c - b) / a;
    printf("The solution is x = %f\n", x);
}

int main()
{
    double a, b, c;
    printf("\n Welcome to the C App for calculating mathematical equations :) \n");
    printf("Enter coefficients a, b, and c for the equation ax + b = c\n");
    scanf("%lf %lf %lf", &a, &b, &c);
    solveEquation(a, b, c);
    return 0;
}
