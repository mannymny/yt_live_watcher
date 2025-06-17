#!/bin/bash

# Config
install_yt_dlp() {
    echo "🔧 yt-dlp not found. Installing..."
    if command -v brew &> /dev/null; then
        brew install yt-dlp
    else
        curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
        chmod a+rx /usr/local/bin/yt-dlp
    fi
}

if ! command -v yt-dlp &> /dev/null; then
    install_yt_dlp
fi

read -p "📺 Enter YouTube video URL: " INPUT_URL
read -p "⏰ Enter wait time in seconds between retries: " SLEEP_TIME

VIDEO_URL=$(echo "$INPUT_URL" | sed -E 's/[?&]t=[0-9]+s?//g')

OUTPUT_DIR="$HOME/Downloads"
LOG_FILE="$OUTPUT_DIR/youtube_live_download_log.txt"
ATTEMPT=1

mkdir -p "$OUTPUT_DIR"
cd "$OUTPUT_DIR" || exit 1

echo "📺 Waiting for the live stream to finish: $VIDEO_URL"
echo "⏰ Started at $(date)" >> "$LOG_FILE"

# === Watch live ===
while true; do
    echo "🔁 Attempt #$ATTEMPT - $(date)" >> "$LOG_FILE"

    yt-dlp "$VIDEO_URL" >> "$LOG_FILE" 2>&1 && break

    echo "⏳ Not ready yet. Retrying in $SLEEP_TIME seconds..." >> "$LOG_FILE"
    sleep "$SLEEP_TIME"
    ((ATTEMPT++))
done

echo "✅ Download completed at $(date)" >> "$LOG_FILE"
