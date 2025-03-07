#!/bin/bash

# Define the folder path under /home
FOLDER="/home/Troubleshooting"

# Check if the folder exists
if [ -d "$FOLDER" ]; then
    echo "The folder '$FOLDER' already exists. Exiting script."
    exit 1
fi

# Create the folder
mkdir "$FOLDER"
echo "Folder '$FOLDER' created under /home."

# Change to the folder
cd "$FOLDER" || { echo "Failed to change directory to $FOLDER"; exit 1; }

# Download the script using curl
SCRIPT_URL="https://raw.githubusercontent.com/mainulhossain123/master_monitoring/main/master_monitoring.sh"
SCRIPT_NAME="master_monitoring.sh"

echo "Downloading script..."
curl -O "$SCRIPT_URL"

# Check if the file was downloaded successfully
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Failed to download $SCRIPT_NAME. Exiting script."
    exit 1
fi

echo "Script downloaded successfully."

# Give execution permissions to the script
chmod +x "$SCRIPT_NAME"

# Run the script
echo "Running the script..."
./"$SCRIPT_NAME"
