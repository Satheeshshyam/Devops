#!/bin/bash

echo "Server Health Check Report"
echo "--------------------------"

echo "Hostname:"
hostname

echo "Uptime:"
uptime

echo "CPU Load:"
top -bn1 | grep "load average"

echo "Memory Usage:"
free -m

echo "Disk Usage:"
df -h

echo "Running Processes:"
ps -ef | wc -l
