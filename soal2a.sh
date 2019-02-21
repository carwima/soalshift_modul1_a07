cat WA_Sales_Products_2012-14.csv | awk 'BEGIN{FS=","}{if($7==2012)arr[$1]+=$10}END{for(final in arr)print arr[final]","final}' | sort -rg | awk 'NR==1' | awk 'BEGIN{FS=","}{print $2}' >> 2a.txt
cat 2a.txt
