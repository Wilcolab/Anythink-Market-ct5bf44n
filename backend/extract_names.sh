#!/bin/bash

# Check if a file was passed as argument
if [ -z "$1" ]; then
  echo "Please provide the path to a CSV file as argument"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File not found: $1"
  exit 1
fi

# Use awk to print the first and last name fields for rows with email suffix amazon.com
awk -F, 'tolower($4) ~ /amazon\.com$/ { print $2 " " $3 }' "$1"

