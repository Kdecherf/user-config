#!/usr/bin/env zsh

clear
[[ -o interactive ]] || trap "source ${ZSH_HOME}/logout.zsh" EXIT

source ${ZSH_HOME}/utils/source-dir.zsh login

if [[ -z "${TMUX}${PTY}" ]]; then
	if [[ -n "${DESKTOP_SESSION}" ]]; then
		SESSION=${DESKTOP_SESSION}
	elif [[ -n "${TTY}" ]]; then
		SESSION=tty
	else
		SESSION=unknown
	fi
	test -f ${ZSH_HOME}/session.d/${SESSION}.zsh && source ${ZSH_HOME}/session.d/${SESSION}.zsh
else
	echo "Please add 'set -g default-command /bin/zsh' to your ~/.tmux.conf to avoid launching login shell in tmux"
fi
