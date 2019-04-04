#!/bin/sh

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  domain="org.mpris.MediaPlayer2"
  meta=$(dbus-send --print-reply --dest=${domain}.spotify \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata)

  #regex fml
  artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1)
  title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)

  #reverse str if it's in hebrew, cuz fuck rtl support
  if [ $(echo $title | grep -c [אבגדהוזחטיכלמנסעפצקרשת]) -eq 1 ]; then
    title=$(echo $title | rev)
  fi

  if [ $(echo $artist | grep -c [אבגדהוזחטיכלמנסעפצקרשת]) -eq 1 ]; then
    artist=$(echo $artist | rev)
  fi

    echo "${*:-%artist% - %title%}" | sed "s/%artist%/$artist/g;s/%title%/$title/g"i | sed "s/%artist%/\&/g;s/%title%/\&/g"
}

main "$@"
