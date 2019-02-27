cat WA_Sales_Products_2012-14.csv | awk 'BEGIN{FS=","}{if ($7==2012 && $1=="United States")print $1","$7","$4","$10}' | awk '{FS=","}{arr[$3]+=$4}END{for(final in arr)print arr[final]","final}' | sort -rg |awk 'NR < 4' |awk 'BEGIN{FS=","}{print $2}'>> 2b.txt
cat 2b.txt
