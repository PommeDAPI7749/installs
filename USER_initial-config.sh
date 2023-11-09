#!/bin/bash

pwd=$(pwd)

## Go to .app-installers folder
mv ~/.app-installers
cd ~/.app-installers

## Install synth-shell
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh

## Install my synth-shell config
rm ~/.config/synth-shell/synth-shell-prompt.config
rm ~/.config/synth-shell/synth-shell-greeter.config
cp $pwd/configs/synth-shell/user-prompt.config ~/.config/synth-shell/synth-shell-prompt.config
cp $pwd/configs/synth-shell/user-greeter.config ~/.config/synth-shell/synth-shell-greeter.config
