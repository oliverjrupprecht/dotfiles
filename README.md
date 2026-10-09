# Dotfiles

Real configuration files live in this repository. GNU Stow links individual files into the home directory, leaving directories and unrelated files in place.

## Setup

Install Git and GNU Stow. On macOS: `brew install stow`.
Clone this repository to `~/dotfiles`. Back up existing files at the corresponding destination paths before linking; do not move entire config directories.

```sh
cd ~/dotfiles
stow --simulate --verbose --no-folding --target="$HOME" .
stow --verbose --no-folding --target="$HOME" .
```

Stow's built-in ignore rules exclude Git metadata and this README. No custom Stow ignore file is needed.

## Dependencies

Install the apps you use: Zsh, Ghostty, Neovim, Yazi, btop and optionally zoxide and Git LFS. Neovim uses `vim.pack` and needs a Neovim version supporting `vim.pack`; it downloads the declared plugins. The configured language servers are lua-language-server, clangd and pyright-langserver. Clipboard integration depends on the OS. Ghostty includes macOS-specific preferences; review them when moving to another OS.

Git configuration includes a personal name/email: review before using on a work machine or publishing. Keep credentials and application state outside this repository.

## Daily use

Edit configs through their usual home paths or directly in this repository, then review, commit and push with Git. Pull updates on other machines; rerun Stow when adding files.
Machine-specific shell settings can live in `~/.config/zsh/local.zsh`, which is untracked.

## Unlink

```sh
cd ~/dotfiles
stow --delete --no-folding --target="$HOME" .
```

Restore backed-up original files afterwards if reverting the migration.
