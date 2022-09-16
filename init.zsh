(( ${+commands[chezmoi]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[chezmoi]:-"$(${commands[asdf]} which chezmoi 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_chezmoi
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile

} ${0:h}
