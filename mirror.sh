#!/usr/bin/env bash


# =====================================================
# Website Mirror Application
# =====================================================


set -e


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


source "$BASE_DIR/config.sh"


for FILE in \
colors.sh \
utils.sh \
validator.sh \
logger.sh \
downloader.sh \
zipper.sh \
summary.sh \
menu.sh

do

    source "$BASE_DIR/lib/$FILE"

done



if ! require_command wget; then

    error "wget is missing."
    echo "Install using:"
    echo "sudo apt install wget"

    exit 1

fi


if ! require_command curl; then

    error "curl is missing."
    echo "Install using:"
    echo "sudo apt install curl"

    exit 1

fi



clear

main_menu



echo

read -rp "Website URL: " URL


URL=$(validate_url "$URL")


echo


if ! check_url "$URL"; then
    exit 1
fi



DEFAULT_NAME=$(clean_name "$URL")


read -rp \
"Project name [$DEFAULT_NAME]: " PROJECT



PROJECT=${PROJECT:-$DEFAULT_NAME}


TARGET="$DOWNLOAD_DIR/$PROJECT"



if [[ -d "$TARGET" ]]; then

    warning "Folder already exists:"
    echo "$TARGET"

    read -rp "Continue and merge files? (y/N): " ANSWER


    if [[ ! "$ANSWER" =~ ^[Yy]$ ]]; then
        exit 0
    fi

fi



echo

info "URL:"
echo "$URL"

info "Destination:"
echo "$TARGET"


read -rp "Start download? (Y/n): " START


START=${START:-Y}



if [[ ! "$START" =~ ^[Yy]$ ]]; then
    exit 0
fi



START_TIME=$(date +%s)



if [[ "$ENABLE_LOG" == true ]]; then

    init_log

    log "Starting download"
    log "URL: $URL"

fi



TYPE=$(detect_type "$URL")



case "$MODE" in


site)

    download_site "$URL" "$TARGET"

    ;;


page)

    download_page "$URL" "$TARGET"

    ;;

esac



if [[ "$ENABLE_LOG" == true ]]; then

    log "Download completed"

fi



create_archive "$TARGET"



show_summary \
"$TARGET" \
"$START_TIME" \
"SUCCESS"