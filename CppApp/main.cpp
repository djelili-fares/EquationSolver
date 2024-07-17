#include <iostream>

void solveEquation(double a, double b, double c)
{
    if (a == 0)
    {
        std::cout << "a cannot be zero." << std::endl;
        return;
    }
    double x = (c - b) / a;
    std::cout << "The solution is x = " << x << std::endl;
}

int main()
{
    double a, b, c;
    std::cout << "\n Welcome to the C++ App for calculating mathematical equations :) \n" << std::endl;
    std::cout << "Enter coefficients a, b, and c for the equation ax + b = c" << std::endl;
    std::cin >> a >> b >> c;
    solveEquation(a, b, c);
    return 0;
}
