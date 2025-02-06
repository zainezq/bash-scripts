#!/bin/bash

# Define the directories
DIR1="/home/zaine/Documents/sharp-study-frontend"
DIR2="/home/zaine/Documents/sharp-study"

# Run git pull in the first directory
echo "Pulling latest changes in $DIR1"
cd "$DIR1" || { echo "Failed to enter $DIR1"; exit 1; }
git pull

# Run git pull in the second directory
echo "Pulling latest changes in $DIR2"
cd "$DIR2" || { echo "Failed to enter $DIR2"; exit 1; }
git pull

echo "Update complete."
