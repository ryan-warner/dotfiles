#!/usr/bin/env bash
set -euo pipefail

if command -v gsettings >/dev/null 2>&1; then
  if gsettings list-schemas | grep -q "org.gnome.desktop.input-sources"; then
    current="$(gsettings get org.gnome.desktop.input-sources xkb-options)"
    case "$current" in
      *"caps:escape"*)
        ;;
      "@as []"|"[]")
        gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
        ;;
      *)
        updated="$(printf "%s" "$current" | sed "s/]$/,'caps:escape']/")"
        gsettings set org.gnome.desktop.input-sources xkb-options "$updated"
        ;;
    esac
  fi
fi

if command -v setxkbmap >/dev/null 2>&1; then
  setxkbmap -option caps:escape || true
fi
