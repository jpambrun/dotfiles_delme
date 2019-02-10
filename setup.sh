#! /bin/sh
mkdir -p ~/.config/chezmoi

go get -u github.com/twpayne/chezmoi

rm ~/.config/chezmoi/chezmoi.yaml
cat <<EOT >> ~/.config/chezmoi/chezmoi.yaml
sourceDir: .chezmoi
data:
  email: jf.pambrun@gmail.com
  name: JF Pambrun
  is_server: false
  is_desktop: true
  is_laptop: true
  is_ideapad: true
  install:
    nvidia_driver: false

EOT
