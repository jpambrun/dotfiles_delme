function fr -d "Fuzzy-find rebase point"
  set name (git log --color --pretty=format:"%C(auto)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset" --abbrev-commit | \
  fzf --ansi --no-sort --reverse --bind "enter:execute(echo {} ' )+accept")

  git rebase -i (echo $name| grep -o '[a-f0-9]\{7\}' | head -1)^
end
