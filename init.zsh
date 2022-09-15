local command="${commands[chezmoi]:-${commands[asdf]:+$(asdf which chezmoi)}}"

if (( ! ${+command} )); then
  return 1
fi

local compfile=${0:h}/functions/_chezmoi
if [[ ! -e $compfile || $compfile -ot $command ]]; then
  $command completions zsh >| $compfile
fi
