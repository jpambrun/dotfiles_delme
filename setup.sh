#! /bin/sh
mkdir -p ~/.config/chezmoi

rm ~/.config/chezmoi/chezmoi.yaml
cat <<EOT >> ~/.config/chezmoi/chezmoi.yaml
sourceDir: .chezmoi
data:
  email: jf.pambrun@gmail.com
  name: JF Pambrun
  is_server: true
  is_desktop: true
  install:
    nvidia_driver: true

EOT
