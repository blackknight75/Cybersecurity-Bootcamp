#!/bin/bash

# Function to install OpenSSL
install_openssl() {
    read -p "OpenSSL is not installed. Would you like to install it? (y/n): " answer
    if [[ $answer == "y" || $answer == "Y" ]]; then
        echo "Installing OpenSSL now..."
        sudo apt update && sudo apt install openssl -y
        if [[ $? -eq 0 ]]; then
            echo "OpenSSL installed successfully."
        else
            echo "Failed to install OpenSSL."
            exit 1
        fi
    else
        echo "OpenSSL is required to run this script. Exiting..."
        exit 1
    fi
}

# Check if OpenSSL is installed
which openssl >/dev/null
if [[ $? -eq 0 ]]; then
    echo "OpenSSL is installed."
else
    install_openssl
fi
