#!/bin/sh
sudo -v

# Install everything
DEFAULT_PKG="\
            nm-applet \
            networkmanager
            "

for P in $DEFAULT_PKG; do
    echo "Installing ${P}"
    sudo pacman -S --noconfirm "${P}"
done

sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

