typeset -U paths

paths=(
      $HOME/.local/bin
      $path
)

path=()
for p in $paths; [[ -d $p ]] && path+=$p
unset p
unset paths


export PATH
