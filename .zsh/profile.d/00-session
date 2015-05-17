#!/usr/bin/env zsh

if [[ -z "${XDG_RUNTIME_DIR+systemd}" ]]; then
	if [[ ! -d /run/user && -d /run && -w /run ]]; then
		mkdir /run/user
		chmod a=rwXt /run/user
	fi
	if [[ ( -d /run/user/${USER} && -w /run/user/${USER} ) || ( -d /run/user && -w /run/user ) ]]; then
		XDG_RUNTIME_DIR=/run/user/${USER}
	else
		XDG_RUNTIME_DIR=/tmp/run-${USER}
	fi
	export XDG_RUNTIME_DIR
	[[ ! -d ${XDG_RUNTIME_DIR} ]] && mkdir -p ${XDG_RUNTIME_DIR}
fi

export DBUS_SESSION_BUS_ADDRESS=unix:path=${XDG_RUNTIME_DIR}/bus
