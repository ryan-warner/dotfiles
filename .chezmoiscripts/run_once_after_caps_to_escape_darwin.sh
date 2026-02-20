#!/usr/bin/env bash
set -euo pipefail

src=30064771129
dst=30064771113

defaults -currentHost write -g com.apple.keyboard.modifiermapping.0-0-0 -array "<dict><key>HIDKeyboardModifierMappingSrc</key><integer>${src}</integer><key>HIDKeyboardModifierMappingDst</key><integer>${dst}</integer></dict>"

if command -v hidutil >/dev/null 2>&1; then
  hidutil property --set "{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\":${src},\"HIDKeyboardModifierMappingDst\":${dst}}]}" >/dev/null 2>&1 || true
fi
