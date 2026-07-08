#!/usr/bin/env bash

create_archive()
{
    local SOURCE="$1"

    if [[ "$CREATE_ZIP" != true ]]; then
        return
    fi

    local NAME
    NAME=$(basename "$SOURCE")

    info "Creating archive..."

    zip -r "${NAME}.zip" "$SOURCE" >/dev/null

    if [[ $? -eq 0 ]]; then
        success "Archive created: ${NAME}.zip"
    else
        error "Failed to create archive."
    fi
}