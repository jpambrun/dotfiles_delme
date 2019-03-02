function fshow -d "git commit browser"
  git log --color --pretty=format:"%C(auto)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset" --abbrev-commit | \
  fzf --ansi --no-sort --reverse \
  --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs git show --color=always | head -80" \
  --bind "enter:execute(echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs git show)+accept" > /dev/null
end
