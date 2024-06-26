#!/bin/sh
t=60
format="%I:%M %p"

case $@ in
  *"-s"* | --seconds)
    t=1
    format="%I:%M:%S %p"
    ;;
  *"-m"* | --minutes)
    t=60
    format="%I:%M %p"
    ;;
esac

while :
do
  clear
  date +"$format" | figlet
  sleep $(($t - $(date +%s) % $t))
done
