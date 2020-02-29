#!/bin/bash
random=`< /dev/urandom tr -dc A-Za-z0-9 | fold -w 28 | head -n 1`
for name in $*
do
nama=`echo "$name" | tr -dc A-Za-z`
echo "$random" >> $nama.txt 
done
