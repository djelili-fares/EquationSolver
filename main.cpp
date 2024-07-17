#include <iostream>
#include <cstdlib>
#include <string>
#include <cstring>

int main() {
    std::string language;
    std::cout << "Enter the language (C or C++) you want to use for solving the equation: ";
    std::cin >> language;

    std::string command;
#ifdef _WIN32
    if (language == "C") {
        command = "./build/CApp/CApp.exe";
    } else if (language == "C++") {
        command = "./build/CppApp/CppApp.exe";
    }
#else
    if (language == "C") {
        command = "./build/CApp/CApp";
    } else if (language == "C++") {
        command = "./build/CppApp/CppApp";
    }
#endif

    if (!command.empty()) {
        int result = std::system(command.c_str());
        if (result != 0) {
            std::cerr << "Error executing command: " << command << std::endl;
        }
    } else {
        std::cerr << "Invalid language selection." << std::endl;
    }

    return 0;
}
