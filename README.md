# Dotfiles

WIP of my dotfiles layout using chezmoi, somewhat broken out into personal/work-related tools. 

## Bootstrap
- Clone repo: `git clone https://github.com/ryan-warner/dotfiles ~/dotfiles`
- Run `scripts/bootstrap.sh` (just runs `chezmoi apply`)

## Installation behavior
- Core deps are installed via OS-specific chezmoi scripts
- Homebrew bundle runs on macOS when Brewfile changes
- apt packages install on Linux when linux/apt-packages.txt changes
- Neovim plugins sync after package installs

## Structure
- dot_* files map to ~/.<name>
- dot_config/* maps to ~/.config/*
- private_* files are local only (not committed)

## Notes
- Local secrets can live in private_dot_config/secrets/env (none required at the moment)
- Run scripts in scripts/ as needed (bootstrap just applies chezmoi)
- Neovim config lives in dot_config/nvim (plugins sync after package installs)
- Cursor/VS Code settings are not managed yet
- Brewfile and linux package lists are repo-only (not applied to $HOME)
- Ghostty config lives at XDG path; remove macOS-specific config to avoid overrides
- Ghostty font comes from Homebrew cask: font-fira-code-nerd-font
- Linux installs FiraCode Nerd Font via Nerd Fonts release script

## Updating dotfiles
- Preferred: edit files directly in this repo, then run `chezmoi apply` (or `scripts/bootstrap.sh`)
- If you edit files in $HOME directly, capture changes with `chezmoi add <file>` or `chezmoi re-add`
- If you changed both source and target, use `chezmoi merge <file>`
- Reference: https://www.chezmoi.io/user-guide/frequently-asked-questions/usage/#how-do-i-edit-my-dotfiles-with-chezmoi
