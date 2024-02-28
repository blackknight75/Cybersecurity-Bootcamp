#!/bin/bash
# OpenSSL Tool v1.1

# Function to install OpenSSL
install_openssl() {
    read -p "OpenSSL is not installed. Would you like to install it? (y/n): " answer
    if [[ $answer == "y" || $answer == "Y" ]]; then
        echo "Installing OpenSSL now..."
        sudo apt update && sudo apt install openssl -y
        if [[ $? -eq 0 ]]; then
            echo "OpenSSL Successfully Installed"
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
    echo "*"
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
                generate_key_iv $2 $3
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
            local filename="$2"
            local key_iv_file="$3"
        
            # Extract key and IV from the key-iv file
            local key=$(grep key $key_iv_file | awk -F "=" '{print $2}')
            local iv=$(grep iv $key_iv_file | awk -F "=" '{print $2}')
        
            # Perform decryption
            printf "\e[1;34mMessage:\e[0m\e[1;32mDECRYPTED\e[0m\n"
            message=$(openssl enc -pbkdf2 -nosalt -aes-256-cbc -in "$filename" -d -base64 -K "$key" -iv "$iv")
            printf "\e[1;36m%s\e[0m\n" "$message"
            
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
if [[ $# -lt 3 ]]; then
    printf "\e[1;33mUsage:\e[0m\e[1;34m <operation> [operation-specific arguments]\e[0m\n"

    printf "\e[1;32mAvailable Operations:\e[0m\n"
    printf "\e[1;35m1. Generate Key & IV\e[0m\n"
    printf "\e[0;36m   Description:\e[0m Create a new encryption key and initialization vector (IV).\n"
    printf "\e[1;34m   Command:\e[0m\t./openssl-tool.sh generate <password> <output_file_name>\n\n"

    printf "\e[1;35m2. Encrypt\e[0m\n"
    printf "\e[0;36m   Description:\e[0m Encrypt a file using a specified key and IV.\n"
    printf "\e[1;34m   Command:\e[0m\t./openssl-tool.sh encrypt <input_filename.txt> <key_iv_file>\n\n"

    printf "\e[1;35m3. Decrypt\e[0m\n"
    printf "\e[0;36m   Description:\e[0m Decrypt a file using a specified key and IV.\n"
    printf "\e[1;34m   Command:\e[0m\t./openssl-tool.sh decrypt <input_filename.txt.enc> <key_iv_file>\n"

    exit 1
else
    process_operation "$@"
fi
