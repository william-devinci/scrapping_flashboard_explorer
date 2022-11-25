#!/bin/bash

date=$(date '+%Y-%m-%d')
filename=$(echo "${date}.txt")


reward=0
for val in  $(cat $filename)
do
        ((reward=$reward+$val))
done

chat_id="CHAT_ID"
url_telegram="https://api.telegram.org/botKEY/sendMessage?parse_mode=HTML"

curl --data chat_id=$chat_id --data-urlencode "text=Today ${date}, the total reward of validator is ${reward}" $url_telegram