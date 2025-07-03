local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}%{%G➜%} )"
PROMPT='%{$fg[green]%}%{%G【%}%{%G=%}%{%G◈%}%{%G︿%}%{%G◈%}=%{%G】%}%{$reset_color%}@ %{$fg_bold[cyan]%}${DEVPOD_WORKSPACE_ID:%m}%{$reset_color%}%{$fg_bold[red]%}:%{$reset_color%}%{$fg_bold[cyan]%}%1~ ${ret_status}%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%{%G✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
