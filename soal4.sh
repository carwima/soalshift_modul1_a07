#!/bin/bash

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
upcs=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
file=$(date +"%H:%M_%d-%m-%y")
rotat=$(date +"%H")
cat /var/log/syslog | tr "${dual:0:26}" "${dual:${rotat}:26}"| tr "${upcs:0:26}" "${upcs:${rotat}:26}" > ~/Documents/Tugas_SISOP/$file.txt

