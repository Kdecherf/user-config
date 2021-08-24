#! /usr/bin/env zsh

zsh_home=${0:h}/..
zsh_home=${${zsh_home:a}#${ZDOTDIR:-$HOME}/}

conf=${ZDOTDIR:-$HOME}/${zsh_home}/rc.d/keymap.d/${${DISPLAY:+X}:-TTY}-${${TMUX:+tmux}:-$TERM}.tmp

getseq () # Thanks to zkbd
{
	trap "stty ${$(stty -g 2>/dev/null):-echo -raw}" 0 1 2 15
	stty raw -echo
	local k='' seq='' i
	read -k 1 k
	[[ -n $k ]] || return 1
	[[ $k = $'\012' || $k = $'\015' || $k = ' ' ]] && return 0
	seq=$k
	while read -t -k 1 k
	do
		seq=$seq$k
	done
	print -Rn ${(V)seq}
}

typeset -a keys
keys=(	Backspace	Insert	Home	PageUp
			Delete	End		PageDown
		Up
	Left	Down	Right
)

for key in key ctrl alt; do
	echo "Now create the ${key} array"
	echo "typeset -g -A $key" >> ${conf}
	
	if [[ $key = "key" ]]; then
		for k in F{1..12}; do
			echo -n "Press ${k}"
			r=$(getseq) || exit 1
			echo "${key}[${k}]='${r}'" >> ${conf}
			echo " '${r}'"
		done
	else
		echo "Do this serie holding the ${key} key pressed"
	fi
	for k in $keys; do
		echo -n "Press ${k}"
		r=$(getseq) || exit 1
		echo "${key}[${k}]='${r}'" >> ${conf}
		echo " '${r}'"
	done
	echo >> ${conf}
done
exit 0
