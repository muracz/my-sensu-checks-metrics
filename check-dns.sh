#!/bin/bash

while getopts ":t:d:r:" opt; do case $opt in
    t) type="$OPTARG"
        ;;
    d) domain="$OPTARG"
        ;;
    r) result="$OPTARG"
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        exit 1
        ;;
    \?) echo "Invalid option -$OPTARG" >&2
        ;;
    esac
done


if [[ $(dig +short $domain $type | grep -i $result) ]]; then 
    echo "CheckDNS OK: $domain - record $type" 
else 
    out="$(dig +short $domain $type| sed ':a;N;$!ba;s/\n/;/g')"
    echo "CheckDNS Critical: $domain - $out"
    exit 2
fi

