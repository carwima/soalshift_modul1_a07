#!/bin/bash

unzip -q nature.zip -d ../Tugas_SISOP
mkdir nature/nature
i=0
for image in "nature"/*; 
do
	i=$(($i+1))
	j=image$i
	base64 -d $image | xxd -r > ~/Documents/Tugas_SISOP/nature/nature/$j.jpg
done;
