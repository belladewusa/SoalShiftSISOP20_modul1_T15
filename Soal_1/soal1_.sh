#!/bin/bash

awk -F "," '$13~/Central/{jumlah+=$NF}END{print "Central "jumlah}' Sample-Superstore.csv
awk -F "," '$13~/South/{jumlah+=$NF}END{print "South "jumlah}' Sample-Superstore.csv
awk -F "," '$13~/East/{jumlah+=$NF}END{print "East "jumlah}' Sample-Superstore.csv
awk -F "," '$13~/West/{jumlah+=$NF}END{print "West "jumlah}' Sample-Superstore.csv
echo "============================================================="
awk -F "," '$13~/Central/{state[$11]+=$NF}END{for(negara in state)print negara, state[negara]}' Sample-Superstore.csv | sort -nk2 
echo "============================================================="
echo "10 Produk dengan profit paling sedikit dari state Texas: "
awk -F "," '$11~/Texas/{product[$17]+=$NF}END{for(name in product)print product[name], name}' Sample-Superstore.csv | sort -g | head -10
echo "============================================================="
echo "10 Produk dengan profit paling sedikit dari state Illinois: "
awk -F "," '$11~/Illinois/{product[$17]+=$NF}END{for(name in product)print product[name], name}' Sample-Superstore.csv | sort -g | head -10

#awk -F "," '$11~/Illinois/{product[$17]+=$NF}END{for(name in product)print product[name]}' Sample-Superstore.csv | sort -g | head -10


#awk 'BEGIN {min = 0} {if ($NF<min && $NF!= "<") min=$NF} END {print min}' Sample-Superstore.csv

#awk -v x=3 '{a[NR]=$0; b[NR]=$2}END{ PROCINFO["sorted_in"]="@val_num_asc"; for (i in a) if (x-->0) print b[i] }' Sample-Superstore.csv
