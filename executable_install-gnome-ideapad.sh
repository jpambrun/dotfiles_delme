#!/bin/sh
sudo -v

# Update pacman
sudo pacman -Syyu --noconfirm

# Install everything
DEFAULT_PKG="\
             base-devel \
             linux-headers \
             stow \
             tmux \
             gvim \
             openssh \
             feh \
             the_silver_searcher \
             htop \
             zathura \
             zathura-djvu \
             zathura-pdf-mupdf \
             zathura-ps \
             scrot \
             nodejs \
             go \
             npm \
             mercurial \
             xclip \
             inotify-tools \
             vim-spell-fr \
             ttf-fira-mono \
             fzf \
             android-tools \
             exa \
             pv \
             sysstat \
             simplescreenrecorder \
             ttf-dejavu \
             ttf-droid \
             cpupower \
             bat \
             "

for P in $DEFAULT_PKG; do
    echo "Installing ${P}"
    sudo pacman -S --noconfirm "${P}"
done

AUR_PKG="\
       visual-studio-code-bin \
       tig \
       dtrx \
       ttf-font-awesome \
       otf-fira-code \
       yarn \
       otf-hasklig \
       ccat \
       diff-so-fancy \
       gotop-bin \
     "

for P in $AUR_PKG; do
    echo "Installing ${P}"
    yay -S --noconfirm "${P}"
done

# Stow
stow agignore
stow bin
stow npm
stow ssh
stow zathura
stow git
stow vim
stow profile
stow tmux
stow fonts

# service
sudo systemctl start sshd.service
sudo systemctl enable sshd.service
sudo systemctl enable dhcpcd.service

code --install-extension Shan.code-settings-sync

fc-cache -f -v

echo "blacklist ideapad_laptop" | sudo tee /etc/modprobe.d/noideapad.conf

mkdir ~/.npm-global

