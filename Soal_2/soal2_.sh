#!/bin/bash
echo "Random Password"
random=`< /dev/urandom tr -dc A-Za-z0-9 | fold -w 28 | head -n 1`
read name
nama=`echo "$name" | tr -dc A-Za-z`
echo "$random" >> $nama.txt 

