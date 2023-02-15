#!/bin/sh
## This script enables screenshot management via bemenu over sway. 
## Requirements grimshot, wl-copy



base_cmd="grimshot --notify"

## action can be either copy or save, by default save
if [ -z "$1" ]; then 
	action="save"
else
	action="$1"
fi

## If the action to perform gets specified by command line execute that
if [ ! -z "$2" ]; then
    echo "$2"
    case "$2" in
        area|window|output|screen)
            #execute the action
            $base_cmd $action "$2" 
            # then exit
            exit 0
        ;;
        *)
            # anything else exit
            exit 1
        ;;
    esac
fi

print_area=" Select Area"
print_window=" Select window"
print_screen=" Screen"
print_all_screens=" All Screens\n"

bemenu_cmd="bemenu --list 4 --monitor all --no-overlap --prompt Screenshot:"

ret_val=$(echo -e "$print_area\n$print_window\n$print_screen\n$print_all_screens\n" | $bemenu_cmd )

case "$ret_val" in
"$print_area")	        $base_cmd $action area;;  
"$print_window")	    $base_cmd $action window;;  
"$print_screen") 		$base_cmd $action output;;  
"$print_all_screens") 	$base_cmd $action screen;;  
esac
