
########################
###### PATH & VARS #####
########################

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="~/.dotfiles/scripts:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true
plugins=(git nvm macos rsync)
#plugins=(git mvn node npm nvm macos rsync)
export EDITOR=vim
export CLICOLOR=1
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000000
HISTFILESIZE=200000000

fpath=(
  $BREW_HOME/opt/zsh-completions
  $BREW_HOME/share/zsh/site-functions
	$fpath
)


####################
##### HOMEBREW #####
####################
 
if [[ -x /opt/homebrew/bin/brew ]]; then
  export BREW_HOME=$( /opt/homebrew/bin/brew --prefix )
elif [[ -x /usr/local/bin/brew ]]; then
  export BREW_HOME=$( /usr/local/bin/brew --prefix )
elif [[ -x $HOME/.homebrew/bin/brew ]]; then
  export BREW_HOME=$( $HOME/.homebrew/bin/brew --prefix )
elif [[ -x $HOME/homebrew/bin/brew ]]; then
  export BREW_HOME=$( $HOME/homebrew/bin/brew --prefix )
else
  echo ""
  echo "Unable to figure out where brew is installed! Fix in ~/.zshrc"
  echo ""
fi

## add brew's bin and sbin if it's not in /usr/local
if [[ $BREW_HOME != "/usr/local" ]]; then
  export PATH="${BREW_HOME}/bin:${BREW_HOME}/sbin:${PATH}"
fi

## add various brew "non-g" binaries to the head of the path
for bindir in $( find $BREW_HOME -type d -name gnubin ); do
  export PATH="$bindir:${PATH}"
done

# man page paths
export MANPATH="/usr/local/share/man:$MANPATH"
if [[ $BREW_HOME != "/usr/local" ]]; then
  export MANPATH="$BREW_HOME/share/man:$MANPATH"
fi

archey

### Syntax hilighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#############################
##### RUN run oh-my-zsh #####
#############################

source $ZSH/oh-my-zsh.sh


#############################
###### NVM NODE MANAGER #####
#############################

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


##################
###### PYENV #####
##################

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#export PATH="$(pyenv root)/shims:$PATH"


##################
##### FINISH #####
##################

eval "$(starship init zsh)"

[ -f ~/.dotfiles/bash_aliases ] && source ~/.dotfiles/bash_aliases && echo "                            ✅ ~/.dotfiles/bash_aliases"
[ -f ~/.proxyrc ] && source ~/.proxyrc && echo "                            ✅ ~/proxyrc"
