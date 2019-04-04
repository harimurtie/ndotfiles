#!/bin/bash
# get the touchpad ID
# put your device name below. Should be sufficient just to grep for Touchpad
ID=$(xinput list --id-only "Synaptics TM3207-001")
# get the status
STATUS=$(xinput list-props $ID | grep "Device Enabled"|awk '{print $4}')
# get the tap status and property ID
TEMP=$(xinput list-props $ID | grep --max-count=1  "Tapping Enabled")
TAP=$(echo $TEMP|awk '{print $5}')
PROP=$(echo $TEMP|awk '{print $4}'|cut -b 2-4)

case $1 in
    devonoff)
        if [ $STATUS -ne 0 ]
        then
          xinput --disable $ID 
          notify-send -u low -i input-touchpad "Touchpad disabled"
        else
          xinput --enable $ID
          notify-send -u low -i input-touchpad "Touchpad enabled"
        fi
    ;;
esac
