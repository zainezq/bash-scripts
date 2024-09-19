#!/bin/bash
# Bash Script To Power On PC and SSH into it.
# AUTHOR: Zaine Qayyum

# replace with mac address of pc you want to ssh into
MAC_ADDRESS="xx:xx:xx:xx:xx:xx"
# replace with username of the pc you want to ssh into
USER=""
# replace with ip address of the pc you want to ssh into
IP="xxx.xxx.xxx.xxx"

echo "Hang tight..."
# Call wakeonlan and capture the output
OUTPUT=$(wakeonlan "$MAC_ADDRESS" 2>&1)  # 2>&1 captures both stdout and stderr

echo "wakeonlan output: $OUTPUT"

# Ouput analysis, with if-else checks
if [[ $OUTPUT == *"Sending magic packet"* ]]; then
    echo "Wake-on-LAN packet sent successfully."
else
    echo "Error sending magic packet or no response: $OUTPUT"
fi

# Sleep for x seconds so that the PC can wake up
# Replace with the time it'll take for pc to boot, 15 sec is set as default
sleep 15

echo "Attempting to SSH into $USER@$IP..."
# Start SSH and let it take over the terminal
ssh -X "$USER@$IP"
