source ${ZSH_HOME}/session.d/non-gnome.zsh


export I3SOCK="${XDG_RUNTIME_DIR}/i3/ipc-${DISPLAY}.sock"

exec i3
