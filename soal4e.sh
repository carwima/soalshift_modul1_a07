#!/bin/bash

dual=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
upcs=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
read file
read rotate
rotat=$((26-$rotate))
cat ~/Documents/Tugas_SISOP/$file | tr "${dual:0:26}" "${dual:${rotat}:26}"| tr "${upcs:0:26}" "${upcs:${rotat}:26}" > ~/Documents/Tugas_SISOP/dekrip$file

