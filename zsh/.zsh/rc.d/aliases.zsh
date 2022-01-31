# Classical aliases
alias ls='ls --color=auto'
alias lo='ls -ogh'
alias ll='ls -lh'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias batp='bat --style=plain'

# Shortcuts
alias g='git'
alias tmux='tmux -2'
alias syser='systemctl --user'

alias vi='nvim'

ssh() {
   gpg-connect-agent /bye 2>&1 > /dev/null
   ssh-add -l | grep "/home/kdecherf/.ssh/id_rsa" 2>&1 > /dev/null
   if [[ $? -gt 0 ]]; then
      ssh-add
   fi
   /bin/ssh $@
}

alias fssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
