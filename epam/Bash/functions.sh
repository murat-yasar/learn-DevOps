#!/bin/bash

pow() {
  local num1=$1
  local num2=$2
  local result=$1

  for ((i=1; i<$2; i++)); do
    result=$((result * num1));
  done

  echo "$result";
}
pow $1 $2



shortest() {
  # If no arguments are passed, just return
  if [ $# -eq 0 ]; then
    return
  fi

  # Find the shortest length (assuming that the first argument is the shortest at the beginning)
  local min_len=${#1}
  for arg in "$@"; do
    local current_len=${#arg}
    if (( current_len < min_len )); then
      min_len=$current_len
    fi
  done

  # Print all arguments that match that minimum length
  for arg in "$@"; do
    if (( ${#arg} == min_len )); then
      echo "$arg"
    fi
  done
}
shortest "$@"



print_log() {
  # Format the current date and time as: YEAR-MONTH-DAY HOUR:MINUTES
  local timestamp=$(date +"%Y-%m-%d %H:%M")

  # Print the formatted timestamp followed by the message argument
  echo "[$timestamp] $1";
}
print_log "$*"