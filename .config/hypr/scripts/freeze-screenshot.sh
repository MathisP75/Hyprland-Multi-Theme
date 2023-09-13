#!/bin/sh

SCRIPTNAME=${BASH_SOURCE[0]}
for pid in $(pidof -x $SCRIPTNAME); do
  if [ $pid != $$ ]; then
    kill -9 $pid
  fi
done

${hyprpicker}/bin/hyprpicker -r -z & picker_proc=$!
FILENAME="$HOME/Pictures/screenshots/$(date +'%s_grim.png')"
PREVID=$(cat sc-notif-id)

if [ $1 -eq 0 ] # If save screenshot
then
    ${grimblast}/bin/grimblast save area $FILENAME &&
    kill $picker_proc
        EDIT=($(notify-send -r $PREVID -p --icon=$FILENAME -t 3000 "Screenshot saved" --action=Edit)) &&
    echo ${EDIT[0]} > sc-notif-id
      
    if [ ${EDIT[1]} -eq 0 ] # If edit screenshot
    then
      swappy --file $FILENAME --output-file $FILENAME
      exit
    fi

elif [ $1 -eq 1 ] # If copy screenshot
then
    ${grimblast}/bin/grimblast save area $FILENAME &&
    kill $picker_proc
    wl-copy < $FILENAME &&
      EDIT=($(notify-send -r $PREVID -p --icon=$FILENAME -t 3000 "Screenshot copied" --action=Edit))
    echo ${EDIT[0]} > sc-notif-id

    if [ ${EDIT[1]} -eq 0 ] # If edit screenshot
    then
      swappy --file $FILENAME --output-file $FILENAME &&
      wl-copy < $FILENAME 
    fi

    rm $FILENAME
fi

kill $picker_proc

