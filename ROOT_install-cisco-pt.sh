#!/bin/bash

pwd=$(pwd)

## Download Cisco Packet Tracer
cd /home
wget https://archive.org/download/packet-tracer-731-amd-64/PacketTracer_731_amd64.deb

## Go to .app-installers folder
cd ~/.app-installers
git clone https://github.com/thiagoojack/packettracer-fedora.git
cd packettracer-fedora
chmod +x install.sh
bash install.sh

cd $pwd
echo "\033[0;32m ✔️ - Cisco Packet Tracer installed\033[0m"