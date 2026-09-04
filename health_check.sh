cat << 'EOF' > health_check.sh
#!/bin/bash

TARGET="https://google.com"
TIME=$(date +"%Y-%m-%d %H:%M:%S")
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $TARGET)

if [ "$HTTP_CODE" -eq 200]; then
    echo "{\time\": \"$TIME\", \"target\": \"$TARGET\", \"status\": \"INFO\", \"message\": \"Network UP\"}" >> /home/devops/Downloads/network-monitor/app.json.log
else
    echo "{\"time\": \"$TIME\", \"target\": \"$TARGET\", \"status\": \"ERROR\", \"message\": \"Network DOWN\"}" >> /home/devops/DOwnloads/network-monitor/app.json.log
fi 
EOF
