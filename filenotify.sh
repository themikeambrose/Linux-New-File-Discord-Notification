#!/bin/bash

# Set your Discord webhook URL here
WEBHOOK_URL="https://discord.com/api/webhooks/YOURWEBHOOK/URLHERE"

# Directory to monitor
MONITOR_DIR="/directory/to/monitor/"

# Function to send a notification to Discord
send_discord_notification() {
    message="$1"
    curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"$message\"}" "$WEBHOOK_URL"
}

# Monitor the directory for file changes
inotifywait -m -r -e create --format '%w%f' "$MONITOR_DIR" | while read -r new_file
do
    # Check if the file was recently added (modification time is the current date)
    if [ "$(date -r "$new_file" '+%Y-%m-%d')" == "$(date '+%Y-%m-%d')" ]; then
        # Send a Discord notification
        send_discord_notification "<@YOUR_DISCORD_USERID_NUMBERS> New file added: $new_file"
        # You can get your Discord user ID string by typing "\@Yourname" into your Discord channel
    fi
done
