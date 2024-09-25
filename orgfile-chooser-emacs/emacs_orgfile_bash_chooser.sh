#!/bin/bash
# Bash Script To Open Emacs in Certain files through an intuitive menu.
# AUTHOR: Zaine Qayyum

# File paths #EDIT#
files=(
    "/home/..."
    "/home/..."
    "/home/..."
)

# Display options to the user
echo "Please choose a number corresponding to the file you want to open:"
for i in "${!files[@]}"; do
    filename=$(basename "${files[$i]}")
    echo "$((i+1))) $filename"
done
echo "4) Open all files"
echo "5) Add a new file to the list"
echo "6) Exit"

# Read the user's input
read -p "Enter your choice (1/2/3/4/5/6): " choice

# Define actions based on user's choice
case $choice in
    1|2|3)
        selected_file="${files[$((choice-1))]}"
        if [ -f "$selected_file" ]; then
            emacs "$selected_file" &
        else
            echo "Error: File '$selected_file' not found."
        fi
        ;;
    4)
        for file in "${files[@]}"; do
            if [ -f "$file" ]; then
                emacs "$file" &
            else
                echo "Error: File '$file' not found."
            fi
        done
        ;;
    5)
        read -p "Enter the full path of the new file to add: " new_file
        if [ -f "$new_file" ]; then
            files+=("$new_file")
            echo "File added: $new_file"
        else
            echo "Error: File '$new_file' not found."
        fi
        ;;
    6)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid option. Please run the script again and choose a valid number."
        ;;
esac
