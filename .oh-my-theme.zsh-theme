if [[ $EUID -eq 0 ]]; then
  PROMPT="%(?:%{$fg_bold[red]%} :%{$fg_bold[red]%}󱡂 ) %{$fg[cyan]%}%c%{$reset_color%}"
else
  PROMPT="%(?:%{$fg_bold[green]%}%1{%} :%{$fg_bold[red]%}%1{%} ) %{$fg[cyan]%}%c%{$reset_color%}"
fi
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %1{%}"
RPROMPT='%{$fg[red]%}[%*]%{$reset_color%}'
