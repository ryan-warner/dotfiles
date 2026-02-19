#!/usr/bin/env bash
set -euo pipefail

if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)"
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "chezmoi installation failed."
  exit 1
fi

chezmoi apply
