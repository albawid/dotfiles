#!/bin/sh

# File              : traffic.sh
# License           : MIT License
# Author            : Albawid
# Date              : Tuesday, 14/07/2020 19:16 WIB
# Last Modified Date: Tuesday, 14/07/2020 19:16 WIB
# Last Modified By  : Albawid

# Dependencies: ifstat from AUR

def_iface=$(ip route | grep '^default' | awk '{print $5}' | head -n 1)

if [ ! "$def_iface" ]; then
  echo "  " --"KB/s" " " --"KB/s "
  return
else
  download=$(ifstat2 -i $def_iface 1 1 | awk 'NR%3==0 {print $1}' | cut -d "." -f1)
  upload=$(ifstat2 -i $def_iface 1 1 | awk 'NR%3==0 {print $2}' | cut -d "." -f1)
fi

if [ "$def_iface" ]; then
  echo " " $download "KB/s" " " $upload "KB/s"
fi
