#!/bin/bash
url=$1
path=$(echo $url | sed 's/\.//g')
host=$(hostname | sed 's/\.//g')

#ret=$(curl -o /dev/null -s -w %{time_total}-%{http_code}-%{size_download}\\n  http://forum.sevenstring.pl
ret=$(curl -o /dev/null -s -w %{time_total}\\n $url)
if [ $url ]
	then
	echo "$path.response-time.$host $ret $(date +%s)"
fi
