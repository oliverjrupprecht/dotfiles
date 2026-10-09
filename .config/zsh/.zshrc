# -> Vim mode <-
bindkey -v
export KEYTIMEOUT=1

# -> History <-
HISTFILE="$ZDOTDIR/.zsh_history"

# -> Completion <-
autoload -Uz compinit
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completion"
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=1

# -> Terminal Prompt <-
PS1=$' %~
 -> '

# -> Editor <-
export EDITOR="nvim"
export VISUAL="nvim"

# -> Zoxide <─
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# -> Aliases <─
alias v="nvim"
alias vim="nvim"

# -> Yazi Wrapper Function <─
function y() {
	local tmp=$(mktemp -t "yazi-cwd.XXXXXX")
	command yazi "$@" --cwd-file="$tmp"
	local cwd=$(cat "$tmp")
	if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && [ -d "$cwd" ]; then
		builtin cd -- "$cwd"
	fi
	command rm -f -- "$tmp"
}

# -> Codex storage <-
export CODEX_HOME="$HOME/.config/codex"

# Optional settings specific to this machine.
[[ ! -f "$ZDOTDIR/local.zsh" ]] || source "$ZDOTDIR/local.zsh"
