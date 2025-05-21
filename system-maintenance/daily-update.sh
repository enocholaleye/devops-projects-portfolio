#!/bin/bash

# ================================
# Script: daily-update.sh
# Description: Updates and upgrades system packages
# Author: Enoch (Customized by enocholaleye.github.io)
# ================================

# Log file path
LOGFILE="/var/log/daily-update.log"

# Timestamp
echo "=== $(date '+%Y-%m-%d %H:%M:%S') ===" | tee -a "$LOGFILE"

# Update package list
echo "[+] Updating package list..." | tee -a "$LOGFILE"
sudo apt update | tee -a "$LOGFILE"

# Upgrade installed packages
echo "[+] Upgrading packages..." | tee -a "$LOGFILE"
sudo apt upgrade -y | tee -a "$LOGFILE"

# Full distribution upgrade (includes kernel and system packages)
echo "[+] Running full upgrade..." | tee -a "$LOGFILE"
sudo apt full-upgrade -y | tee -a "$LOGFILE"

# Remove unused packages
echo "[+] Removing unused packages..." | tee -a "$LOGFILE"
sudo apt autoremove -y | tee -a "$LOGFILE"

# Clean up cached files
echo "[+] Cleaning up..." | tee -a "$LOGFILE"
sudo apt autoclean | tee -a "$LOGFILE"

# Final message
echo "[✔] System update complete!" | tee -a "$LOGFILE"
echo "==========================================" | tee -a "$LOGFILE"
