#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
	echo "Error: Incorrect number of arguments. Usage: $0 <writefile> <writestr>"
	exit 1
fi

# Assign the arguments to variables
writefile=$1
writestr=$2

# Check if writefile and writestr are specified
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
	echo "Error: writefile or writestr not specified."
	exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" >"$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
	echo "Error: Failed to create file $writefile"
	exit 1
fi

# Exit with success status
exit 0
