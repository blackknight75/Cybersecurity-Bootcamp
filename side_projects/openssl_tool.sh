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

# Function to generate key and IV using OpenSSL
generate_key_iv() {
    local password=$1
    local output_file=$2
    openssl enc -pbkdf2 -nosalt -aes-256-cbc -k "$password" -P > "$output_file"
    if [[ $? -eq 0 ]]; then
        echo "Key and IV generated successfully in $output_file."
    else
        echo "Failed to generate Key and IV."
        exit 1
    fi
}

# Function to process operation
process_operation() {
    local operation=$1
    case $operation in
        generate)
            if [[ $# -ne 3 ]]; then
                echo "Usage for generate: $0 generate <password> <output_filename>"
                exit 1
            else
                generate_key_iv $2 $3
            fi
            ;;
        encrypt)
            local input_filename="$2"
            local key_iv_file="$3"
        
            # Extract key and IV from the file using awk
            local key=$(grep key $key_iv_file | awk -F "=" '{print $2}')
            local iv=$(grep iv $key_iv_file | awk -F "=" '{print $2}')
        
            # Check if both key and iv have been extracted
            if [[ -z "$key" || -z "$iv" ]]; then
                echo "Could not extract key and IV from file."
                exit 1
            fi
        
            # Perform the encryption
            openssl enc -pbkdf2 -nosalt -aes-256-cbc -in "$input_filename" -out "${input_filename}.enc" -base64 -K "$key" -iv "$iv"
            if [[ $? -eq 0 ]]; then
                echo "File encrypted successfully: ${input_filename}.enc"
            else
                echo "Encryption failed."
                exit 1
            fi
            ;;
        decrypt)
            if [[ $# -ne 3 ]]; then
                echo "Usage: $0 decrypt <filename> <key-iv-file>"
                exit 1
            fi
        
            local filename="$2"
            local key_iv_file="$3"
        
            # Extract key and IV from the key-iv file
            local key=$(grep key $key_iv_file | awk -F "=" '{print $2}')
            local iv=$(grep iv $key_iv_file | awk -F "=" '{print $2}')
        
            # Perform decryption
            openssl enc -pbkdf2 -nosalt -aes-256-cbc -in "$filename" -d -base64 -K "$key" -iv "$iv"
        
            if [[ $? -eq 0 ]]; then
                echo "File decrypted successfully: ${filename}"
            else
                echo "Failed to decrypt file."
                exit 1
            fi            ;;
                *)
                    echo "Invalid operation. Use 'generate', 'encrypt', or 'decrypt'."
                    exit 1
                    ;;
            esac
        }

# Main script starts here
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <operation> [operation-specific arguments]"
    echo "Operation must be one of: generate, encrypt, decrypt"
    exit 1
else
    process_operation $@
fi
