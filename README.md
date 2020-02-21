# SoalShiftSISOP20_modul1_T15

## Kelompok T15
- <strong>Anggada Putera Nagamas    05311840000025 </strong>
- <strong>Muhammad Reza Aisyi       05311840000036 </strong>

## Pembahasan Soal 

### Soal 1 
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”. Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

***a.*** Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit

***b.*** Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a

***c.*** Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan laporan tersebut.

**Pembahasan soal 1**
File untuk penyelesaian soal ini ada disini : [Soal1](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/tree/master/Soal_1)\
kami menggabungkan penyelesaian soal 1a, 1b, 1c dalam satu program

untuk melakukan penyortiran kami menggunakan command `awk`
```#!/bin/bash

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
```

***Soal 1a*** 
* Pada baris pertama `awk -F "," '$13~/Central/{jumlah+=$NF}END{print "Central "jumlah}' Sample-Superstore.csv`, 


