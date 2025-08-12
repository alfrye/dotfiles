#!/usr/bin/env bash


set -e

echo "instaling dotfiles"
DIRECTORY="/home/vscode/.config"

if [ -d "$DIRECTORY" ]; then
  echo "Directory '$DIRECTORY' exists."
else
  echo "Directory '$DIRECTORY' does not exist."
  mkdir -p "$DIRECTORY"
fi
ln -s ~/dotfiles/nvim  ~/.config/
