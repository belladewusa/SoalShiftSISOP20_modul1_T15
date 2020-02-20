#!/bin/bash
jumlah_file=`ls | grep "pdkt_kusuma" | cut -d "_" -f 3 | sort -n | tail -1`

if [[ `ls | grep "kenangan"` != "kenangan" ]]
then 
	mkdir ./kenangan
fi

if [[ `ls | grep "duplicate"` != "duplicate" ]]
then
	mkdir ./duplicate
fi

for((i=1;i<=jumlah_file;i++)) 
do
	for((j=1;j<=jumlah_file;j++))
	do 
	gambar_i=`cksum pdkt_kusuma_$i pdkt_kusuma_$j | awk '{if(NR==1)print $1}'`
	echo $gambar_i 
	gambar_j=`cksum pdkt_kusuma_$i pdkt_kusuma_$j | awk '{if(NR==2)print $1}'`
	echo $gambar_j
	if [[ $i -ne $j && $gambar_i == $gambar_j ]]
	then
		mv pdkt_kusuma_$j ./duplicate/duplicate_$j > /dev/null 2>&1
	fi
	done 
done

for((a=1;a<=jumlah_file;a++))
do
mv pdkt_kusuma_$a ./kenangan/kenangan_$a > /dev/null 2>&1
done

cat wget.log >> wget.log.bak
rm wget.log
