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

## left/right status segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_proxy_icon root_indicator dir_writable dir vcs kubecontext newline context)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs history time battery custom_charging_icon)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

## time config
POWERLEVEL9K_TIME_FORMAT="%D{%I:%M:%S %p}"

## git config (remove extra space from branch icon)
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126'

## dir config
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='deepskyblue1'
POWERLEVEL9K_DIR_HOME_BACKGROUND='deepskyblue1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='deepskyblue1'
POWERLEVEL9K_DIR_ETC_BACKGROUND='deepskyblue1'

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

###############################################################################

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
source $BREW_HOME/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## run oh-my-zsh
source $ZSH/oh-my-zsh.sh

## source fuzzy-search init if present
## if not present, run:
##   brew install fzf
##   $(brew --prefix)/opt/fzf/install
if [[ -f ~/.fzf.zsh ]]; then
	source ~/.fzf.zsh
fi

## use vim
export EDITOR=vim

# aliases
alias vi=vim

unalias ls
alias ls='ls --color=auto -CF'
alias ll='ls --color=auto -CFlh'

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
