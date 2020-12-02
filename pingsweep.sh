#!/bin/bash

# Script launches with the network portion of IP (user provide arg for subnet segment)
# It will then ping each of the host portion of the network
# A list of live hosts will be presented to the user

# Loop thru each possible host on my subnet
echo "Now pinging with specified filters applied. Please wait..."
printf '\n'
for x in `seq 1 254` ; do
# ping each 1 time. $1 is the subnet and $x is the host
# pipe thru grep to filter for 64 byte responses
# Then, cut the 4th segment (IP) .. '-d' is the space delimeters in this case. '-f' is field
ping -c 1 $1.$x | grep "64 bytes" | cut -d " " -f 4 ; done
