#!/bin/bash
jumlah_file=`ls | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ $jumlah_file =~ [:digit:] ]]
then
	$jumlah_file = 0
fi

x=`expr $jumlah_file + 1`
y=`expr $jumlah_file + 28`

for((i=x;i<=y;i++))
do
wget -a wget.log -O pdkt_kusuma_$i "https://loremflickr.com/320/240/cat"
done

grep "Location" wget.log >> location.log
