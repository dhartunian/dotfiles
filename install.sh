#!/bin/bash

rm ~/.gitconfig
ln -s "$(pwd)/.gitconfig" ~/

rm ~/.gitignore_global
ln -s "$(pwd)/.gitignore_global" ~/

rm ~/.psqlrc
ln -s "$(pwd)/.psqlrc" ~/

rm ~/.config/fish/config.fish
ln -s "$(pwd)/config.fish" ~/.config/fish/

rm ~/.emacs
ln -s "$(pwd)/.emacs" ~/.emacs
