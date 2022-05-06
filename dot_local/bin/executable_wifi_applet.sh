#! /bin/sh
nmcli d wifi list --rescan auto | bemenu -l 10 -p "wifi" --no-exec --scrollbar "always" --grab --monitor "-1" | grep -P "([0-9A-Z]{2}:){5}[0-9A-Z]{2}" -o | xargs -I{} nmcli d wifi connect {} | xargs -I{} notify-send "wifi connection" {}
