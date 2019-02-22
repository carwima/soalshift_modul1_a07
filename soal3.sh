choose() { echo ${1:RANDOM%${#1}:1} $RANDOM; }

	 {  choose '0123456789'
	    choose 'abcdefghijklmnopqrstuvwxyz'
	    choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	    for ((j=0;j<12;j++))
	    do
	        choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
	    done
	} | sort -R | awk '{printf "%s",$1}' >  Password/backup.txt;

for((i=0;;))
do
	name=password$i.txt
	if [ -f Password/$name ]
	   then
		i=$(($i+1))
	else {
		cat Password/backup.txt > Password/password$i.txt
		break
		}
	fi
done
