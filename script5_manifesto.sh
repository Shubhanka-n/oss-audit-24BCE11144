#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Shubhankan Kumar
# Purpose: Generate a personalized open-source philosophy statement

# --- Introduction ---
echo "Answer three questions to generate your manifesto."

# --- User input ---
read -p "1. Which open-source tool inspires you the most? " TOOL
read -p "2. What does digital freedom mean to you? " FREEDOM
read -p "3. What do you want to build or improve using open source? " BUILD

# --- Date and output file ---
DATE_TIME=$(TZ="Asia/Kolkata" date '+%d-%m-%Y %I:%M:%S %p IST')
OUTPUT_FILE="manifesto_$(whoami).txt"

# --- Alias concept example ---
ALIAS_EXAMPLE="alias workdocs='cd ~/Documents'"

# --- Write manifesto to file ---
{
    echo "Open Source Manifesto"
    echo "Generated on: $DATE_TIME"
    echo ""
    echo "I, Shubhankan Kumar, believe in the power of open source."
    echo "$FREEDOM"
    echo "The open-source tool that inspires me the most is $TOOL"
    echo "Using open source, I want to build or improve $BUILD"
    echo "A useful shell alias idea is: $ALIAS_EXAMPLE"
} > "$OUTPUT_FILE"

# --- Show result ---
echo "----------------------------------------"
echo "Manifesto saved to: $OUTPUT_FILE"
echo "----------------------------------------"
cat "$OUTPUT_FILE"







