#!/bin/bash

# Define the folder path under /home
FOLDER="/home/Troubleshooting"
SCRIPT_URL="https://raw.githubusercontent.com/mainulhossain123/master_monitoring/main/master_monitoring.sh"
SCRIPT_NAME="master_monitoring.sh"

# Check if the folder exists; if not, create it
if [ ! -d "$FOLDER" ]; then
    echo "The folder '$FOLDER' does not exist. Creating it now..."
    mkdir "$FOLDER"
    echo "Folder '$FOLDER' created under /home."
else
    echo "The folder '$FOLDER' already exists."
fi

# Move into the folder
cd "$FOLDER" || { echo "Failed to change directory to $FOLDER"; exit 1; }

# Check if the script exists; if not, download it
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Script '$SCRIPT_NAME' not found. Downloading..."
    curl -O "$SCRIPT_URL"

    # Check if the download was successful
    if [ ! -f "$SCRIPT_NAME" ]; then
        echo "Failed to download $SCRIPT_NAME. Exiting script."
        exit 1
    fi
    echo "Script downloaded successfully."
else
    echo "Script '$SCRIPT_NAME' already exists. Skipping download."
fi

# Give execution permissions to the script
chmod +x "$SCRIPT_NAME"

# Run the script
echo "Running the script..."
./"$SCRIPT_NAME"
