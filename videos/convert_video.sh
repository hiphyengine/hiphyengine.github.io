#!/bin/bash

# Folder containing the videos
INPUT_DIR="."
OUTPUT_DIR="$INPUT_DIR/converted"

# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all .mp4, .mkv, or other video files in the folder
for file in "$INPUT_DIR"/*.{mp4,mkv,mov,avi}; do
    # Check if file exists (in case no files match)
    [ -e "$file" ] || continue
    
    # Get filename without extension
    filename=$(basename "$file")
    name="${filename%.*}"
    
    # Set output file path
    output="$OUTPUT_DIR/${name}.mp4"
    
    # Convert using ffmpeg
    ffmpeg -i "$file" -c:v libx264 -preset slow -crf 23 -c:a copy "$output"
    
    echo "Converted $file to $output"
done
