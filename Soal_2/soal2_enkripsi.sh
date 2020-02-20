#!/bin/bash

for judul in $*
do
judul_1=`basename $judul .txt`

status=`ls -i $judul | awk '{print $1}'`
crtime=`sudo debugfs -R 'stat <'"$status"'>' /dev/sda8 | awk '{if(NR==10)print $7}' | tr -d ':'`
hour=`expr $crtime / 10000`

judul_baru=`echo  $judul_1 |caesar $hour`
mv $judul $judul_baru.txt
done
