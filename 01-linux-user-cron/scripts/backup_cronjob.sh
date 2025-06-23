#!/bin/bash
# Backup script to archive /home/projects directory

SRC_DIR="/home/projects"
DEST_DIR="/var/backups/projects_$(date +%F).tar.gz"

tar -czf "$DEST_DIR" "$SRC_DIR"
echo "Backup completed: $DEST_DIR"

