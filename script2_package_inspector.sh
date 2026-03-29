#!/bin/bash
# Script 2: Package Inspector
# Author: Shubhankan Kumar
# Purpose: Check if a chosen package is installed and display package details

# --- Package selection ---
PACKAGE="git"

# --- Check whether package is installed ---
if dpkg -l | grep -qw "$PACKAGE"; then
    STATUS="Installed"
else
    STATUS="Not Installed"
fi

# --- Display package report ---
echo "========================================"
echo "         Package Inspector"
echo "========================================"
echo "Package Name : $PACKAGE"
echo "Status       : $STATUS"
echo "----------------------------------------"

# --- Show package details if installed ---
if [ "$STATUS" = "Installed" ]; then
    echo "Package Details:"
    dpkg -s "$PACKAGE" | grep -E '^(Package|Status|Version|Section|Architecture|Description):'
else
    echo "Package details are unavailable because the package is not installed."
fi

echo "----------------------------------------"

# --- Categorize the package using case ---
case "$PACKAGE" in
    git)
        echo "Category Note: Git is a version control and developer tool."
        ;;
    firefox)
        echo "Category Note: Firefox is a web browser."
        ;;
    vlc)
        echo "Category Note: VLC is a media player."
        ;;
    gimp)
        echo "Category Note: GIMP is an image editing tool."
        ;;
    libreoffice)
        echo "Category Note: LibreOffice is an office productivity suite."
        ;;
    *)
        echo "Category Note: This package belongs to a general open-source software category."
        ;;
esac

echo "========================================"