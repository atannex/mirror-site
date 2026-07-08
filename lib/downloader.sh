#!/usr/bin/env bash


download_site()
{
    local URL="$1"
    local TARGET="$2"


    mkdir -p "$TARGET"


    wget \
        --mirror \
        --convert-links \
        --adjust-extension \
        --page-requisites \
        --no-parent \
        --continue \
        --wait="$WAIT_TIME" \
        --random-wait \
        --tries="$MAX_RETRIES" \
        --restrict-file-names=windows \
        --user-agent="$USER_AGENT" \
        --directory-prefix="$TARGET" \
        "$URL"
}



download_page()
{
    local URL="$1"
    local TARGET="$2"


    mkdir -p "$TARGET"


    wget \
        --page-requisites \
        --convert-links \
        --adjust-extension \
        --span-hosts \
        --continue \
        --wait="$WAIT_TIME" \
        --random-wait \
        --user-agent="$USER_AGENT" \
        --directory-prefix="$TARGET" \
        "$URL"
}