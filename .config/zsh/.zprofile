# Initialise Homebrew on Apple Silicon, Intel macOS, or Linux.
for brew_path in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
    if [[ -x "$brew_path" ]]; then
        eval "$("$brew_path" shellenv)"
        break
    fi
done
unset brew_path

export PATH="$PATH:$HOME/.local/bin"
