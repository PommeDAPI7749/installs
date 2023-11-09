#!/bin/bash

pwd=$(pwd)

## Go to .app-installers folder
cd ~/.app-installers

## Install Discord source
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh

## Install my synth-shell config
rm ~/.config/synth-shell/synth-shell-prompt.config
rm ~/.config/synth-shell/synth-shell-greeter.config
cp $pwd/configs/synth-shell/root-prompt.config ~/.config/synth-shell/synth-shell-prompt.config
cp $pwd/configs/synth-shell/root-greeter.config ~/.config/synth-shell/synth-shell-greeter.config

cd $pwd

echo "\033[0;32m ✔️ - Synth-shell installed\033[0m"