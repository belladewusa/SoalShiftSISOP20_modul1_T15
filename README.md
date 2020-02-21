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
* Pertama kita melakukan penyortiran menggunakan sytanx `awk -F "," '$13~/Central/{jumlah+=$NF}END{print "Central "jumlah}' Sample-Superstore.csv`, syntax berfungsi melakukan penyortiran di kolom `$13` semua yang mengandung kata `Central`, kemudian `{jumlah+=$NF}END{print "Central "jumlah` berfungsi menambahkan `jumlah` disemua baris Central dengan file dibaris terakhir dan akan terus bertambah sampai selesai. lalu akan mencetak Central dan hasil dari `jumlah` akhir.
* Berikutnya `awk -F "," '$13~/South/{jumlah+=$NF}END{print "South "jumlah}' Sample-Superstore.csv`, syntax berfungsi melakukan penyortiran di kolom `$13` semua yang mengandung kata `South`, kemudian `{jumlah+=$NF}END{print "South "jumlah` berfungsi menambahkan `jumlah` disemua baris South dengan file dibaris terakhir dan akan terus bertambah sampai selesai. lalu akan mencetak South dan hasil dari `jumlah` akhir.
* Setelah itu pada bagian `awk -F "," '$13~/East/{jumlah+=$NF}END{print "East "jumlah}' Sample-Superstore.csv`, syntax berfungsi melakukan penyortiran di kolom `$13` semua yang mengandung kata `East`, kemudian `{jumlah+=$NF}END{print "East "jumlah` berfungsi menambahkan `jumlah` disemua baris East dengan file dibaris terakhir dan akan terus bertambah sampai selesai. lalu akan mencetak East dan hasil dari `jumlah` akhir.
* Kemudian `awk -F "," '$13~/West/{jumlah+=$NF}END{print "West "jumlah}' Sample-Superstore.csv`. syntax berfungsi melakukan penyortiran di kolom `$13` semua yang mengandung kata `West`, kemudian `{jumlah+=$NF}END{print "West "jumlah` berfungsi menambahkan `jumlah` disemua baris West dengan file dibaris terakhir dan akan terus bertambah sampai selesai. lalu akan mencetak West dan hasil dari `jumlah` akhir.

***Soal 1b***
* untuk menampilkan 2 negara bagian yang memiliki keuntungan (profit) yang paling sedikit dari syntax sebelumnya bisa menggunakan syntax berikut.\
`awk -F "," '$13~/Central/{state[$11]+=$NF}END{for(negara in state)print negara, state[negara]}' Sample-Superstore.csv | sort -nk2 `
pada bagian ini kita akan melakukan sortir pada kolom `$13` dengan Semua baris Central sama seperti penyelesaian pada 1a,semua baris yang ada Central dan setiap state yang ada dibaris tersebut dimasukkan kedalam variabel array state. Kemudian dicetak dan disortir menggunakan `sort -nk2` dengan tujuan menyortir integer value di kolom 2


***Soal 1c***
untuk menampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b, menggunakan syntax

```
echo "10 Produk dengan profit paling sedikit dari state Texas: "
awk -F "," '$11~/Texas/{product[$17]+=$NF}END{for(name in product)print product[name], name}' Sample-Superstore.csv | sort -g | head -10
echo "============================================================="
echo "10 Produk dengan profit paling sedikit dari state Illinois: "
awk -F "," '$11~/Illinois/{product[$17]+=$NF}END{for(name in product)print product[name], name}' Sample-Superstore.csv | sort -g | head -10
```
* Syntax pada bagian ini `awk -F "," '$11~/Texas/{product[$17]+=$NF}END{for(name in product)print product[name], name}' Sample-Superstore.csv | sort -g | head -10` berfungsi untuk menyortir kolom `$11` dan semua yang memiliki value `Texas`. Kemudian kita membuat array produc sebanyak kolom`$17`. Didalam array product terdapat nama nama produk, yang kemudian di tampilkan 10 baris pertama menggunakan `head -10`
* Kemudian untuk 10 Produk dengan profit paling sedikit dari state Illinois menggunakan syntax `awk -F "," '$11~/Illinois/{product[$17]+=$NF}END{for(name in product)print product[name], name}' Sample-Superstore.csv | sort -g | head -10`. fungsi yang sama seperti sebelumnya, pada kolom `$11` dan semua yang memiliki value Illinois, kemudian semua dimasukkan kedalam variabel array product, lalu di sort dengan `sort -g` dan `head -10`.

**Screen Shoot**\
**Contoh Output:**\
![Running nomor 1](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/blob/master/ss/nomor1.png)


