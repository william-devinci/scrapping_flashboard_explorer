#!/bin/bash

date=$(date '+%Y-%m-%d')
filename=$(echo "${date}.txt")


reward=0
min=$(cat $filename | head -1)
max=$(cat $filename | head -1)
for val in  $(cat $filename)
do
        ((reward=$reward+$val))
        if [ $min -gt $val ] 
        then
                min=$val
        fi
        if [ $max -lt $val ]
        then
                max=$val 
        fi
done

chat_id="CHAT_ID"
url_telegram="https://api.telegram.org/botKEY/sendMessage?parse_mode=HTML"

curl --data chat_id=$chat_id --data-urlencode "text=Today ${date}, the total reward of validators for MEV is ${reward} (wei), min =${min} (wei), max=${max} (wei)"" $url_telegram