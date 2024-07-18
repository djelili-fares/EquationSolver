#include <stdio.h>

int main() {
    printf("Welcome to the C App for calculating mathematical equations :)\n");
    printf("Enter coefficients a, b, and c for the equation ax + b = c\n");

    double a, b, c;
    scanf("%lf %lf %lf", &a, &b, &c);

    double x = (c - b) / a;
    printf("The solution is x = %lf\n", x);

    return 0;
}
