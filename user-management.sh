#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root!"
    exit 1
fi

# Define password and users file
PASSWORD="P@ssw0rd123"
USER_FILE="users.txt"

# Check if user file exists
if [[ ! -f "$USER_FILE" ]]; then
    echo "User file not found!"
    exit 1
fi

# Loop through users in the file
while IFS= read -r user; do
    # Check if user already exists
    if id "$user" &>/dev/null; then
        echo "User $user already exists!"
    else
        # Create user, set password, and force change on first login
        useradd -m -s /bin/bash "$user"
        echo "$user:$PASSWORD" | chpasswd
        passwd --expire "$user"
        echo "User $user created successfully!"
    fi
done < "$USER_FILE"
