#!/usr/bin/env bash
set -euo pipefail

core_packages=(make ripgrep gcc)

brew_bin="$(command -v brew || true)"
if [ -z "$brew_bin" ]; then
  if [ -x "/opt/homebrew/bin/brew" ]; then
    brew_bin="/opt/homebrew/bin/brew"
  elif [ -x "/usr/local/bin/brew" ]; then
    brew_bin="/usr/local/bin/brew"
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew_bin="$(command -v brew || true)"
    if [ -z "$brew_bin" ]; then
      if [ -x "/opt/homebrew/bin/brew" ]; then
        brew_bin="/opt/homebrew/bin/brew"
      elif [ -x "/usr/local/bin/brew" ]; then
        brew_bin="/usr/local/bin/brew"
      fi
    fi
    if [ -z "$brew_bin" ]; then
      echo "Homebrew install failed."
      exit 1
    fi
  fi
fi

missing=()
for pkg in "${core_packages[@]}"; do
  if ! "$brew_bin" list --formula "$pkg" >/dev/null 2>&1; then
    missing+=("$pkg")
  fi
done

if [ "${#missing[@]}" -gt 0 ]; then
  "$brew_bin" install "${missing[@]}"
fi
