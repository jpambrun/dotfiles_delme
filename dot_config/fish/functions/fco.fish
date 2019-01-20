function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | \
  fzf --ansi --no-sort --reverse \
  --bind "enter:execute(echo {} | xargs git checkout)+accept" > /dev/null
end
