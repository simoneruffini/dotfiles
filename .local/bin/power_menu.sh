case "$(echo -e " Exit sway\n🔒 Lock\n⏱ Suspend\n⏼ Hibernate\n⏻ Power Off\n🔄 Reboot\n" | bemenu -l 6 -m all -p "Power:")" in
" Exit sway") swaymsg exit ;;
"🔒 Lock") loginctl lock-session ;;
"⏱ Suspend") systemctl suspend ;;
"⏼ Hibernate") systemctl hibernate ;;
"⏻ Power Off") systemctl poweroff ;;
"🔄 Reboot") systemctl reboot ;;
esac
