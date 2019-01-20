#!/bin/sh
sudo -v

# Install everything
# DEFAULT_PKG="\
#              nvidia \
#              nvidia-settings \
#              nvidia-libgl \
#              "

# for P in $DEFAULT_PKG; do
#     echo "Installing ${P}"
#     sudo pacman -S --noconfirm "${P}"
# done

sudo mhwd -i pci video-nvidia

echo governor='performance' | sudo tee -a /etc/default/cpupower
sudo systemctl enable cpupower

echo '* hard nofile 65536' | sudo tee -a /etc/security/limits.conf
echo '* soft nofile 65536' | sudo tee -a /etc/security/limits.conf
sudo sysctl --system