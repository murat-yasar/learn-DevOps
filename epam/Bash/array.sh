#!/bin/bash

# 1. Get the argument
count=$1

created_folders=()

# 2. Loop to generate the names and create folders
for ((i=0; i<count; i++)); do
  # 97 is the ASCII value for 'a'. Adding 'i' moves to 'b', 'c', etc.
  # printf "\\$(printf '%03o' "$((97 + i))")" converts the ASCII number to a character
  printf -v letter "\\$(printf '%03o' "$((97 + i))")"

  folder_name="folder_$letter"

  # Create the directory
  mkdir -p "$folder_name"

  # Track the created folder name for the final output string
  created_folders+=("$folder_name")
done

# 3. Print the final message
# replace spaces with commas using string manipulation.
output_list=$(IFS=,; echo "${created_folders[*]}")

echo "$count folders created:"
echo "${output_list//,/_}"