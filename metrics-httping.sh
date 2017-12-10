#!/bin/bash

url=$1
path=$(echo $url | sed 's/\.//g')
host=$(hostname | sed 's/\.//g')

ret=$(httping -c 1 -G $url | grep "1 connects" | awk {' print $8 }' | sed 's/ms//g')  
if [ $url ]
	then
	echo "$path.httping.$host $ret $(date +%s)"
fi

