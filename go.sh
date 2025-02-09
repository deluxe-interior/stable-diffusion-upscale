#!/bin/bash

# Folder paths
video_folder_path='./input/video'
txt_file_path='./input/text/prompt.txt'

# Get all .mp4 files in the folder using find to handle special characters
mapfile -t files < <(find "$video_folder_path" -type f -name "*.mov")

# Print the list of MP4 files
echo "Files to be processed"
for file in "${files[@]}"; do
    echo "$file"
done

# Read lines from the text file, skipping empty lines
mapfile -t lines < <(grep -v '^\s*$' "$txt_file_path")

# The number of video frames processed simultaneously during each denoising process.
frame_length=32

# Debugging output
echo "Number of files: ${#files[@]}"
echo "Number of lines in the text file: ${#lines[@]}"

# Ensure the number of video files matches the number of lines
if [ ${#files[@]} -ne ${#lines[@]} ]; then
    echo "Number of MP4 files and lines in the text file do not match."
    exit 1
fi

# Loop through video files and corresponding lines
for i in "${!files[@]}"; do
    file="${files[$i]}"
    line="${lines[$i]}"
    
    # Extract the filename without the extension
    file_name=$(basename "$file" .mov)
    
    echo "Processing video file: $file with prompt: $line"
        
    # Run Python script with parameters
    python \
        ./upscale/inference_sr.py --solver_mode 'fast' --steps 15 --input_path "${file}" --model_path ./models/light_deg.pt --prompt "${line}" \
        --upscale 2 --max_chunk_len ${frame_length} --file_name "${file_name}.mov" --save_dir ./output
done

echo "All videos processed successfully."
