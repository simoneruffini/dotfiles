#! /bin/sh
bemenu-run -b -l 10 --scrollbar=always -H 25 --monitor "-1" --no-exec | xargs swaymsg exec --
