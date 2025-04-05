#!/bin/bash

# Thresholds
CPU_THRESHOLD=70
MEM_THRESHOLD=70
DISK_THRESHOLD=80

# Get usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM_USAGE=$(free | grep Mem | awk '{printf("%.2f"), $3/$2 * 100}')
DISK_USAGE=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')

echo "CPU: $CPU_USAGE% | Memory: $MEM_USAGE% | Disk: $DISK_USAGE%"

# Logging
LOGFILE="system_monitor.log"
echo "$(date): CPU=$CPU_USAGE%, MEM=$MEM_USAGE%, DISK=$DISK_USAGE%" >> $LOGFILE

# Alerts
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "⚠️ High CPU usage: $CPU_USAGE%" | tee -a $LOGFILE
fi

if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
  echo "⚠️ High Memory usage: $MEM_USAGE%" | tee -a $LOGFILE
fi

if (( $DISK_USAGE > $DISK_THRESHOLD )); then
  echo "⚠️ High Disk usage: $DISK_USAGE%" | tee -a $LOGFILE
fi
