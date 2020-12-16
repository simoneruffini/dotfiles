#!/bin/sh

sway_cmd="swaymsg exec"
base_cmd="grimshot --notify"

case "$(echo -e " Select window\n Select Area\n Screen\n All Screens\n" | bemenu -l 4 -p "Screenshot:")" in
" Select window") $sway_cmd "$base_cmd save window" ;;  
" Select Area") $sway_cmd "$base_cmd save area" ;;  
" Screen") $sway_cmd "$base_cmd save output" ;;  
" All Screens") $sway_cmd "$base_cmd save screen" ;;  
esac
