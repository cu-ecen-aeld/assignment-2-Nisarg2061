#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Error: Incorrect number of arguments. Usage: $0 <writefile> <writestr>"
	exit 1
fi

writefile=$1
writestr=$2

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
	echo "Error: writefile or writestr not specified."
	exit 1
fi

mkdir -p "$(dirname "$writefile")"

echo "$writestr" >"$writefile"

if [ $? -ne 0 ]; then
	echo "Error: Failed to create file $writefile"
	exit 1
fi

exit 0
