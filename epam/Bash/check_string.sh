#!/bin/bash

# Get the input
arg="$1"

# Create number variables
nums=0
lets=0
syms=0

# Check the input characters
for ((i=0; i<${#arg}; i++)); do
  # save each element in the string
  el=${arg:i:1}
  case $el in
    ' ')                  ;; # Check for whitespaces
    [0-9])    ((nums+=1)) ;; # Check for numbers
    [a-zA-Z]) ((lets+=1)) ;; # Check for letters
    *)        ((syms+=1)) ;; # Check for other characters (symbols)
  esac
done

# Print result
# echo "$1"
echo "Numbers: $nums Symbols: $syms Letters: $lets"