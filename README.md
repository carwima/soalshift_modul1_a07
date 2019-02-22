# soalshift_modul1_a07

1. Zip terenkripsi
   Permasalahan : Harus di unzip kemudian di decrypt base64
   Solusi : Mengunzip file dan melakukan decrypt serta meletakkan file yang sudah di decrypt pada directory lain dan mengatur crontab agar menjalankan task pada 14:14 14-2-yyyy atau setiap jum'at di bulan februari.
   
2. Query AWK

3. Password Generator

4. Enskripsi Backup syslog
Permasalahan :
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai 	berikut:
        a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
        b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
        c. setelah huruf z akan kembali ke huruf a
        d. Backup file syslog setiap jam.
        e. dan buatkan juga bash script untuk dekripsinya.

Solusi :
Mengambil data jam untuk dijadikan angka sebagai shifting letter pada syslog dan menyimpannya pada file dengan format yang diminta menggunakan date.

5. Backup Syslog Tertentu
Permasalahan :

Solusi : Melakukan query pada AWK dan menuliskannya pada file yang diminta.
