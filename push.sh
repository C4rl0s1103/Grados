#!/bin/bash

# Navigate to the script's directory
cd "$(dirname "$0")"

# Add all changes
git add .

# Check if the add command was successful
if [ $? -ne 0 ]; then
    echo "Failed to add changes."
    exit 1
fi

# Prompt for commit message
echo 'Enter the commit message:'
read commitMessage

# Commit changes
git commit -m "$commitMessage"

# Check if the commit command was successful
if [ $? -ne 0 ]; then
    echo "Failed to commit changes."
    exit 1
fi

# Push changes
git push

# Check if the push command was successful
if [ $? -ne 0 ]; then
    echo "Failed to push changes."
    exit 1
fi

# Sleep for 2 seconds
sleep 2s
