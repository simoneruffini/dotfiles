while true; do
    val1="$(power_use.sh)W"
    val2=" $(cat /sys/class/power_supply/BAT0/capacity)%"
    val3="$(date +'%d-%m-%Y %l:%M %p')"
    echo $val1 $val2 $val3
    sleep 10;
done
