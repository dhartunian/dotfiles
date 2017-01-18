#!/bin/bash

rm ~/.spacemacs
ln -s "$(pwd)/.spacemacs" ~/

rm ~/.gitconfig
ln -s "$(pwd)/.gitconfig" ~/

rm ~/.gitignore_global
ln -s "$(pwd)/.gitignore_global" ~/

rm ~/.zshrc
ln -s "$(pwd)/.zshrc" ~/

rm -rf ~/.emacs.d/private
ln -s "$(pwd)/spacemacs-private" ~/.emacs.d/private

rm -rf ~/.ghci
ln -s "$(pwd)/.ghci" ~/

rm -rf ~/.psqlrc
ln -s "$(pwd)/.psqlrc" ~/
