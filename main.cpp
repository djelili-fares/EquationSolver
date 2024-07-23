#include <iostream>
#include <string>
#include <algorithm>
#include <unistd.h> // for getcwd
#include <limits.h> // for PATH_MAX

std::string getExecutablePath(const std::string &relativePath)
{
    char cwd[PATH_MAX];
    if (getcwd(cwd, sizeof(cwd)) != NULL)
    {
        std::string currentPath(cwd);
        if (currentPath.find("build") != std::string::npos)
        {
            return currentPath + "/" + relativePath;
        }
        else
        {
            return currentPath + "/build/" + relativePath;
        }
    }
    else
    {
        std::cerr << "getcwd() error" << std::endl;
        return "";
    }
}

int main()
{
    std::string choice;
    std::cout << "Enter the language (C or C++) you want to use for solving the equation: ";
    std::getline(std::cin, choice);

    // Convert to lowercase for case-insensitive comparison
    std::transform(choice.begin(), choice.end(), choice.begin(), ::tolower);

    std::string cAppPath = getExecutablePath("CApp/CApp");
    std::string cppAppPath = getExecutablePath("CppApp/CppApp");

    std::cout << "Checking if the executables exist..." << std::endl;
    if (FILE *file = fopen(cAppPath.c_str(), "r"))
    {
        fclose(file);
        std::cout << "File " << cAppPath << " exists." << std::endl;
    }
    else
    {
        std::cout << "File " << cAppPath << " does not exist." << std::endl;
    }
    if (FILE *file = fopen(cppAppPath.c_str(), "r"))
    {
        fclose(file);
        std::cout << "File " << cppAppPath << " exists." << std::endl;
    }
    else
    {
        std::cout << "File " << cppAppPath << " does not exist." << std::endl;
    }

    if (choice == "c")
    {
        std::cout << "Running the C application..." << std::endl;
        int result = system(cAppPath.c_str());
        std::cout << "Return code: " << result << std::endl;
    }
    else if (choice == "c++")
    {
        std::cout << "Running the C++ application..." << std::endl;
        int result = system(cppAppPath.c_str());
        std::cout << "Return code: " << result << std::endl;
    }
    else
    {
        std::cout << "Invalid choice. Please enter 'C' or 'C++'." << std::endl;
    }

    return 0;
}
