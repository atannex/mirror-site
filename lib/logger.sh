#!/usr/bin/env bash


LOG_FILE=""


init_log()
{
    mkdir -p "$LOG_DIR"

    LOG_FILE="$LOG_DIR/download-$(timestamp).log"

    touch "$LOG_FILE"
}


log()
{
    echo "[$(date '+%F %T')] $1" | tee -a "$LOG_FILE"
}