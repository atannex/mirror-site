#!/usr/bin/env bash


show_summary()
{
    local TARGET="$1"
    local START="$2"
    local STATUS="$3"


    END=$(date +%s)

    TIME=$((END-START))


    echo
    echo "=============================================="
    echo "              DOWNLOAD SUMMARY"
    echo "=============================================="

    echo "Location : $TARGET"

    if [[ -d "$TARGET" ]]; then
        echo "Files    : $(file_count "$TARGET")"
        echo "Size     : $(directory_size "$TARGET")"
    fi

    echo "Time     : ${TIME}s"
    echo "Status   : $STATUS"

    echo "=============================================="
    echo
}