#!/bin/bash
chvt 7
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/$DISPLAY xwd -root
