#include <iostream>
#include <cstdlib>

int main() {
    std::string language;
    std::cout << "Enter the language (C or C++) you want to use for solving the equation: ";
    std::cin >> language;

    if (language == "C") {
        system("./CApp/CApp");
    } else if (language == "C++") {
        system("./CppApp/CppApp");
    } else {
        std::cout << "Invalid language choice. Please enter either C or C++." << std::endl;
    }

    return 0;
}
