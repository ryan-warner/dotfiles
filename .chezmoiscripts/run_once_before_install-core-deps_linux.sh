#!/usr/bin/env bash
set -euo pipefail

core_packages=(git make unzip ripgrep curl)

if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y "${core_packages[@]}"
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y "${core_packages[@]}"
elif command -v yum >/dev/null 2>&1; then
  sudo yum install -y "${core_packages[@]}"
else
  echo "No supported package manager found. Install core deps: ${core_packages[*]}"
fi
