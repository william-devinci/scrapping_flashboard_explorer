#!/bin/bash

outfile="output.txt"
url="https://flashbots-explorer.marto.lol"

function get_webpage(){
        curl -s  $url > $outfile
}

function send(){
        value="$(grep -oP '(?<="miner_reward":..)(\d+)' $outfile | head -1) "
        validator="For the block : $(grep -oP '(?<="block_number":)(\d+)' $outfile | head -1)"
        reward="the validator get ${value} (in wei) as MEV"

        date=$(date '+%Y-%m-%d')
        filename=$(echo "${date}.txt")

        echo "${value}" >> $filename

        chat_id="CHAT_ID"
        url_telegram="https://api.telegram.org/botKEY/sendMessage?parse_mode=HTML"

        curl --data chat_id=$chat_id --data-urlencode "text=${date} -- ${validator}, ${reward}" $url_telegram

}

get_webpage
send