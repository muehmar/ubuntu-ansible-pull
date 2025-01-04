#!/bin/bash

echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list

wget -qO- https://linux-packages.resilio.com/resilio-sync/key.asc | sudo tee /etc/apt/trusted.gpg.d/resilio-sync.asc > /dev/null 2>&1

sudo apt update
sudo apt install resilio-sync

sudo systemctl disable resilio-sync
sudo systemctl stop resilio-sync

sudo sed -i 's/WantedBy=multi-user\.target/WantedBy=default.target/' /usr/lib/systemd/user/resilio-sync.service

systemctl --user enable resilio-sync
systemctl --user start resilio-sync
