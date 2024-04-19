#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input outpup"
    exit 1
fi

input="$1"
output="$2"

mkdir -p "$output"

find "$input" -type f | while IFS= read -r file; do
    filename=$(basename "$file")
    dest="$output/$filename"
    
    if [ -e "$dest" ]; then
        suffix=1
        while [ -e "$output/$filename.$suffix" ]; do
            ((suffix++))
        done
        
        dest="$output/$filename.$suffix"
    fi
    
    cp "$file" "$dest"
done

echo "fine"
