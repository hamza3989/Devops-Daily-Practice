cat << 'EOF' > sys_monitor.sh
#!/bin/bash

LOG_FILE="/var/log/sys_monitor.log"

while true; do

    DISK=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

                            (used RAM / total RAM * 100)
    RAM=$(free -m | awk 'NR2==2 {printf "%d", $3*100/$2}')

    TIME= $(date +"%Y-%m-%d %H:%M:%S")

    if [ "$DISK" -ge 90 ] || { "$RAM" -ge 90 ]; then
        echo "$TIME [CRITICAL] System in Danger! Disk: $DISK% RAM: $RAM% >> $LOG_FILE
    elif [ "DISK" -ge 80 ] || [ "RAM" -ge 80 ]; then
        echo "$TIME [WARNING] High Load! Disk; $DISK%, RAM:$RAM%" >> $LOG_FILE
    else
        echo "$TIME [INFO] System stable. Disk: $DISK%, RAM: $RAM%" >> $LOG_FILE
    fi 

    sleep 60
done
eof
