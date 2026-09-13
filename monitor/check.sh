#!/bin/sh
while true
do
    if curl -sf http://web_app:8000/health > /dev/null
    then
        echo "$(date): web app is UP" >> /logs/monitor.log
    else
        echo "$(date): web app is DOWN" >> /logs/monitor.log
    fi
    sleep 10
done
