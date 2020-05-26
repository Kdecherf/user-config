setopt PROMPT_SUBST
autoload -Uz colors
colors

PROMPT='$(user_prompt_info)%F{blue}%(4~:…:)%3~ ${vcs_info_msg_0_}%# %f'

if [[ ${TERM_PROGRAM} != "vscode" ]]; then
   PROMPT="%B${PROMPT}%b"
fi

user_prompt_info() {
   [[ -z ${SSH_CLIENT} ]] && return
   echo "%F{green}%n@%m%f "
}

precmd(){
vcs_info
[[ $(tty) = /dev/pts/* ]] && print -Pn "\e]0;%n@%M:%~\a"
}
