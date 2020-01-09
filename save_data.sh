#!/bin/sh
host="my_room" # To use as a filter on influxDB

# Obtain sensor data
script="BME280.py"
script_path=$(dirname $(readlink -f $0))
res=`/usr/bin/python ${script_path}/${script}`
temp=`echo ${res} | /usr/bin/awk '{print $1}'`
presure=`echo ${res} | /usr/bin/awk '{print $2}'`
humidity=`echo ${res} | /usr/bin/awk '{print $3}'`
time=`/bin/date +%s`
time=$time"000000000"

# Check if is the data colected is a valid number
case $temp in
	''|*[!0-9.]*) return ;;
	*)
		echo "temp_c,host=${host} value=${temp} ${time}" >> ${script_path}/tempFile
		echo "presure,host=${host} value=${presure} ${time}" >> ${script_path}/tempFile
		echo "humidity,host=${host} value=${humidity} ${time}" >> ${script_path}/tempFile
	;;
esac
