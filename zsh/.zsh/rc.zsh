autoload -U compinit zmv
compinit

export ZSH_HOME=${HOME}/.zsh

setopt HIST_IGNORE_SPACE

chpwd_functions=()
precmd_functions=()
preexec_functions=()
source ${ZSH_HOME}/utils/source-dir.zsh rc
