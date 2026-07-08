#!/usr/bin/env bash

# ==================================================
# Website Mirror Configuration
# ==================================================

APP_NAME="Website Mirror"

# Default download location
DOWNLOAD_ROOT="$HOME/Websites"

# Default wget settings
WAIT_TIME=2
MAX_RETRIES=3

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64)"

# Create zip after download
CREATE_ZIP=true

# Enable logs
ENABLE_LOG=true

# Default mode
DEFAULT_DEPTH=inf

# Log directory
LOG_DIR="./logs"

# Download directory
DOWNLOAD_DIR="./downloads"