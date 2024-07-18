#include <iostream>

int main() {
    std::cout << "Welcome to the C++ App for calculating mathematical equations :)" << std::endl;
    std::cout << "Enter coefficients a, b, and c for the equation ax + b = c" << std::endl;

    double a, b, c;
    std::cin >> a >> b >> c;

    double x = (c - b) / a;
    std::cout << "The solution is x = " << x << std::endl;

    return 0;
}
