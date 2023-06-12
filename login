#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>

void registerUser() {
    std::string username, password;

    std::cout << "Welcome to the Login Page!" << std::endl;
    std::cout << "Please register a new account." << std::endl;

    std::cout << "Username: ";
    std::cin >> username;

    std::cout << "Password: ";
    std::cin >> password;

    std::ofstream file("users.txt", std::ios::app); // Open file in append mode

    if (file.is_open()) {
        file << username << " " << password << std::endl;
        file.close();
        std::cout << "Registration successful!" << std::endl;
    } else {
        std::cout << "Error: Unable to open file." << std::endl;
    }

    std::cout << "-------------------------" << std::endl;
}

bool loginUser() {
    std::string enteredUsername, enteredPassword;

    std::cout << "Login" << std::endl;
    std::cout << "Username: ";
    std::cin >> enteredUsername;

    std::cout << "Password: ";
    std::cin >> enteredPassword;

    std::ifstream file("users.txt");
    std::string username, password;

    while (file >> username >> password) {
        if (username == enteredUsername && password == enteredPassword) {
            file.close();
            return true;
        }
    }

    file.close();
    return false;
}

int main() {
    registerUser();

    system("cls");

    if (loginUser()) {
        std::cout << "Login successful!" << std::endl;
    } else {
        std::cout << "Login failed. Invalid username or password." << std::endl;
    }

    return 0;
}
