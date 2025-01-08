#!/bin/sh
# Writer script for assignment 1
# Author: Bilal Moussa

set -e
set -u
WRITESTR=DEFAULT
WRITEDIR=default
username=$(cat ../conf/username.txt)

echo "Calling writer.sh user: $username"

if [ $# -lt 2 ]
then
	echo "Wrong number of arguments, Usage: $0 <file_name> <write_string>"
	exit 1
else
	# Check if the user has provided the first argument (file name)
	if [ -z "$1" ]; then
		echo "Error: No file name provided."
		echo "Usage: $0 <file_name> <write_string>"
		exit 1
	else
		echo "Writing to file '$1'"
		echo "Writing: '$2'"
	fi
	WRITESTR=$2
	WRITEDIR=$1
fi

# Create the file if it doesn't exist
mkdir -p "$(dirname "$WRITEDIR")"  # Create parent directory if it doesn't exist
echo "$WRITESTR" >> "$WRITEDIR"    # Write the content to the file

# Show the updated content of the file
echo "Updated content of '$WRITEDIR':"
cat "$WRITEDIR"

