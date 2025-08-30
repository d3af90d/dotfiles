export PATH="$HOME/bin:$HOME/.local/share/gem/ruby/3.4.0/bin:${HOME}/.local/bin/idea-IC-252.23892.409/bin:$PATH"
export EDITOR="/usr/bin/nvim"; alias v='/usr/bin/nvim'
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export LC_ALL="en_US.UTF-8"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export GPG_TTY=$(tty)
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GOPATH="$XDG_DATA_HOME/go"; export PATH="${GOPATH}/bin:$PATH"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

[[ $- == *i* ]] || return
shopt -s histappend checkwinsize cdspell cmdhist
HISTSIZE=10000; HISTFILESIZE=1000000
PS1='\[\e[39;1m\]\w\[\e[0m\] \\$ '
# ROOT PS1='\[\e[38;5;196;1m\]ROOT\[\e[0m\] \[\e[39;1m\]\w\[\e[0m\] # '
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
alias ls='ls -CF --group-directories-first'; alias l='ls'; alias ll='ls -alF'; alias la='ls -A'; alias grep='grep --color=auto'
alias lsblk='lsblk -o NAME,LABEL,FSTYPE,SIZE,MOUNTPOINT,UUID'
