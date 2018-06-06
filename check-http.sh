#!/bin/bash

url=$1
[ -z $url ] && echo "Usage: $0 [url]" && exit 4

rc_code=$(curl -L -s -w "%{http_code}\n" -o /dev/null $url)

if [ $rc_code == "200" ]; then
        echo "CheckHttp OK: $rc_code"
    else 
        echo "CheckHttp CRITICAL: $rc_code"
        exit 2 
fi
