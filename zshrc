## ZSHRC

## figure out where brew is installed
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

## add /usr/local/bin and sbin
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# man page paths
export MANPATH="/usr/local/share/man:$MANPATH"
if [[ $BREW_HOME != "/usr/local" ]]; then
  export MANPATH="$BREW_HOME/share/man:$MANPATH"
fi

## update path completions paths before oh-my-zsh inits
fpath=(
  $BREW_HOME/opt/zsh-completions
  $BREW_HOME/share/zsh/site-functions
	$fpath
)

### Shows nice Mac logo along with some information
archey -l retro

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## Use PowerLevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'

plugins=()
#plugins=(git mvn node npm nvm macos rsync)

### Syntax hilighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### run oh-my-zsh
source $ZSH/oh-my-zsh.sh

## use vim
export EDITOR=vim

### NVM - Node Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.dotfiles/.bashrc ] && source ~/.dotfiles/.bashrc
[ -f ~/.dotfiles/.p10k.zsh ] && source ~/.dotfiles/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
TEST=`sdk current java | tr -d '\n'`
echo "                            ✅ $TEST"




