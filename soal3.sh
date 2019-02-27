for((;;))
do      
        flag=0
        choose() { echo ${1:RANDOM%${#1}:1} $RANDOM; }

                 {  choose '0123456789'
                    choose 'abcdefghijklmnopqrstuvwxyz'
                    choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                    for ((j=0;j<12;j++))
                    do
                        choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
                    done
                } | sort -R | awk '{printf "%s",$1}' >  backup.txt;
        pass=$(cat backup.txt)
        cd Password
        total=$(ls -l . | egrep -c '^-')
        cd ..
        if [ $total != 0 ]
        then
                for files in ~/Documents/Tugas_SISOP/"Password"/password*.txt;
                do      
                        isi=$(cat $files)
                        if [ $isi == $pass ]
                                then 
                                        flag=1
                                break
                        fi
                done
        fi
        if [ $flag == 0 ]
        then
                for((i=1;;))
                do
                        name=password$i.txt
                        if [ -f Password/$name ]
                           then
                                i=$(($i+1))
                        else {
                                cat backup.txt > Password/password$i.txt
                                flag=2 
                                break
                                }
                        fi
                done
        break
        fi
done
