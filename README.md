# soalshift_modul1_a07

<h3>1. Zip terenkripsi</h3> <br>
   Permasalahan : Diberikan sebuah file.zip yang harus di unzip kemudian di decrypt base64 <br>
<br>Solusi : 
   1. Mengunzip file dan melakukan decrypt pada file-file yang terdapat didalam file.zip.
  (optional : membuat sebuah directory baru)
   2. mengatur crontab agar menjalankan task pada 14:14 14-2-yyyy atau setiap jum'at di bulan februari.
   <pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> unzip -q nature.zip -d ../Tugas_SISOP  
 mkdir nature/nature  
 i=0  
 for image in "nature"/*;   
 do  
      i=$(($i+1))  
      j=image$i  
      base64 -d $image | xxd -r &gt; ~/Documents/Tugas_SISOP/nature/nature/$j.jpg  
 done;  
</code></pre>

Karena diperintahkan untuk menjalankan script pada pukul 14:14 14 Februari atau hari jum'at di bulan februari, maka dibuat cronjob yaitu :
  <pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> 
  14 14 14 2 5 /bin/bash ~/Documents/Tugas_SISOP/soal1.sh
</code></pre>

<h3>2. Query AWK</h3>
   Permasalahan: 
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta
untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv.
Laporan yang diminta berupa:<br>
      a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun
      2012.<br>
      b. Tentukan tiga product line yang memberikan penjualan(quantity)
      terbanyak pada soal poin a.<br>
      c. Tentukan tiga product yang memberikan penjualan(quantity)
      terbanyak berdasarkan tiga product line yang didapatkan pada soal
      poin b.<br>
   Solusi: Melakukan Query pada awk dan mencari data yang diinginkan. Lalu melakukan count apabila data yang diinginkan benar. Setelah itu melakukan perbandingan<br>
Untuk 2a:
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> cat WA_Sales_Products_2012-14.csv | awk 'BEGIN{FS=","}{if($7==2012)arr[$1]+=$10}END{for(final in arr)print arr[final]","final}' | sort -rg | awk 'NR==1' | awk 'BEGIN{FS=","}{print $2}' &gt;&gt; 2a.txt  
 cat 2a.txt  
</code></pre>

Untuk 2b:
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;">cat WA_Sales_Products_2012-14.csv | awk 'BEGIN{FS=","}{if ($7==2012 && $1=="United States")print $1","$7","$4","$10}' | awk '{FS=","}{arr[$3]+=$4}END{for(final in arr)print arr[final]","final}' | sort -rg |awk 'NR < 4' |awk 'BEGIN{FS=","}{print $2}'>> 2b.txt
</code></pre>

Untuk 2c:
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;">cat WA_Sales_Products_2012-14.csv| awk 'BEGIN {FS=","}{if($7==2012 && $1=="United States" && ($4 == "Personal Accessories"|| $4=="Camping Equipment" || $4 =="Outdor Protection"))print $1","$7","$6","$10}' |  awk 'FS=","{arr[$3]+=$4}END{for(final in arr)print arr[final]","final}' | sort -rg|awk 'NR < 4' |awk 'BEGIN{FS=","}{print $2}' >> 2c.txt
</code></pre>

<h3>3. Password Generator</h3>
Permasalahan : Membuat password secara random mengandung huruf besar, huruf kecil, dan meyimpannya pada data file bernama password(int).txt <br/>
Solusi :<br/>
a. Membuat password generator :<br/>
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> choose() { echo ${1:RANDOM%${#1}:1} $RANDOM; }  
       { choose '0123456789'  
        choose 'abcdefghijklmnopqrstuvwxyz'  
        choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'  
        for ((j=0;j&lt;12;j++))  
        do  
          choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'  
        done  
      } | sort -R | awk '{printf "%s",$1}' &gt; Password/backup.txt;  
</code></pre>
Penjelasan : dibuat fungsi choose yang akan memilih karakter secara acak dari string yang disediakan, kemudian akan dirandom dengan -R dan disimpan pada penyimpanan sementara berupa backup.txt.

b. Menyimpan password pada file bernama password(int).txt dan memastikan tidak ada file yang terlewati : 
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> for((i=0;;))  
 do  
      name=password$i.txt  
      if [ -f Password/$name ]  
        then  
           i=$(($i+1))  
      else {  
           cat Password/backup.txt &gt; Password/password$i.txt  
           break  
           }  
      fi  
 done  
</code></pre>
Penjelasan : Dibuat loop yang akan memeriksa apakah file bernama password(int).txt sudah ada atau belum, ketika sudah ada, makan angka seri akan ditambah sampai file yang dicari tidak ditemukan.
<br>c. Memastikan tidak ada file yang berisi password sama : 
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> for((i=0;;))  
 for files in ~/Documents/Tugas_SISOP/"Password"/password*.txt;
                do      
                        isi=$(cat $files)
                        if [ $isi == $pass ]
                                then 
                                        flag=1
                                break
                        fi
                done
</code></pre>
Penjelasan : Dibuat loop yang akan memeriksa apakah file terdapat pada Password memiliki kesamaan atau tidak, ketika sudah ada, makan penanda akan diberikan angka1, sehingga tidak masuk kedalam bagian pembuatan file.
<h3>4. Enskripsi Backup syslog</h3>
Permasalahan :
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai 	berikut:
        a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
        b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
        c. setelah huruf z akan kembali ke huruf a
        d. Backup file syslog setiap jam.
        e. dan buatkan juga bash script untuk dekripsinya.

Solusi :<br/>
a, b, c
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;">  
!/bin/bash

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
upcs=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
file=$(date +"%H:%M_%d-%m-%y")
rotat=$(date +"%H")
cat /var/log/syslog | tr "${dual:0:26}" "${dual:${rotat}:26}"| tr "${upcs:0:26}" "${upcs:${rotat}:26}" > ~/$
</code></pre>
d. Mengatur crontab agar melakukan run setiap jamnya pada menit 0
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;">
0 * * * * /bin/bash ~/Documents/Tugas_SISOP/soal4.sh
</code></pre>
e. Decrypt : Menggunakan caesar, maka encrypt dapat didecrypt dengan nomorhuruf+26-angkaEncrypt
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;">#!/bin/bash

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
upcs=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
read file
read rotate
rotat=$((26-$rotate))
cat ~/Documents/Tugas_SISOP/$file | tr "${dual:0:26}" "${dual:${rotat}:26}"| tr "${upcs:0:26}" "${upcs:${ro$
</code></pre>
Input yang dibutuhkan : <br/>file: nama file berupa format.txt<br/>rotate: jam yang digunakan untuk enkripsi<br/>
<h3>5. Backup Syslog Tertentu</h3>
Permasalahan : Mengambil data pada Syslog yang mengandung string 'Cron/CRON' dan mengabaikan yang mengandung Sudo.

Solusi : Melakukan query pada AWK dan menuliskannya pada file yang diminta.
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> awk '/!sudo/&amp;&amp;/cron/||/CRON/' /var/log/syslog | awk 'NF &lt;13' &gt;&gt; ~/modul1/soal5.txt  
</code></pre>
Penjelasan :<br/>
'/!sudo/&amp;&amp;/cron/||/CRON/' : Mencari line yang mengandung string cron&CRON dan menghindari string sudo<br/>
'NF &lt;13' : membatasi jumlah field kurang dari 13<br/>
Kemudian diminta untuk menjalankan script setiap 6 menit pada menit 2-30, maka diatur crontab :
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> 2-30/6 * * * * /bin/bash soal5.sh
</code></pre>
