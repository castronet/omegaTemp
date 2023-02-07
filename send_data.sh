#!/bin/sh

# Fill the variables
url="http://your_influx_url:8086/write?db=Your_InfluxDB"
login=""
pass=""

#script_path=$(dirname $(readlink -f $0))
tempFile="/tmp/tmp/tempFile"

# Send the data to influxdb
res=`/usr/bin/curl -sw '%{http_code}' -u ${login}:${pass} -XPOST "${url}" --data-binary @${tempFile}`

# If the data is sent, the script save the file as compressed file until next success sending
if [ "x$res" == "x204" ]; then
 /usr/bin/bzip2 -f ${tempFile}
fi
