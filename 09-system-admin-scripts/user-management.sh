#!/bin/bash
# ============================================
# User Management Script
# Author: Jean de Dieu HAGENIMANA
# Description: Create, modify, or delete system users
# ============================================

# Function to create user
create_user() {
    USERNAME=$1
    FULLNAME=$2
    
    sudo useradd -m -c "$FULLNAME" -s /bin/bash $USERNAME
    sudo passwd $USERNAME
    echo "User $USERNAME created successfully"
}

# Function to delete user
delete_user() {
    USERNAME=$1
    
    sudo userdel -r $USERNAME
    echo "User $USERNAME deleted successfully"
}

# Function to list users
list_users() {
    cut -d: -f1 /etc/passwd
}

# Menu
echo "User Management System"
echo "1. Create User"
echo "2. Delete User"
echo "3. List Users"
echo "4. Exit"
read -p "Choose option: " OPTION

case $OPTION in
    1)
        read -p "Username: " USERNAME
        read -p "Full Name: " FULLNAME
        create_user $USERNAME "$FULLNAME"
        ;;
    2)
        read -p "Username to delete: " USERNAME
        delete_user $USERNAME
        ;;
    3)
        list_users
        ;;
    4)
        exit 0
        ;;
    *)
        echo "Invalid option"
        ;;
esac
