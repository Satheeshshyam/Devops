#!/bin/bash

LOG_DIR="/var/log"
DAYS=7

echo "Cleaning logs older than $DAYS days..."

find $LOG_DIR -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

echo "Log cleanup completed."
