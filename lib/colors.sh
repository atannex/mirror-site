#!/usr/bin/env bash

BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"

BOLD="\033[1m"
RESET="\033[0m"


success()
{
    echo -e "${GREEN}$1${RESET}"
}

error()
{
    echo -e "${RED}$1${RESET}"
}

warning()
{
    echo -e "${YELLOW}$1${RESET}"
}

info()
{
    echo -e "${BLUE}$1${RESET}"
}