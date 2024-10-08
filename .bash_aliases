# ls
alias ll="ls -GlaAhHF --color=always"
alias ls="ls -Ga --color=always"
alias la="ls -GA --color=always"

# general
alias t="ts-node"
alias aliases="vim ~/.dotfiles/.bash_aliases && source ~/.dotfiles/.bash_aliases && cp -f ~/.dotfiles/.bash_aliases ~/.dotfiles/backup/$(hostname)_$(date +"%Y-%m-%d_%Hh%M").bash_aliases"
alias bashrc="vim ~/.dotfiles/.bashrc && source ~/.dotfiles/.bashrc && cp -f ~/.dotfiles/.bashrc ~/.dotfiles/backup/$(hostname)_$(date +"%Y-%m-%d_%Hh%M").bashrc"
alias proxy="vim ~/.proxyrc && source ~/.proxyrc"
alias eproxy="echo ✅ proxy = $http_proxy; echo ✅ no_proxy=$no_proxy"
alias c="clear"
alias vimrc="vim ~/.vimrc"
alias gitconfig="vim ~/.gitconfig"
alias path="echo $PATH"
alias permissions="mdr ~/gd/linux/permissions.md"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias oh="cd ~/.oh-my-zsh"
alias pbcopy_id_rsa="pbcopy < ~/.ssh/id_rsa.pub"
#alias colors="for i in {0..255}; do print -Pn '%K{$i}  %k%F{$i}${(l:3::0:)i}%f ' ${${(M)$((i%6)):#3}:+$'\n'}; done"
alias launchpad="~/.dotfiles/scripts/launchpad.sh"

# freespace
alias free="df -h"
alias freed="du -h -s *"

# git
alias gf="git fetch"
alias gh="alias | grep git"
alias gs="gss -s"
alias gss="git status"
alias gd="git diff"
alias gpr="git pull --rebase --prune origin"
alias grm="git checkout master && git pull && git checkout - && git rebase master"
alias gsrm="git stash && git checkout master && git pull && git checkout - && git rebase master && git stash pop"
alias gps="git push"
alias gro="git reset --hard origin/master"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gcod="git checkout develop"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit --date=relative"
alias gb="git branch"
alias gbp="git remote prune origin"
alias gbpd="git remote prune --dry-run origin"
alias gbd="git push origin --delete"

# Folders
alias ws="cd ~/dev/workspaces"
alias l="cd ~/dev/learning/"
alias dev="cd ~/dev"
alias dot="cd ~/.dotfiles"
alias h="cd ~"

# docker
alias d="docker"
alias dl="docker logs -f"
alias de="docker exec -it"
alias dcp="docker-compose"
alias dprune="yes | docker container prune && yes | docker volume prune"

# python
alias p3="python3"
alias server="p3 -m http.server --bind 192.168.100.126 8000"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# tools
alias rm-node_modules='sudo find . -name "node_modules" -type d -exec rm -rf "{}" \;'
alias find-node_modules='sudo find . -name "node_modules" -type d'
alias rm-icon='sudo find . -name "Icon?" -exec rm -f "{}" \;'
alias find-icon='sudo find . -name "Icon?"'
alias script-template='vim ~/gd/linux/bin/script_template.txt'
alias info='code ~/.dotfiles/stuff/info.md'
alias text="code ~/.dotfiles/stuff/Text\ Substitutions.plist"

# kubernetes
alias k="kubectl"
