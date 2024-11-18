#!/bin/bash

# File containing binary numbers
input_file="binary_numbers_1000_to_9999.txt"

# Check if the file exists
if [[ ! -f $input_file ]]; then
  echo "Error: $input_file not found!"
  exit 1
fi

# Frequency parameters for FSK modulation (adjust as needed)
freq_base=125000       # Base frequency for FSK (125 kHz for RFID)
freq_shift=2000        # Frequency shift for FSK (e.g., ±2 kHz)
modulation_type=1      # Modulation type for rpitx (FSK)

# Loop through each line (binary code) in the file
while IFS= read -r rfid_code; do
  # Skip empty lines
  if [[ -z $rfid_code ]]; then
    continue
  fi

  # Transmit the RFID code using rpitx
  echo "Transmitting RFID code: $rfid_code"
  sudo rpitx -m $modulation_type -f $freq_base -c $freq_shift -t "0b$rfid_code"

  # Transmit for 2 seconds (rpitx should handle timing, but you can sleep for extra safety)
  sleep 2
done < "$input_file"

echo "Finished cycling through all RFID codes."

