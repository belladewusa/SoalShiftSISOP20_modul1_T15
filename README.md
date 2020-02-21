# SoalShiftSISOP20_modul1_T15

## Kelompok T15
- <strong>Anggada Putra Nagamas    05311840000025 </strong>
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
![Running nomor 1](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/blob/master/ss/nomor1.png)

### Soal 2
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian\
***a.*** membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka.\

***b.*** Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan **HANYA berupa alphabet.**\

***c***  Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan dienkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) 
***d*** jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

**Pembahasan soal 2**
File untuk penyelesaian soal ini ada disini : [Soal2](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/tree/master/Soal_2)\

***2ab*** kami menggabungkan penyelesaian untuk soal 2a dan 2b. Untuk membuat password random sebanyak 28 karakter, kami menggunakan syntax sebagai berikut
```
#!/bin/bash
random=`< /dev/urandom tr -dc A-Za-z0-9 | fold -w 28 | head -n 1`
echo "Input nama file"
read name
nama=`echo "$name" | tr -dc A-Za-z`
echo "$random" >> $nama.txt 
```

* pertama kita menggunakan ``` random=`< /dev/urandom tr -dc A-Za-z0-9 | fold -w 28 | head -n 1` ``` untuk melakukan randomisasi karakter dan angka secara terus-menerus. `tr -dc A-Za-z0-9` berfungsi untuk menghapus inputan selain `A-Za-z0-9`.
* `fold -w 28` berfungsi untuk memberikan bari baru setelah 28 karakter
* `head -n 1` digunakan untuk mengambil baris pertama dari 28 karakter yang dibuat per baris sebelumnya, kemudian dimasukkan nilainya ke variabel `random`
* kemudian kita inputkan nama file txt yang ingin kita buat, yang nanti akan dimasukkan 28 karakter random dari variabel `random` tadi dengan syarat inputan `tr -dc A-Za-z` yang artinya hanya alphabet

**Screen Shoot**
![Running nomor 2a](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/blob/master/ss/soal1a.PNG)
Running bash
![Running nomor 2Aa](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/blob/master/ss/soal1a_2.PNG)
Output

***2c*** untuk melakukan enkripsi pada nama file .txt kami mengggunakan syntax berikut.
```
#!/bin/bash

for judul in $*
do
judul_1=`basename $judul .txt`

status=`ls -i $judul | awk '{print $1}'`
crtime=`sudo debugfs -R 'stat <'"$status"'>' /dev/sda8 | awk '{if(NR==10)print $7}' | tr -d ':'`
hour=`expr $crtime / 10000`

judul_baru=`echo  $judul_1 | caesar $hour`
mv $judul $judul_baru.txt
done
```

* Input judul file yang telah dibuat, kemudian buat variabel judul_1 untuk mengambil nama file tanpa ekstensi file. 
* Kemudian buat variabel status untuk mendapatkan indeks number dari setiap file. Kemudian gunakan `debugfs` untuk melihat creation time dari file tersebut. Gunakan `sudo` agar mendapat hak akses untuk melihat creation time file tersebut. Untuk melihat partisi sistem maka gunakan command `df -h` . 
* Setelah itu gunakan command awk untuk mendapatkan waktu dengan format hh:mm:ss (jam:menit:sekon), kemudian gunakan `tr -d` untuk menghilangkan karakter ':' dari waktu yang telah diperoleh. 
* Output dari variabel `crtime` berupa hhmmss (jammenitsekon) berjumlah 6 digit. Untuk mendapatkan nilai variabel `crtime` dengan format hh (jam) saja maka variabel crtime tersebut dibagi dengan 10000 agar nilai yang tersisa hanya 2 digit terdepan saja (maka variabel hour diperoleh).
* Setelah itu buat variabel judul_baru untuk melakukan enkripsi terhadap variabel judul_1 (basename variabel judul) dengan menggunakan command `caesar` atau `rot13` dengan argumen variabel hour. Lalu ubah judul file lama (variabel judul) menjadi judul baru (variabel judul_baru) dengan command `mv $judul $judul_baru.txt`. 
* Jangan lupa untuk menambahkan .txt saat akan mengubah nama file.

**Screen Shoot**
![Running nomor 2a](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/blob/master/ss/soal1a.PNG)
Running bash



***2d***  dekripsi untuk nama file txt bisa menggunakan syntax ini
```
#!/bin/bash

for judul in $*
do
judul_1=`basename $judul .txt`

status=`ls -i $judul | awk '{print $1}'`
crtime=`sudo debugfs -R 'stat <'"$status"'>' /dev/sda8 | awk '{if(NR==10)print $7}' | tr -d ':'`
hour=`expr $crtime / 10000`
create_new_time=`expr 26 - $hour`

judul_baru=`echo  $judul_1 |caesar $create_new_time`
mv $judul $judul_baru.txt
done
```

* Sama dengan soal nomor 2.c akan tetapi ada variabel baru yang digunakan yaitu `create_new_time` yang berfungsi sebagai argumen yang akan digunakan pada command caesar. 
* Variabel `create_new_time` tersebut berisi `expr 26 - $hour` yang bernilai sisa dari pengurangan alpabet (26 karakter alpabet) dengan creation time yang telah ditemukan (jam). 
* Hasil dari variabel tersebut akan digunakan untuk mendekripsi kembali file yang telah dienkripsi. Karena jumlah karakter alpabet ada sebanyak 26 maka ketika variabel  `create_new_time` digunakan sebagai argumen command `caesar` maka akan sama dengan mengenkripsi suatu file kembali ke awal (total pertambahan indeks huruf sebanyak 26 - $hour + $hour atau kembali seperti semula) 



### Soal 3 
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma,
kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing

***a*** Maka dari
itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan

***b*** setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi.

***c*** Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate
dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".

**Pembahasan soal 3**
File untuk penyelesaian soal ini ada disini : [Soal3](https://github.com/anggadaputra11319/SoalShiftSISOP20_modul1_T15/tree/master/Soal_3)
***a.*** Untuk menyelesaikan case ini kami menggunakan syntax ini
```
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
```
buat untuk mencari jumlah file yang telah ada dengan melakukan grep pada file name "pdkt_kusuma" yang ada di list (ls) kemudian delimiter "_" dihilangkan dan hanya mencetak nilai yang ada pada field ke-3. Setelah dilakukan cut maka akan didapatkan value berupa angka yang sebelum di cut berada pada field ke3 pada nama file. Hasil yang berupa angka tersebut disortir dari terkecil hingga terbesar dan kemudian dicetak (output) hasil terakhirnya saja (tail -1). Hasil dari sortir tersebut menunjukkan jumlah file pdkt_kusuma_nomor yang telah ada atau telah didownload sebelumnya

* Pada bagian
```
if [[ $jumlah_file =~ [:digit:] ]]
then
	$jumlah_file = 0
fi
```
setelah didapatkan nilai dari variabel jumlah_file maka akan dicek apakah variabel jumlah file tersebut memenuhi syarat if..else. Jika variabel jumlah_file tidak mengandung digit maka variabel jumlah_file tersebut bernilai 0.

*Pada bagian

```
x=`expr $jumlah_file + 1`
y=`expr $jumlah_file + 28`

for((i=x;i<=y;i++))
do
wget -a wget.log -O pdkt_kusuma_$i "https://loremflickr.com/320/240/cat"
done
```
dibuat variabel x dan y dengan menambahkan nilai 1 pada variabel x dan menambahkan nilai 28 pada variabel y. Artinya yaitu ketika file pdkt_kusuma_nomor teridentifikasi maka jumlah file pdkt_kusuma_nomor tersebut akan ditambah 1 hingga 28 (jika latest file pdkt_kusuma_28 maka file yang akan didownload berikutnya yaitu pdkt_kusuma_29 hingga pdkt_kusuma_56).

*Pada bagian
`grep "Location" wget.log >> location.log`
dicetak semua baris yang mengandung kata Location pada file wget.log kemudian output dari grep "Location" tersebut ditambahkan ke file location.log jika file belum ada maka file location.log akan dibuat.

***b.*** code crontab yang digunakan yaitu:
`5 6/8 * * 0-5 /bin/bash /home/<user>/file_name.sh`

*file file_name.sh akan dijalankan pada jam 6:05 setiap 8 jam sekali dari hari minggu hingga hari jumat. Karena crontab hanya dapat melakukan kegiatan atau perintah absolut maka digunakan `/bin/bash` untuk menjalankan `file file_name.sh `

***c.*** syintax yang digunakan 
```
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

```
* Dengan variabel jumlah_file maka akan diperoleh jumlah file `pdkt_kusuma_nomor` yang ada pada directory saat ini. 
* Kemudian dengan `grep "kenangan"` maka akan diperiksa apakah directory ` ./kenangan` sudah dibeuat atau tidak. Jika tidak ada nama file "kenangan" maka akan dibentuk directory ./kenangan. Begitu juga dengan directory ./duplicate.
* Kemudian dengan nested loop maka byte size setiap file akan diperiksa satu per satu. jika nomor dari file yang dicek berbeda dan nilai byte sizenya sama (terdeteksi identik) maka gambar dengan nama ` pdkt_kusuma_nomor ` akan dipindahkan ke directory ./duplicate dan diganti namanya menjadi duplicate_nomor.
Setelah file yang identik dipindahkan maka sisa dari file gambar tersebut akan dipindahkan ke directory ./kenangan dan diganti namanya menjadi kenangan_nomor.

* Pada bagian
```
cat wget.log >> wget.log.bak
rm wget.log
```
akan dipindahkan isi dari file `wget.log` ke file `wget.log.bak` dan kemudian file `wget.log` akan dihapus.








