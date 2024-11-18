#!/bin/bash

# Output file name
output_file="binary_numbers_1000_to_9999.txt"

# Create or clear the file
> $output_file

# Loop through numbers 1000 to 9999
for ((i=1000; i<=9999; i++))
do
  # Convert number to binary using printf and append to the file
  printf "%s\n" "$(echo "obase=2; $i" | bc)" >> $output_file
done

echo "Binary numbers from 1000 to 9999 have been written to $output_file"

