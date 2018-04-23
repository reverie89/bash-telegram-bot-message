#!/bin/bash

# Example use: telegram.sh apiToken chatId "Hello world"
# Remember to chmod +x this file
# For silent output, simply uncomment "> /dev/null 2>&1" at the bottom

apiToken=$1
chatId=$2
message=$3

send() {
        curl -s \
        -X POST \
        https://api.telegram.org/bot$apiToken/sendMessage \
        -d data-urlencode \
        -d parse_mode=Markdown \
        -d chat_id=$chatId \
        -d text="$message"
}

if [[ ! -z $@ ]]; then
        send #> /dev/null 2>&1
fi
