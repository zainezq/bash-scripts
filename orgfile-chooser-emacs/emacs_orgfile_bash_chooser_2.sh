#!/bin/bash
# Bash Script To Open Emacs in Certain files through an intuitive menu.
# AUTHOR: Zaine Qayyum

# Path to the file list
FILE_LIST="$HOME/path/to/file_list.txt" #EDIT#

# Check if file_list.txt exists, if not, create it with default files. 
if [ ! -f "$FILE_LIST" ]; then
    echo "$HOME/path/to/default1.org" > "$FILE_LIST" #EDIT#
    echo "$HOME/path/to/default2.org" >> "$FILE_LIST" #EDIT#
    echo "$HOME/path/to/default3.org" >> "$FILE_LIST" #EDIT#
fi

# Read file paths from the file list into an array
mapfile -t files < "$FILE_LIST"

# Display options to the user
echo "Please choose a number corresponding to the file you want to open:"
for i in "${!files[@]}"; do
    filename=$(basename "${files[$i]}")
    echo "$((i+1))) $filename"
done
echo "$(( ${#files[@]} + 1 ))) Open all files"
echo "$(( ${#files[@]} + 2 ))) Add a new file to the list"
echo "$(( ${#files[@]} + 3 ))) Exit"

# Read the user's input
read -p "Enter your choice: " choice

# Define actions based on user's choice
case $choice in
    [1-$((${#files[@]}))])
        selected_file="${files[$((choice-1))]}"
        if [ -f "$selected_file" ]; then
            emacs "$selected_file" &
        else
            echo "Error: File '$selected_file' not found."
        fi
        ;;
    $((${#files[@]} + 1)))
        for file in "${files[@]}"; do
            if [ -f "$file" ]; then
                emacs "$file" &
            else
                echo "Error: File '$file' not found."
            fi
        done
        ;;
    $((${#files[@]} + 2)))
        read -p "Enter the full path of the new file to add: " new_file
        if [ -f "$new_file" ]; then
            # Append the new file to the array and the file_list.txt
            echo "$new_file" >> "$FILE_LIST"
            echo "File added: $new_file"
        else
            echo "Error: File '$new_file' not found."
        fi
        ;;
    $((${#files[@]} + 3)))
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid option. Please run the script again and choose a valid number."
        ;;
esac
