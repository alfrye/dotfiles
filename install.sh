#!/usr/bin/env bash

set -e

echo "instaling dotfiles"
DIRECTORY="$HOME/.config"
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
if [ -d "$DIRECTORY" ]; then
  echo "Directory '$DIRECTORY' exists."
else
  echo "Directory '$DIRECTORY' does not exist."
  mkdir -p "$DIRECTORY"
fi
cp -R "$SCRIPT_DIR"/nvim "$DIRECTORY"/
