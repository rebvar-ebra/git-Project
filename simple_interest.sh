#!/bin/bash

# This script calculates simple interest given principal,
# annual rate of interest, and time period in years.

# Function to calculate simple interest
calculate_simple_interest() {
  local principal=$1
  local rate=$2
  local time=$3
  local interest

  interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
  echo "The simple interest for a principal amount of $principal at a rate of $rate% over $time years is: $interest"
}

# Check if we have 3 arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <principal> <rate> <time>"
  exit 1
fi

# Capture the input arguments
principal=$1
rate=$2
time=$3

# Validate input: they should all be positive numbers
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Error: All arguments must be positive numbers."
  exit 1
fi

# Calculate and print the simple interest
calculate_simple_interest $principal $rate $time
