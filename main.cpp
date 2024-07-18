#include <iostream>
#include <string>
#include <algorithm>

int main() {
    std::string choice;
    std::cout << "Enter the language (C or C++) you want to use for solving the equation: ";
    std::getline(std::cin, choice);

    // Convert to lowercase for case-insensitive comparison
    std::transform(choice.begin(), choice.end(), choice.begin(), ::tolower);

    std::cout << "Checking if the executables exist..." << std::endl;
    if (FILE *file = fopen("./build/CApp/CApp", "r")) {
        fclose(file);
        std::cout << "File ./build/CApp/CApp exists." << std::endl;
    } else {
        std::cout << "File ./build/CApp/CApp does not exist." << std::endl;
    }
    if (FILE *file = fopen("./build/CppApp/CppApp", "r")) {
        fclose(file);
        std::cout << "File ./build/CppApp/CppApp exists." << std::endl;
    } else {
        std::cout << "File ./build/CppApp/CppApp does not exist." << std::endl;
    }

    if (choice == "c") {
        std::cout << "Running the C application..." << std::endl;
        int result = system("./build/CApp/CApp");
        std::cout << "Return code: " << result << std::endl;
    } else if (choice == "c++") {
        std::cout << "Running the C++ application..." << std::endl;
        int result = system("./build/CppApp/CppApp");
        std::cout << "Return code: " << result << std::endl;
    } else {
        std::cout << "Invalid choice. Please enter 'C' or 'C++'." << std::endl;
    }

    return 0;
}
