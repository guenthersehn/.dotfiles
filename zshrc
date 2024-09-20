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

# [[ ! -f .zshrc_simple ]] || source .zshrc_simple
# [[ ! -f .zshrc_complex ]] || source .zshrc_complex

### Shows nice Mac logo along with some information
archey -l retro

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

###############################################################################
## Use PowerLevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

## view colors
# getColorCode background
# getColorCode foreground

## Use "Nerd Font" -- install FiraCode (explicitly not the 'mono' version)
# from https://nerdfonts.com/
# $ brew tap homebrew/cask-fonts
# $ brew cask install font-firacode-nerd-font
POWERLEVEL9K_MODE='nerdfont-complete'

## ### Prompt
## POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_proxy_icon root_indicator dir  vcs kubecontext newline prompt_char)
## POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
## 
## ### Time config
## POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
## POWERLEVEL9K_TIME_12HR=false
## 
## ## git config (remove extra space from branch icon)
## # POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126'
## 
## # ## dir config
## POWERLEVEL9K_DIR_FOREGROUND=254
## POWERLEVEL9K_DIR_BACKGROUND=4
## POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
## POWERLEVEL9K_DIR_ANCHOR_BOLD=true  
## 
## ## battery segment config
## POWERLEVEL9K_BATTERY_VERBOSE=false
## POWERLEVEL9K_BATTERY_STAGES=($'\uf244 ' $'\uf243 ' $'\uf243 ' $'\uf243 ' $'\uf242 ' $'\uf242 ' $'\uf242 ' $'\uf241 ' $'\uf241 ' $'\uf240 ')
## POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(red orangered1 darkorange orange1 gold1 yellow1 seagreen2 green3)
## POWERLEVEL9K_BATTERY_LOW_FOREGROUND=white
## POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=black
## POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=black
## POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=black
## 
## ## custom "charging" icon if connected to AC power
## zsh_charging_icon() {
##   local charging='\uF588' ## from NerdFonts
##   local charged='\uF584'
##   if [[ $(pmset -g ps | grep charged) =~ "charged" ]]; then
##     echo -n $charged
##   elif [[ $(pmset -g ps | head -1) =~ "AC Power" ]]; then
##     echo -n $charging
##   fi
## }
## POWERLEVEL9K_CUSTOM_CHARGING_ICON_BACKGROUND="black"
## POWERLEVEL9K_CUSTOM_CHARGING_ICON_FOREGROUND="red3"
## POWERLEVEL9K_CUSTOM_CHARGING_ICON="zsh_charging_icon"
## 
## ## custom "proxy" icon for when a proxy is configured
## zsh_proxy_icon() {
##   if [[ ! -z $HTTP_PROXY ]]; then
## 	  echo -n '\uf983'
##   fi
## }
## POWERLEVEL9K_CUSTOM_PROXY_ICON_BACKGROUND="black"
## POWERLEVEL9K_CUSTOM_PROXY_ICON_FOREGROUND="red3"
## POWERLEVEL9K_CUSTOM_PROXY_ICON="zsh_proxy_icon"
## 
## ##############################
##############################
##############################

plugins=()
#plugins=(git mvn node npm nvm macos rsync)

### Syntax hilighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### run oh-my-zsh
echo ZSH_THEME=$ZSH_THEME
source $ZSH/oh-my-zsh.sh

## use vim
export EDITOR=vim



##### ## Run extension files in the following dirs:
##### ##  $HOME/.zsh.d
##### ##  $HOME/.zsh.d.$USER
##### ##  $HOME/.zsh.d/$(hostname -s)
##### ##
##### ## Run things in alphabetic order by filename
##### for dir in $HOME/.zsh.d $HOME/.zsh.d.$USER $HOME/.zsh.d.$(hostname -s); do
##### 	if [[ -d $dir ]]; then
##### 		for file in $(find $dir -name \*.sh | sort); do
##### 			#echo "Init: $file"
##### 			source "$file"
##### 		done
##### 	fi
##### done
##### 
##### ## EOF
##### 
##### if type brew &>/dev/null; then
#####   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#####   autoload -Uz compinit
#####   compinit
##### fi
##### 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.dotfiles/.bashrc ] && source ~/.dotfiles/.bashrc
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

##### # To customize prompt, run `p10k configure` or edit /tmp/p10k.zsh.
##### [[ ! -f /tmp/p10k.zsh ]] || source /tmp/p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
