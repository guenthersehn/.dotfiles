## add various brew "non-g" binaries to the head of the path
for lib in $( ls -1 /usr/local/opt ); do
  export PATH="/usr/local/opt/$lib/libexec/gnubin:$PATH"
done
export PATH="/usr/local/bin:$PATH"

# man page paths
export MANPATH="/usr/local/share/man:$MANPATH"

## update path completions paths before oh-my-zsh inits
fpath=(
	/usr/local/share/zsh/site-functions
	/usr/local/share/zsh-completions
	$fpath
)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

###############################################################################
## Use PowerLevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

## Use "Nerd Font" -- install FiraCode (explicitly not the 'mono' version)
# from https://nerdfonts.com/
# $ brew tap homebrew/cask-fonts
# $ brew cask install font-firacode-nerd-font
POWERLEVEL9K_MODE='nerdfont-complete'

## left/right status segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_proxy_icon root_indicator dir_writable dir  vcs kubecontext newline prompt_char)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

## time config
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_TIME_12HR=false

## git config (remove extra space from branch icon)
# POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126'

## dir config
POWERLEVEL9K_DIR_FOREGROUND=254
POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_DIR_HOME_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_DIR_ETC_BACKGROUND='deepskyblue1'
POWERLEVEL9K_DIR_ANCHOR_BOLD=true

## battery segment config
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=($'\uf244 ' $'\uf243 ' $'\uf243 ' $'\uf243 ' $'\uf242 ' $'\uf242 ' $'\uf242 ' $'\uf241 ' $'\uf241 ' $'\uf240 ')
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(red orangered1 darkorange orange1 gold1 yellow1 seagreen2 green3)
POWERLEVEL9K_BATTERY_LOW_FOREGROUND=white
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=black
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND=black
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=black

## custom "charging" icon if connected to AC power
zsh_charging_icon(){
  local charging='\uF588' ## from NerdFonts
  local charged='\uF584'
  if [[ $(pmset -g ps | grep charged) =~ "charged" ]]; then
    echo -n $charged
  elif [[ $(pmset -g ps | head -1) =~ "AC Power" ]]; then
    echo -n $charging
  fi
}
POWERLEVEL9K_CUSTOM_CHARGING_ICON_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_CHARGING_ICON_FOREGROUND="red3"
POWERLEVEL9K_CUSTOM_CHARGING_ICON="zsh_charging_icon"

## custom "proxy" icon for when a proxy is configured
zsh_proxy_icon(){
  if [[ ! -z $HTTP_PROXY ]]; then
	echo -n '\uf983'
  fi
}
POWERLEVEL9K_CUSTOM_PROXY_ICON_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_PROXY_ICON_FOREGROUND="red3"
POWERLEVEL9K_CUSTOM_PROXY_ICON="zsh_proxy_icon"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
	git
	mvn
	node
	npm
	nvm
	macos
	rsync
)

## syntax hilighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## run oh-my-zsh
echo ZSH_THEME=$ZSH_THEME
source $ZSH/oh-my-zsh.sh

## use vim
export EDITOR=vim

# aliases
alias vi=vim

## Run extension files in the following dirs:
##  $HOME/.zsh.d
##  $HOME/.zsh.d.$USER
##  $HOME/.zsh.d/$(hostname -s)
##
## Run things in alphabetic order by filename
for dir in $HOME/.zsh.d $HOME/.zsh.d.$USER $HOME/.zsh.d.$(hostname -s); do
	if [[ -d $dir ]]; then
		for file in $(find $dir -name \*.sh | sort); do
			#echo "Init: $file"
			source "$file"
		done
	fi
done

## EOF

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.dotfiles/.bashrc ] && source ~/.dotfiles/.bashrc
