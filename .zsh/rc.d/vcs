autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' actionformats '%f %i%b%F{yellow}|%F{red}%a%f%i%m%f '
zstyle ':vcs_info:git*' formats '%f %i%b%i%m%f '
zstyle ':vcs_info:git*:*' check-for-changes true
# We explicitly disable get-revision to use %i for another purpose
zstyle ':vcs_info:git*:*' get-revision false

zstyle ':vcs_info:git*:*' stagedstr '＋'
zstyle ':vcs_info:git*:*' unstagedstr '⬤'

zstyle ':vcs_info:git*:*' patch-format ''

zstyle ':vcs_info:git*+set-message:*' hooks git-misc-st git-misc-stage git-misc-stash git-icon-branch

function +vi-git-icon-branch() {
   if [[ ${hook_com[branch]} =~ '^tags/(.+)' ]]; then # Tag view
      hook_com[branch]="(${match[1]})"
   elif [[ ${hook_com[branch]} =~ '~|\^' ]]; then # Commit view
      hook_com[branch]="<$(git rev-parse --short HEAD)>"
   elif [[ ${hook_com[branch]} =~ '^remotes/pr/(.+)' ]]; then # Github PR view
      hook_com[branch]="%F{cyan}review:pr/${match[1]}%f"
   fi
}

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-misc-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [[ $ahead -gt 0 && $behind -gt 0 ]]; then
           gitstatus+=( "${behind}⫽${ahead}" )
        elif [[ $ahead -gt 0 ]]; then
           gitstatus+=( "${ahead}⟫" )
        elif [[ $behind -gt 0 ]]; then
           gitstatus+=( "⇣${behind}" )
        fi

        if [[ $#gitstatus -gt 0 ]]; then
           hook_com[misc]+=" ${(j: :)gitstatus}"
        fi
    fi
}

# Add stagedstr and unstagedstr to hook_com[misc]
# Also change color to yellow if there's changes
# Note: we use hook_com[revision]/%i for the color
# as get-revision is set to false
function +vi-git-misc-stage() {
   local -a gitstage

   hook_com[revision]="%F{green}"
   if [[ ! -z ${hook_com[unstaged]} ]] ; then
      gitstage+=( "${hook_com[unstaged]}" )
   fi
   if [[ ! -z ${hook_com[staged]} ]] ; then
      gitstage+=( "${hook_com[staged]}" )
   fi
   if [[ $#gitstage -gt 0 ]]; then
      hook_com[misc]+=" ${(j::)gitstage}"
      hook_com[revision]="%F{yellow}"
   fi
}

# Show count of stashed changes
function +vi-git-misc-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        hook_com[misc]+=" ＃"
    fi
}

# http://eseth.org/2010/git-in-zsh.html
