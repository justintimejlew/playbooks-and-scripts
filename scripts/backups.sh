#!/bin/bash
# Creates a backup of the directory and destination
# Example: Run script as the following "./backup.sh /var/www /backups"

SOURCE=$1
DEST=$2

# Check for arguments
if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
    echo "Usage: $0 [SOURCE_DIR] [DEST_DIR]"
    exit 1
fi

# Validate source directory
if [ ! -d "$SOURCE" ]; then
    echo "Error: Source '$SOURCE' not found."
    exit 1
fi

# Create destination and backup
mkdir -p "$DEST"
FILENAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

if tar -czf "$DEST/$FILENAME" "$SOURCE" 2>/dev/null; then
    echo "Backup created: $DEST/$FILENAME"
    
    # Cleanup: Remove backups older than 7 days
    find "$DEST" -name "backup_*.tar.gz" -type f -mtime +7 -delete
    echo "Old backups cleaned up."
else
    echo "Backup failed."
    exit 1
fi