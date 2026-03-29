#!/bin/bash
# Script 1: System Identity Report
# Author: Shubhankan Kumar
# Purpose: Display basic Linux system identity information

# --- Student details ---
STUDENT_NAME="Shubhankan Kumar"
SOFTWARE_CHOICE="Git"

# --- Collect system information ---
DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR="$HOME"
UPTIME=$(uptime -p)
CURRENT_DATE=$(TZ="Asia/Kolkata" date '+%d-%m-%Y %I:%M:%S %p IST')

# --- Display formatted report ---
echo "========================================"
echo "      System Identity Report"
echo "========================================"
echo "Student Name   : $STUDENT_NAME"
echo "Software Chosen: $SOFTWARE_CHOICE"
echo "----------------------------------------"
echo "Distribution   : $DISTRO"
echo "Kernel Version : $KERNEL"
echo "Logged-in User : $USER_NAME"
echo "Home Directory : $HOME_DIR"
echo "System Uptime  : $UPTIME"
echo "Date & Time    : $CURRENT_DATE"
echo "----------------------------------------"
echo "License Info   : Linux kernel is licensed under GPL v2"
echo "========================================"