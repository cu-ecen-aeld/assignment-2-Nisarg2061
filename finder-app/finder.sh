#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
	echo "Error: Incorrect number of arguments. Usage: $0 <filesdir> <searchstr>"
	exit 1
fi

# Assign the arguments to variables
filesdir=$1
searchstr=$2

# Check if filesdir and searchstr are specified
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
	echo "Error: filesdir or searchstr not specified."
	exit 1
fi

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
	echo "Error: $filesdir is not a directory."
	exit 1
fi

# Find the number of files in filesdir and all subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Find the number of matching lines
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the number of files and matching lines
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

# Exit with success status
exit 0
