# Zsh config

# Set history position ans numbero of records saved
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Load aliases if existent
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# Autoload prompt theme system
autoload -U compinit promptinit
zstyle ':completion:*' menu select	# Enable autocompletion with arrow keys
zmodload zsh/complist
compinit				# Enable completition
promptinit				# Enable completion listing extensions
_comp_options+=(globdots)		# Include hidden files in autocompletion.
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION  #zcompdumps speed completion listing

# This will set the default prompt to the walters theme
prompt walters
setopt prompt_sp #to fix a bug that wats stdout lines that do not go to newline

# Change prompt:
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# Vim mode for zsh change with -e to emacs(std of bash)
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use lf(file manager) to switch directories and bind it to ctrl-o
lfcd () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp" >/dev/null
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^a' 'bc -l\n' # for calcluator

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n' # use fuzzy finder

bindkey '^[[P' delete-char

# Coax zsh to reash its own command cache when it goes out of date
# used when a package is installed so it will be available with zsh completion
#
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
	if [[ -a /var/cache/zsh/pacman ]]; then
		local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
		if (( zshcache_time < paccache_time )); then
			rehash
			zshcache_time="$paccache_time"
		fi
	fi
}
add-zsh-hook -Uz precmd rehash_precmd

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load wpgtk colorscheme
(cat $HOME/.cache/wal/sequences &)

# Load syntax highlighting; should be last. (the plugin must be installed)
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
