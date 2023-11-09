#!/bin/bash

pwd=$(pwd)

## Go to .app-installers folder
cd ~/.app-installers

## Install Discord source
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
cd $pwd

echo "\033[0;32m ✔️ - Synth-shell installed\033[0m"