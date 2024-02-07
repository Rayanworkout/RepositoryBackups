#!/bin/bash

cd /full/path/of/your/backup/directory
# Specify the path to your text file containing GitHub links
file_path="./repositories.txt"

# Username of the GitHub account
# not the email address
USERNAME="YOUR_USERNAME"

# Password authentication has been removed from GitHub, so you need to use a personal access token
# Create it by following the instructions here: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token

# This token is used to clone private repositories, if you only want to backup
# public repositories, you can set the token as an empty string
TOKEN="GITHUB_TOKEN"

# Check if the file exists
if [ -f "$file_path" ]; then
    # Loop through each line in the file
    while IFS= read -r REPO_NAME; do
        # Check if the folder exists
        if [ -d "$REPO_NAME" ]; then
            # If the folder exists, git pull
            echo "-----------------------------"
            echo "> Folder $REPO_NAME exists, pulling latest changes..."
            echo "-----------------------------"
            cd "$REPO_NAME"
            # Repo folder must have been created with the script so
            # that the access token is part of the origin URL
            git pull
            cd ..
        else
            # If the folder doesn't exist, git clone
            echo "-----------------------------"
            echo "> Folder $REPO_NAME does not exist, cloning repository..."
            echo "-----------------------------"
            git clone https://$TOKEN@github.com/$USERNAME/$REPO_NAME.git
        fi
        
    done < "$file_path"
    now=$(date +"%d/%m/%Y %H:%M")
    echo "$now | backup ok" >> logs.txt
else
    echo "File $file_path not found."
fi
