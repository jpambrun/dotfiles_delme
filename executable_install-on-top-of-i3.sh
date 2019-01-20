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
             i3lock \
             gvim \
             feh \
             pcmanfm \
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
             xorg-utils \
             ttf-fira-mono \
             qterminal \
             fzf \
             fish \
             otf-overpass \
             android-tools \
             xautolock \
             exa \
             pv \
             sysstat \
             simplescreenrecorder \
             ttf-dejavu \
             ttf-droid \
             cpupower \
             bat \
             dex \
             "

for P in $DEFAULT_PKG; do
    echo "Installing ${P}"
    sudo pacman -S --noconfirm "${P}"
done

go get github.com/Jguer/yay

AUR_PKG="\
       rofi \
       visual-studio-code-bin \
       tig \
       i3blocks \
       dtrx \
       ttf-font-awesome \
       otf-fira-code \
       yarn \
       i3ipc-python-git \
       otf-hasklig \
       ccat \
       diff-so-fancy \
       gotop-bin \
     "

for P in $AUR_PKG; do
    echo "Installing ${P}"
    ../go/bin/yay -S --noconfirm "${P}"
done

# Stow
for D in *; do
    if [ -d "${D}" ]; then
        echo "Stowing ${D}"
        stow "${D}"
    fi
done

# service
sudo systemctl start sshd.service
sudo systemctl enable sshd.service
sudo systemctl enable dhcpcd.service

# user jpambrun specific
sudo chsh -s /usr/bin/fish jpambrun
source ~/.profile
fish -c 'fisher'

code --install-extension Shan.code-settings-sync

mkdir ~/.npm-global