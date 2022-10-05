#! /bin/sh
bemenu_params=" --prompt=RUN:\
                --list=10 \
                --fn=Monospace \
                --scrollbar=always \
                --line-height=25 \
                --monitor=-2 \
                --no-overlap \
                --width-factor=0.4 \
                --no-exec"

bemenu-run $bemenu_params | xargs swaymsg exec --
