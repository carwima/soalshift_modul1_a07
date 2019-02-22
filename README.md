# soalshift_modul1_a07

<h3>1. Zip terenkripsi</h3> <br>
   Permasalahan : Diberikan sebuah file.zip yang harus di unzip kemudian di decrypt base64 <br>
   Solusi : 
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
<h3>2. Query AWK</h3>

<h3>3. Password Generator</h3>
Permasalahan : Membuat password secara random mengandung huruf besar, huruf kecil, dan meyimpannya pada data file bernama password(int).txt
Solusi : 
a. Membuat password generator :<br>
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

b. Menyimpan password pada file bernama password(int).txt : 
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

<h3>4. Enskripsi Backup syslog</h3>
Permasalahan :
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai 	berikut:
        a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
        b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
        c. setelah huruf z akan kembali ke huruf a
        d. Backup file syslog setiap jam.
        e. dan buatkan juga bash script untuk dekripsinya.

Solusi :
1. Mengambil data jam untuk dijadikan angka sebagai shifting letter pada syslog dan menyimpannya pada file dengan format yang diminta menggunakan date.
2. Mengatur Crontab agar mengeksekusi perintah setiap jam.

<h3>5. Backup Syslog Tertentu</h3>
Permasalahan : Mengambil data pada Syslog yang mengandung string 'Cron/CRON' dan mengabaikan yang mengandung Sudo.

Solusi : Melakukan query pada AWK dan menuliskannya pada file yang diminta.
<pre  style="font-family:arial;font-size:12px;border:1px dashed #CCCCCC;width:99%;height:auto;overflow:auto;background:#f0f0f0;;background-image:URL(http://2.bp.blogspot.com/_z5ltvMQPaa8/SjJXr_U2YBI/AAAAAAAAAAM/46OqEP32CJ8/s320/codebg.gif);padding:0px;color:#000000;text-align:left;line-height:20px;"><code style="color:#000000;word-wrap:normal;"> awk '/!sudo/&amp;&amp;/cron/||/CRON/' /var/log/syslog | awk 'NF &lt;13' &gt;&gt; ~/modul1/soal5.txt  
</code></pre>
