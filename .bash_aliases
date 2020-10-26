# ls
alias ll="ls --color=auto -laAhHF"
alias ls="ls --color=auto -a"
alias la="ls --color=auto -A"

# general
alias aliases="vim ~/.dotfiles/.bash_aliases && source ~/.dotfiles/.bash_aliases && cp -f ~/.dotfiles/.bash_aliases ~/.dotfiles/backup/$(hostname)_$(date +"%Y-%m-%d_%Hh%M").bash_aliases"
alias bashrc="vim ~/.dotfiles/.bashrc && source ~/.dotfiles/.bashrc && cp -f ~/.dotfiles/.bashrc ~/.dotfiles/backup/$(hostname)_$(date +"%Y-%m-%d_%Hh%M").bashrc"
alias code="code-insiders"
alias c="clear"
alias vimrc="vim ~/.vimrc"
alias gitconfig="vim ~/.gitconfig"
alias p="echo $PATH"
alias permissions="mdr ~/gd/linux/permissions.md"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias oh="cd ~/.oh-my-zsh"
alias pbcopy_id_rsa="pbcopy < ~/.ssh/id_rsa.pub"

# git
alias gf="git fetch"
alias gh="alias | grep git"
alias gs="gss -s"
alias gss="git status"
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
alias gbp="git remote origin --prune"
alias gbpd="git remote origin --prune --dry-run"
alias gbd="git push origin --delete"

# Folders
alias ws="cd ~/dev/workspaces"
alias dev="cd ~/dev"
alias dot="cd ~/.dotfiles"

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
#alias info='code ~/gd/poc/info.md'

alias h="cd ~"
