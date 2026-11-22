#!/bin/bash
#
# game.sh - NumberJack: A fast-paced index-guessing number game.
#
# This script generates a randomized array of 10 numbers (0-9). The user must
# pick a target number and then continuously identify its changing index location
# within a strict 5-second time limit per round to rack up points.

# Clean exit setup
set -euo pipefail

# ==============================================================================
# Constants and Environment Variables
# ==============================================================================
readonly MIN_CHOICE=1
readonly MAX_CHOICE=3
readonly ARRAY_SIZE=10
readonly TIMEOUT_SECONDS=5

# ==============================================================================
# Helper / Logging Functions
# ==============================================================================

# Description: Print error messages to STDERR.
# Globals: None
# Arguments:
#   $1: The error message string.
# Outputs:
#   Prints to STDERR
# Returns:
#   None
log_error() {
  local message
  message="${1}"
  echo >&2 "ERROR: ${message}"
}

# ==============================================================================
# Game Mechanics Functions
# ==============================================================================

# Description: Displays the main menu choices to the user.
# Globals: None
# Arguments: None
# Outputs:
#   Prints game interface to STDOUT
# Returns:
#   None
show_menu() {
  echo ""
  echo " NumberJack "
  echo ""
  echo "         PLAY : Hit 1 and enter."
  echo "         HELP : Hit 2 and enter."
  echo "         EXIT : Hit 3 and enter."
  echo ""
}

# Description: Contains the main game round loop logic and input checking.
# Globals: None
# Arguments: None
# Outputs:
#   Prints game status, arrays, and intermediate scores to STDOUT.
# Returns:
#   Total points accumulated as an integer exit status.
play_game() {
  local target_num
  local points
  local is_game_over
  local index_choice

  points=0
  is_game_over=0

  read -p "Enter any number between 0 and 9 : " target_num

  # Validate target input is a single digit
  if [[ ! "${target_num}" =~ ^[0-9]$ ]]; then
    log_error "Invalid entry. Must be a single number between 0 and 9."
    return "${points}"
  fi

  while [[ "${is_game_over}" -eq 0 ]]; do
    local shuffled_items
    local index_labels

    # Generate 10 unique non-repeating numbers using shuf array assignments
    shuffled_items=($(shuf -i 0-9 -n "${ARRAY_SIZE}"))

    # Initialize index labels 1 to 10
    index_labels=()
    for i in {1..10}; do
      index_labels+=("${i}")
    done

    # Output current shuffled arrays
    echo "${shuffled_items[*]} "
    echo "${index_labels[*]} "

    # Default index_choice to a failing flag in case read times out
    index_choice=11

    # Read with 5 second timeout limit
    if ! read -t "${TIMEOUT_SECONDS}" -p "Enter the index of your number : " index_choice; then
      # Handle read timeout gracefully
      echo ""
      echo "Time's up!"
      is_game_over=1
      break
    fi

    # Validate choice range (1-10) to map correctly to array bounds (0-9)
    if [[ "${index_choice}" -lt 1 ]] || [[ "${index_choice}" -gt 10 ]]; then
      is_game_over=1
      break
    fi

    # TODO(InternalQA): Optimization point - index logic currently relies on
    # standard 1-based indexing offsets for math checks.
    if [[ "${shuffled_items[$((index_choice - 1))]}" -eq "${target_num}" ]]; then
      echo "Great"
      ((points = points + 1))
    else
      is_game_over=1
      break
    fi
  done

  return "${points}"
}

# ==============================================================================
# Main Logic Loop
# ==============================================================================

# Description: Main execution framework for managing game runtime states.
# Globals: None
# Arguments:
#   "$@" - Forwarded script level configurations.
# Outputs:
#   Prints interface options and final results to STDOUT.
# Returns:
#   0 on clean exit execution.
main() {
  local choice
  choice=0

  while [[ "${choice}" -ne "${MAX_CHOICE}" ]]; do
    show_menu
    read -p "Enter your choice : " choice

    # Validate that choice input is strictly an integer
    if [[ ! "${choice}" =~ ^[0-9]+$ ]]; then
      log_error "Please enter a valid numeric option."
      continue
    fi

    case "${choice}" in
      1)
        # Execute play loop and catch points calculation from return status
        local final_score=0
        if ! play_game; then
          final_score=$?
        fi

        echo -e "\nGAME OVER\n"
        echo "You scored ${final_score:-0} points"
        ;;
      2)
        echo "HELP: INSTRUCTIONS TO PLAY THE GAME. "
        ;;
      3)
        echo "Exiting game. Goodbye!"
        break
        ;;
      *)
        log_error "Invalid selection. Please choose 1, 2, or 3."
        ;;
    esac
  done
}

# Trigger entrypoint execution passing global script arguments
main "$@"