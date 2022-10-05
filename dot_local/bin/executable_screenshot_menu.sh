#!/bin/sh
## This script enables screenshot management via bemenu over sway. 
## Requirements grimshot, wl-copy



base_cmd="grimshot --notify"

## action can be either copy or save, by default save
if [ -z "$1" ] 
then 
	action="save"
else
	action="$1"
fi

case "$(echo -e " Select window\n Select Area\n Screen\n All Screens\n" | bemenu -l 4 -m all -p --no-overlap "Screenshot:")" in
" Select window")	$base_cmd $action window;;  
" Select Area")	$base_cmd $action area	;;  
" Screen") 		$base_cmd $action output;;  
" All Screens") 	$base_cmd $action screen;;  
esac
