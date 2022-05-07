#! /bin/sh
scan="no";

if ! [ -z $1 ]; then
  if [ $1 = "scan" ] ; then
    scan="yes";
  fi
fi

nmcli d wifi list --rescan $scan | bemenu -l 10 -p "wifi networks" --no-exec --scrollbar "always" --grab --monitor "-1" | grep -P "([0-9A-Z]{2}:){5}[0-9A-Z]{2}" -o | xargs -I{} nmcli d wifi connect {} | xargs -I{} notify-send "wifi connection" {}
