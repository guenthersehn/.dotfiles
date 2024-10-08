# Make ls use colors
export CLICOLOR=1

HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=200000000

### PS1="${debian_chroot:+($debian_chroot)}${C_LIGHTGREEN}\u $C_LIGHTBLUE\w$C_LIGHTYELLOW \$(git-prompt) \n$C_DEFAULT> "
### PS1="\[\033[01;32m\]\u \w \$ \n> "
### PS1="%B%F{green}%n%F{magenta} @ %f%b%B%F{cyan}%~/%f%b %B%F{yellow}>%f%b "

# Maven
#export M2_HOME=/usr/local/Cellar/maven/3.8.6/libexec
#export M2=${M2_HOME}/bin
#export PATH=${PATH}:${M2_HOME}/bin
#[ -d $M2_HOME ] && echo "- Directory $M2_HOME exists." || echo "- Error: Directory $M2_HOME does not exists."

# PATH & VARS
# export PATH="dir:$PATH""
export PATH="/usr/local/bin:$PATH"
export PATH="~/.dotfiles/scripts:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$(pyenv root)/shims:$PATH"

[ -f ~/.dotfiles/.bash_aliases ] && source ~/.dotfiles/.bash_aliases && echo "                            ✅ ~/.dotfiles/.bash_aliases"
[ -f ~/.proxyrc ] && source ~/.proxyrc && echo "                            ✅ ~/.proxyrc"
echo "                            ✅ ~/.bashrc APPLIED"
