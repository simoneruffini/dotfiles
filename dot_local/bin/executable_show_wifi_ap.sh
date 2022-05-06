#! /bin/sh
nmcli d wifi | bemenu --list 10 --prompt "wifi" --no-exec --scrollbar "always" --grab --monitor "-1" >/dev/null
