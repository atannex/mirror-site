#!/usr/bin/env bash


timestamp()
{
    date +"%Y-%m-%d_%H-%M-%S"
}


clean_name()
{
    echo "$1" |
    sed 's#https\?://##' |
    sed 's#[^a-zA-Z0-9]#-#g' |
    sed 's/--*/-/g'
}


directory_size()
{
    du -sh "$1" 2>/dev/null | awk '{print $1}'
}


file_count()
{
    find "$1" -type f | wc -l
}


elapsed_time()
{
    local start=$1
    local end=$(date +%s)

    echo $((end-start))
}


require_command()
{
    command -v "$1" >/dev/null 2>&1
}