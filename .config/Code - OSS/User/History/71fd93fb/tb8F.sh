#!/bin/bash
BAT=$(ls /sys/class/power_supply/ | grep BAT)
if [ -z "$BAT" ]; then echo ""; exit; fi
CAP=$(cat "/sys/class/power_supply/$BAT/capacity")
STATUS=$(cat "/sys/class/power_supply/$BAT/status")
ICON=""
if [ $CAP -lt 25 ]; then ICON=""; fi
if [ "$STATUS" = "Charging" ]; then ICON=""; fi
echo "$ICON $CAP%"
