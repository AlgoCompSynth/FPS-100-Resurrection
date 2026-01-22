!/bin/bash

# Define the source directory
SOURCE_DIR="$HOME/Documents/FloatingPointSystems/FPS 100/fps100sw"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

# Loop through all files in the source directory
for FILE in "$SOURCE_DIR"/*.FTN; do
    # Check if there are any .FTN files
    if [ ! -e "$FILE" ]; then
        echo "No .FTN files found in $SOURCE_DIR"
        exit 1
    fi
    
    # Extract the base name of the file
    BASENAME=$(basename "$FILE" .FTN)
    
    # Remove part between '[' and ']', convert to lower case, and append '.f'
    NEWNAME=$(echo "$BASENAME" | sed -e 's/^.*\[\(.*\)\]//' | tr '[:upper:]' '[:lower:]')
    if [ -z "$NEWNAME" ]; then
        echo "Skipping renaming for $BASENAME (no match found)"
        continue
    fi
    
    NEWNAME="$NEWNAME.f"
    
    # Copy the file to the current directory with the new name
    cp "$FILE" "./$NEWNAME"
    echo "Copied $FILE to ./$NEWNAME"
done
