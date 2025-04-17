#!/bin/bash

# Default download path
BASE_DOWNLOAD_DIR="/mnt/hdd1/downloads"

# Check if DepotDownloader is installed
if ! command -v depotdownloader &> /dev/null; then
    echo "❌ DepotDownloader not found. Make sure it's installed and in your PATH."
    exit 1
fi

echo "📥 === Interactive DepotDownloader Wrapper ==="

# Get Steam credentials
read -p "🧑 Enter your Steam username: " USERNAME
read -s -p "🔑 Enter your Steam password: " PASSWORD
echo ""

# Get AppID
read -p "🎮 Enter the AppID: " APPID

# Choose download type
echo "📦 What do you want to download?"
echo "1) Regular depot"
echo "2) Workshop item (pubfile)"
echo "3) Workshop item (UGC)"
read -p "Select type (1/2/3): " CHOICE

DEPOT=""
MANIFEST=""
PUBFILE=""
UGC=""

case $CHOICE in
    1)
        read -p "📦 Enter the DepotID: " DEPOT
        read -p "🧾 Enter the Manifest ID (leave empty for latest): " MANIFEST
        ;;
    2)
        read -p "🗂 Enter the PublishedFileId (pubfile): " PUBFILE
        ;;
    3)
        read -p "🗂 Enter the UGC ID: " UGC
        ;;
    *)
        echo "❌ Invalid choice."
        exit 1
        ;;
esac

# Create subfolder for this AppID
DOWNLOAD_DIR="$BASE_DOWNLOAD_DIR/$APPID"
mkdir -p "$DOWNLOAD_DIR"

# Build the command
CMD="depotdownloader -username \"$USERNAME\" -password \"$PASSWORD\" -app $APPID"

if [[ -n "$DEPOT" ]]; then
    CMD+=" -depot $DEPOT"
    if [[ -n "$MANIFEST" ]]; then
        CMD+=" -manifest $MANIFEST"
    fi
elif [[ -n "$PUBFILE" ]]; then
    CMD+=" -pubfile $PUBFILE"
elif [[ -n "$UGC" ]]; then
    CMD+=" -ugc $UGC"
fi

CMD+=" -dir \"$DOWNLOAD_DIR\""

# Logging
LOGFILE="$HOME/depotdownloader_last.log"
echo "🚀 Running command:"
echo "$CMD"
echo "$CMD" > "$LOGFILE"

# Execute the command
eval $CMD
