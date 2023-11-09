#!/bin/bash

pwd=$(pwd)

## Go to .app-installers folder
cd ~/.app-installers

## Install Discord source
git clone https://github.com/RPM-Outpost/discord.git &&
cd discord &&
./create-package.sh stable &&
cd $pwd &&
echo "alias discord-update='cd ~/.app-installers/discord/ && ./create-package.sh stable'" >> ~/.bashrc

echo "\033[0;32m ✔️ - Discord installed\033[0m"