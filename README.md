# Dotfiles

WIP of my dotfiles layout using chezmoi, somewhat broken out into personal/work-related tools. 

## Bootstrap
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
- Neovim config lives in dot_config/nvim (plugins sync once after initial apply if nvim is installed)
- Cursor/VS Code settings are not managed yet
- Brewfile and linux package lists are repo-only (not applied to $HOME)
