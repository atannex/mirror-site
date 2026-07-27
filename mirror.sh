#!/usr/bin/env bash

set -e


# =====================================================
# ATANNEX Website Mirror Application
# Enterprise Website Migration & Backup Engine
# =====================================================


clear


echo "
 █████╗ ████████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██╗  ██╗
██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║████╗  ██║██╔════╝╚██╗██╔╝
███████║   ██║   ███████║██╔██╗ ██║██╔██╗ ██║█████╗   ╚███╔╝ 
██╔══██║   ██║   ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝   ██╔██╗ 
██║  ██║   ██║   ██║  ██║██║ ╚████║██║ ╚████║███████╗██╔╝ ██╗
╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝


        🚀 ATANNEX
        Website Mirror Application v1.0

        Enterprise Website Migration
        Backup & Archiving Engine
"


echo


# =====================================================
# Application Paths
# =====================================================

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# =====================================================
# Load Configuration
# =====================================================

if [[ ! -f "$BASE_DIR/config.sh" ]]; then
    echo "ERROR: Missing config.sh"
    exit 1
fi


source "$BASE_DIR/config.sh"



# =====================================================
# Load Application Modules
# =====================================================

LIBRARIES=(
    colors.sh
    utils.sh
    validator.sh
    logger.sh
    downloader.sh
    zipper.sh
    summary.sh
    menu.sh
)


for FILE in "${LIBRARIES[@]}"
do

    LIB_PATH="$BASE_DIR/lib/$FILE"

    if [[ ! -f "$LIB_PATH" ]]; then
        echo "ERROR: Missing library: $FILE"
        exit 1
    fi

    source "$LIB_PATH"

done



# =====================================================
# Dependency Validation
# =====================================================

DEPENDENCIES=(
    wget
    curl
)


for CMD in "${DEPENDENCIES[@]}"
do

    if ! require_command "$CMD"; then

        error "$CMD is missing."

        echo
        echo "Install using:"
        echo

        echo "sudo apt install $CMD"

        exit 1

    fi

done



# =====================================================
# Application Menu
# =====================================================


main_menu



echo


# =====================================================
# Website Input
# =====================================================


read -rp "Website URL: " URL


URL=$(validate_url "$URL")


echo


if ! check_url "$URL"; then
    exit 1
fi



# =====================================================
# Project Setup
# =====================================================


DEFAULT_NAME=$(clean_name "$URL")


read -rp "Project name [$DEFAULT_NAME]: " PROJECT


PROJECT=${PROJECT:-$DEFAULT_NAME}


TARGET="$DOWNLOAD_DIR/$PROJECT"



if [[ -d "$TARGET" ]]; then

    warning "Destination already exists:"
    echo "$TARGET"

    read -rp "Continue and merge files? (y/N): " ANSWER


    if [[ ! "$ANSWER" =~ ^[Yy]$ ]]; then
        exit 0
    fi

fi



# =====================================================
# Confirmation
# =====================================================


echo

info "Website:"
echo "$URL"


info "Destination:"
echo "$TARGET"



read -rp "Start mirror process? (Y/n): " START


START=${START:-Y}



if [[ ! "$START" =~ ^[Yy]$ ]]; then
    exit 0
fi



# =====================================================
# Start Process
# =====================================================


START_TIME=$(date +%s)



if [[ "$ENABLE_LOG" == true ]]; then

    init_log

    log "ATANNEX mirror started"
    log "Website: $URL"

fi



# =====================================================
# Download Engine
# =====================================================


TYPE=$(detect_type "$URL")



case "$MODE" in

    site)

        download_site "$URL" "$TARGET"

    ;;


    page)

        download_page "$URL" "$TARGET"

    ;;


    *)

        error "Unknown mode: $MODE"
        exit 1

    ;;

esac



# =====================================================
# Completion
# =====================================================


if [[ "$ENABLE_LOG" == true ]]; then

    log "Mirror completed successfully"

fi



create_archive "$TARGET"



show_summary \
"$TARGET" \
"$START_TIME" \
"SUCCESS"