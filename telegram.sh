#!/bin/sh

function tgmsg() {
  if [ "$#" -ne 1 ] ; then
    echo "specify message"
    return
  fi
  curl -k "${TELEGRAM_URL}${TELEGRAM_BOT_ID}/sendMessage?text=${1}&chat_id=${TELEGRAM_CHAT_ID}"
}

function tgfile() {
  tgcurlpost "sendDocument?chat_id=${TELEGRAM_CHAT_ID}" "$1"
}

function tgcurl() {
  verb=$1
  shift
  curl -k "${TELEGRAM_URL}${TELEGRAM_BOT_ID}/${verb}" $@
}

function tgcurlpost() {
  p=$1
  shift
  curl -vv -k "${TELEGRAM_URL}${TELEGRAM_BOT_ID}/${p}" -F document=@"$1"
}
