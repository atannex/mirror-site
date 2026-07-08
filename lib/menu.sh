#!/usr/bin/env bash


main_menu()
{
    echo
    echo "=============================================="
    echo "            WEBSITE MIRROR TOOL"
    echo "=============================================="

    echo
    echo "1) Mirror entire website"
    echo "2) Download single page"
    echo "3) Exit"
    echo

    read -rp "Choose option: " OPTION


    case "$OPTION" in

        1)
            MODE="site"
            ;;

        2)
            MODE="page"
            ;;

        3)
            exit 0
            ;;

        *)
            error "Invalid option"
            main_menu
            ;;
    esac
}