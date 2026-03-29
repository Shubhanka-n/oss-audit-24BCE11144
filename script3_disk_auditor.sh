#!/bin/bash
# Script 3: Directory and Disk Auditor
# Author: Shubhankan Kumar
# Purpose: Audit important system directories without exposing unnecessary details

# --- Software details ---
SOFTWARE_NAME="Git"
CONFIG_DIR="$HOME/.config/git"

# --- Directories to inspect ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# --- Heading ---
echo "========================================"
echo "     Privacy-Safe Directory Auditor"
echo "========================================"
echo "Software Chosen : $SOFTWARE_NAME"
echo "----------------------------------------"

# --- Directory audit loop ---
for DIR in "${DIRS[@]}"
do
    echo "Directory      : $DIR"

    if [ -d "$DIR" ]; then
        DETAILS=$(ls -ld "$DIR")
        PERMISSIONS=$(echo "$DETAILS" | awk '{print $1}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        DISK_USAGE=$(df -h "$DIR" 2>/dev/null | awk 'NR==2 {print $5}')

        echo "Exists         : Yes"
        echo "Permissions    : $PERMISSIONS"
        echo "Directory Size : $SIZE"
        echo "Disk Used      : $DISK_USAGE"
    else
        echo "Exists         : No"
    fi

    echo "----------------------------------------"
done

# --- Software configuration directory check ---
echo "Software Configuration Directory Check"

if [ -d "$CONFIG_DIR" ]; then
    CONFIG_DETAILS=$(ls -ld "$CONFIG_DIR")
    CONFIG_PERMS=$(echo "$CONFIG_DETAILS" | awk '{print $1}')
    echo "Config Exists  : Yes"
    echo "Permissions    : $CONFIG_PERMS"
else
    echo "Config Exists  : No"
fi

echo "========================================"