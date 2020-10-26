# Make ls use colors
#export CLICOLOR=1

HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000
HISTFILESIZE=200000000

#PS1="${debian_chroot:+($debian_chroot)}${C_LIGHTGREEN}\u $C_LIGHTBLUE\w$C_LIGHTYELLOW \$(git-prompt) \n$C_DEFAULT> "
#PS1="\[\033[01;32m\]\u \w \$ \n> "
#PS1="%B%F{green}%n%F{magenta} @ %f%b%B%F{cyan}%~/%f%b %B%F{yellow}>%f%b "

# Aliases
if [ -f ~/.dotfiles/.bash_aliases ]; then
    echo "- Calling ~/.dotfiles/.bash_aliases"
    . ~/.dotfiles/.bash_aliases
fi

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export PATH="$JAVA_HOME/bin:$PATH"

# Maven
export M2_HOME=/usr/local/Cellar/maven/3.6.3_1/libexec
export M2=${M2_HOME}/bin
export PATH=${PATH}:${M2_HOME}/bin
[ -d $M2_HOME ] && echo "- Directory $M2_HOME exists." || echo "- Error: Directory $M2_HOME does not exists."

# PATH
export PATH="/usr/local/bin:$PATH"

# PROXY
BASE_EU_PROXY="http://proxy-eu.org.nasdaqomx.com:8080/"
BASE_NO_PROXY=".local,localhost,127.0.0.1,localaddress,*localdomain.com,localdomain.com,*nasdaq.com,nasdaq.com,*nasdaqomx.com,nasdaqomx.com,*ften.com,ften.com,*om.com,om.com,*.om,.om,nasdaqtrader.com,*nasdaqtrader.com"
  
export HTTP_PROXY=$BASE_EU_PROXY
export HTTPS_PROXY=$BASE_EU_PROXY
export NO_PROXY=$BASE_NO_PROXY
export http_proxy=$BASE_EU_PROXY
export https_proxy=$BASE_EU_PROXY
export no_proxy=$BASE_NO_PROXY
export ftp_proxy=$BASE_EU_PROXY
export socks_proxy=$BASE_EU_PROXY

echo "- ~/.bashrc APPLIED"
