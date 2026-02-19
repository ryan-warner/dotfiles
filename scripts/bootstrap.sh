#!/usr/bin/env bash
set -euo pipefail

if ! command -v chezmoi >/dev/null 2>&1; then
  os_name="$(uname -s)"
  if [ "$os_name" = "Darwin" ]; then
    brew_bin="$(command -v brew || true)"
    if [ -z "$brew_bin" ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      if [ -x "/opt/homebrew/bin/brew" ]; then
        brew_bin="/opt/homebrew/bin/brew"
      elif [ -x "/usr/local/bin/brew" ]; then
        brew_bin="/usr/local/bin/brew"
      else
        brew_bin="$(command -v brew || true)"
      fi
    fi

    if [ -z "$brew_bin" ]; then
      echo "Homebrew install failed."
      exit 1
    fi

    "$brew_bin" install chezmoi
  else
    bin_dir="$HOME/.local/bin"
    mkdir -p "$bin_dir"
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$bin_dir"
    export PATH="$bin_dir:$PATH"
  fi
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "chezmoi installation failed."
  exit 1
fi

chezmoi apply
