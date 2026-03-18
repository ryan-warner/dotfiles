#!/usr/bin/env bash
set -euo pipefail

if [ "$(uname -s)" != "Linux" ]; then
  exit 0
fi

core_packages=(git gcc make unzip ripgrep curl zsh)

if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install build-essential -y
  sudo apt-get install -y "${core_packages[@]}"
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y "${core_packages[@]}"
elif command -v yum >/dev/null 2>&1; then
  sudo yum install -y "${core_packages[@]}"
else
  echo "No supported package manager found. Install core deps: ${core_packages[*]}"
fi

if [ "$SHELL" != "$(command -v zsh)" ]; then
  chsh -s "$(command -v zsh)"
fi
