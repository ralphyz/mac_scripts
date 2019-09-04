#!/usr/bin/env bash

# based off of a script by:
# https://apple.stackexchange.com/users/290121/will-cain
# on a post to a question here:
# https://apple.stackexchange.com/questions/254703/get-low-battery-notifications-for-mouse-earlier

# I put this script in cron:
# */15 * * * * /path/to/scripts/keyboard-battery-check.sh

PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin

# actual battery level
BATT=`ioreg -c AppleDeviceManagementHIDEventService -r -l | grep -i keyboard -A 20 | grep BatteryPercent | cut -d= -f2 | cut -d' ' -f2`

# defaults to warn at 20%; accepts other number as 1st argument (useful for testing)
COMPARE=${1:-20}

if [ -z "$BATT" ]; then
  echo 'No keyboard found.'
  exit 0
fi

if (( BATT < COMPARE )); then
  osascript -e "display notification \"Keyboard battery is at ${BATT}%.\" with title \"Keyboard Battery Low\""
fi

