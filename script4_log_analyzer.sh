#!/bin/bash
# Script 4: Log File Keyword Analyzer
# Author: Shubhankan Kumar
# Purpose: Count keyword matches in a log file and show the last five matching lines

# --- Read command-line arguments ---
LOGFILE="${1:-sample_log.txt}"
KEYWORD="${2:-error}"

# --- Create a sample log file if none exists ---
if [ ! -f "$LOGFILE" ]; then
    cat > "$LOGFILE" <<EOF
[INFO] System boot completed
[ERROR] Failed to load configuration file
[WARNING] Disk usage is high
[ERROR] Network timeout detected
[INFO] User login successful
[ERROR] Package installation failed
[WARNING] Low memory condition
[ERROR] Unable to connect to server
EOF
fi

# --- Retry until file has content (do-while style using until) ---
until [ -s "$LOGFILE" ]
do
    echo "The log file exists but is empty."
    read -p "Please add data to the log file, then press Enter to continue..."
done

# --- Count matching lines using while read ---
COUNT=0

while IFS= read -r LINE
do
    echo "$LINE" | grep -iq "$KEYWORD"
    if [ $? -eq 0 ]; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Display results ---
echo "========================================"
echo "        Log File Keyword Analyzer"
echo "========================================"
echo "Log File       : $LOGFILE"
echo "Keyword        : $KEYWORD"
echo "Total Matches  : $COUNT"
echo "----------------------------------------"
echo "Last Five Matching Lines:"

if [ "$COUNT" -gt 0 ]; then
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
else
    echo "No matching lines found."
fi

echo "========================================"
