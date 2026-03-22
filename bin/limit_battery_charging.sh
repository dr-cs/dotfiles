#!/usr/bin/env bash

# Need to run with sudo to write the charging threshold file, but if
# run with sudo must be run in the dir containing this script because
# sudo doesn't use the user's PATH so won't find this script (haven't
# figured out how to do that).

# If not run as sudo, relaunch as sudo.
# Note that this loses any arguments to the script.
if [[ "$(whoami)" != root ]]; then
        sudo $(realpath $0)
        exit
fi

if [ -z "$1" ]
then
    limit=80
else
    limit=$1
fi

ceiling=$(($limit+1))
current_ceiling=$(cat /sys/class/power_supply/BAT0/charge_control_end_threshold)
current_limit=$((current_ceiling-1))
echo "Current battery charging limit: $current_limit% (ceiling of $current_ceiling)."
echo "Limiting battery charging to $limit% (ceiling of $ceiling)."
echo $ceiling > /sys/class/power_supply/BAT0/charge_control_end_threshold
