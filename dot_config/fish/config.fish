set -g theme_color_scheme terminal2

if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations... 

  abbr gd 'git difftool'
  abbr gcm 'git commit -m"'
  abbr agg 'ag --hidden -g '
  abbr f 'ag --hidden -g '
  abbr gco 'git checkout'

  echo 'Done'
end

alias ag='ag --path-to-ignore ~/.agignore'
alias ls 'command exa -lah'
alias ff 'ag -g "" | fzf --tiebreak=end --preview "~/bin/colorize.sh {} | head -500"'
alias c colorize.sh
alias o='xdg-open'

set -x DOSHELL '/bin/bash'
set -x EDITOR vim
set -x auto_proxy http://bibliotheque.etsmtl.ca/proxy.pac
set -x GOPATH $HOME/go
set PATH ~/.npm-global/bin ~/bin ~/.meteor $PATH /usr/local/bin/ ~/go/bin
set -x CPPFLAGS '-Wno-deprecated-declarations -Wno-shift-negative-value -Wno-format-truncation -Wno-cast-function-type -Wno-stringop-truncation'

#set -x CC /usr/bin/gcc-6
#set -x CXX /usr/bin/g++-6
#set -x CPP /usr/bin/cpp-6
#set -x LD /usr/bin/gcc-6

set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
set -x FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -x FZF_CTRL_T_COMMAND 'ag --hidden -g ""'

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

#set -x MONGO_URL mongodb://localhost:27017/nucleus

ulimit -n 32000
