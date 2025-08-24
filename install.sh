#!/usr/bin/env bash


set -e

echo "instaling dotfiles"
DIRECTORY="$HOME/.config"

if [ -d "$DIRECTORY" ]; then
  echo "Directory '$DIRECTORY' exists."
else
  echo "Directory '$DIRECTORY' does not exist."
  mkdir -p "$DIRECTORY"
fi
cp -R ~/code/dotfiles/nvim  ~/.config/
