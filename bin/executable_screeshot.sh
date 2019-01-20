#! /bin/sh
URL=http://random.jfpb.net/
FILENAME="$(date +%Y%m%d%H%M%S)_$(date | md5sum | head -c 16)"
scrot -s "/tmp/$FILENAME.png"
scp "/tmp/$FILENAME.png" jfpb.net:www_random
echo -n "$URL/$FILENAME.png" | xclip -sel clipboard
feh "/tmp/$FILENAME.png"
exit 0
