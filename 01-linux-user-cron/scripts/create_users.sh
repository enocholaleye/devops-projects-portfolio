#!/bin/bash
# Author: Enoch
# Description: Creates users with a default password.

USER_LIST=("devuser1" "devuser2" "testuser1")

for USER in "${USER_LIST[@]}"; do
    if id "$USER" &>/dev/null; then
        echo "User $USER already exists."
    else
        sudo useradd -m -s /bin/bash "$USER"
        echo "$USER:Welcome123!" | sudo chpasswd
        echo "Created user: $USER"
    fi
done
