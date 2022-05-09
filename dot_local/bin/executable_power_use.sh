#! /bin/sh

if not command -v bc >/dev/null 2&>1; then
    printf "-1";
    exit 1;
fi
micro_ampere=$(cat /sys/class/power_supply/BAT0/current_now )
micro_volts=$(cat /sys/class/power_supply/BAT0/voltage_now)
watts=$(echo "scale=1; ($micro_volts/10^6)*($micro_ampere/10^6)" | bc)
printf $watts;
