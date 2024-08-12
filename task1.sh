#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <search_file> <from_folder>"
    exit 1
fi

# Assign arguments to variables
search_file="$1"
from_folder="$2"

# Check if the specified directory exists
if [ ! -d "$from_folder" ]; then
    echo "Error: Directory $from_folder does not exist."
    exit 1
fi

# Perform depth-first search to find the file
find "$from_folder" -type f -name "$search_file" -print

