function dar -d "Archive to drive"
  tar -cf - $argv | \
    pv -s (du -sb $argv | awk '{print $1}') | \
    gzip -9 | \
    env -C ~/drive drive push -piped tar/$argv\_(date "+%Y-%m-%d_%Hh%Mm%Ss").tar.gz;
end
