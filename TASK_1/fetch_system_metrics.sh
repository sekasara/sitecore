#!/bin/bash

# Fetching Disk Size in Virtual Machine

total_disk=$(df -m | grep -w "/" | awk '{print $2}')
used_disk=$(df -m | grep -w "/" | awk '{print $3}')
available_disk=$(df -m | grep -w "/" | awk '{print $4}')

echo "Total Disk ${total_disk} MB"
echo "Used Disk ${used_disk} MB"
echo "Available Disk ${available_disk} MB"