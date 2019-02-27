cat WA_Sales_Products_2012-14.csv| awk 'BEGIN {FS=","}{if($7==2012 && $1=="United States" && ($4 == "Personal Accessories"|| $4=="Camping Equipment" || $4 =="Outdor Protection"))print $1","$7","$6","$10}' |  awk 'FS=","{arr[$3]+=$4}END{for(final in arr)print arr[final]","final}' | sort -rg|awk 'NR < 4' |awk 'BEGIN{FS=","}{print $2}' > 2c.txt
cat 2c.txt
