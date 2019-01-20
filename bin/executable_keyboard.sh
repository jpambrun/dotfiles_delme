#! /bin/sh

LAYOUT=$(xset -q | grep -A 0 'LED' | cut -c66-67)

if [ "$LAYOUT" == "0" ]; then
  echo "us"
else
  echo "ca"
fi
