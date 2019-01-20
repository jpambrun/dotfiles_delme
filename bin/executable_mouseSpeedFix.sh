#!/bin/sh
SEARCH=$1

if [ "$SEARCH" = "" ]; then
  echo 'error search ==""'
  exit 1
fi

ids=$(xinput --list |grep pointer| awk -v search="$SEARCH" \
  '$0 ~ search {match($0, /id=[0-9]+/);\
  if (RSTART) \
    print substr($0, RSTART+3, RLENGTH-3)\
  }'\
  )

echo $ids
for i in $ids
do
  xinput set-prop $i 'Device Accel Profile' $2
  xinput set-prop $i 'Device Accel Constant Deceleration' $3
  xinput set-prop $i 'Device Accel Velocity Scaling' $4
  xinput set-prop $i 'Device Accel Adaptive Deceleration' $5
done
