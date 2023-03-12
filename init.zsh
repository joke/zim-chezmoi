(( ${+commands[chezmoi]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[chezmoi]:-"$(${commands[asdf]} which chezmoi 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_chezmoi
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'chezmoi'. Regenerated completions."
  fi
} ${0:h}
