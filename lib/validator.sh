#!/usr/bin/env bash


validate_url()
{
    local URL="$1"

    if [[ ! "$URL" =~ ^https?:// ]]; then
        echo "https://$URL"
    else
        echo "$URL"
    fi
}


check_url()
{
    local URL="$1"

    STATUS=$(curl -L -o /dev/null \
        -s \
        -w "%{http_code}" \
        "$URL")


    if [[ "$STATUS" != "200" ]]; then
        error "Website unavailable. HTTP Status: $STATUS"
        return 1
    fi

    return 0
}


detect_type()
{
    local URL="$1"

    if [[ "$URL" =~ \.(html?|php)$ ]]; then
        echo "page"
    else
        echo "site"
    fi
}