
if [ -d /Users/tarik02/.zplugin/bin/zmodules/Src ]; then
	module_path+=( "/Users/tarik02/.zplugin/bin/zmodules/Src" )
	zmodload zdharma/zplugin
fi

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

autoload -U colors && colors

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh

zplugin snippet OMZ::plugins/git/git.plugin.zsh

zplugin ice as"completion" wait lucid
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zplugin snippet OMZ::plugins/github/github.plugin.zsh
zplugin snippet OMZ::plugins/node/node.plugin.zsh
#zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
zplugin snippet OMZ::plugins/ubuntu/ubuntu.plugin.zsh
zplugin snippet OMZ::plugins/yarn/yarn.plugin.zsh
zplugin snippet OMZ::plugins/laravel5/laravel5.plugin.zsh
#zplugin snippet OMZ::plugins/colors/colors.plugin.zsh
#zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zplugin snippet OMZ::plugins/fasd/fasd.plugin.zsh

zplugin ice wait lucid atload'_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait lucid
zplugin light zdharma/fast-syntax-highlighting
zplugin ice wait lucid
zplugin light zsh-users/zsh-completions

zplugin cdclear -q # <- forget completions provided up to this moment
setopt promptsubst

zplugin snippet OMZ::themes/robbyrussell.zsh-theme
#zplugin snippet OMZ::themes/blinks.zsh-theme


#zplugin light direnv/direnv

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=grey,bold,underline"

setopt HIST_IGNORE_ALL_DUPS
unsetopt AUTO_CD

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

setopt append_history
setopt auto_pushd
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt interactive_comments
setopt long_list_jobs
setopt pipe_fail
setopt share_history
setopt no_rm_star_silent

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

PROMPT=''
PROMPT="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})"
PROMPT+='${USERNAME} %{$reset_color%}: %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
