#!/bin/bash

pwd=$(pwd)

## Go to .app-installers folder
cd ~/.app-installers

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install code -y

cd $pwd

echo "\033[0;32m ✔️ - VSCode installed\033[0m"