#!/bin/sh

function tg_msg() {
  if [ "$#" -ne 1 ] ; then
    echo "specify message"
    return
  fi
  curl "https://api.telegram.org/bot${TELEGRAM_BOT_ID}/sendMessage?text=${1}&chat_id=${TELEGRAM_CHAT_ID}"
}

function tg_send_doc() {
    if [ "$#" -ne 1 ] ; then
      echo "missing file"
      return 1
    fi

    curl "https://api.telegram.org/bot${TELEGRAM_BOT_ID}/sendDocument?chat_id=${TELEGRAM_CHAT_ID}" \
        -F document=@"${1}"
}
