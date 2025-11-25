#!/bin/bash

FILE="/c/Users/JD/computers.txt"
LOG="/c/Users/JD/ping_results.txt"

> "$LOG"

while IFS= read -r computer; do
    echo "Pinging $computer ..."
    if ping -c 2 "$computer" &>/dev/null; then
        echo "$(date): $computer is online" >> "$LOG"
    else
        echo "$(date): $computer is offline" >> "$LOG"
    fi
done < "$FILE"

echo "Ping test completed. See $LOG"
