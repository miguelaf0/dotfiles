#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
REPO="$PWD"

link() {
    src="$1"
    dest="$2"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        mv "$dest" "$dest.bak"
        echo "Backed up $dest -> $dest.bak"
    fi
    
    ln -sf "$src" "$dest"
    echo "Linked $dest -> $src"
}

if command -v apt >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y zsh
fi

link "$REPO/.zshrc"     "$HOME/.zshrc"
link "$REPO/wezterm.lua" "$HOME/.wezterm.lua"

if [ "$(basename "$SHELL")" != "zsh" ]; then
  chsh -s "$(command -v zsh)"
  echo "Default shell changed to zsh. Log out and back in to apply it."
fi