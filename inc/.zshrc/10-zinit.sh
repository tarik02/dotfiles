autoload -U colors && colors

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

zinit snippet OMZ::lib/functions.zsh

zinit ice as"completion" wait lucid
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zinit snippet OMZ::plugins/node/node.plugin.zsh
zinit snippet OMZ::plugins/ubuntu/ubuntu.plugin.zsh
zinit snippet OMZ::plugins/yarn/yarn.plugin.zsh
zinit snippet OMZ::plugins/laravel5/laravel5.plugin.zsh
zinit snippet OMZ::plugins/fasd/fasd.plugin.zsh

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait lucid
zinit light zsh-users/zsh-completions
zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions

zinit snippet OMZ::themes/robbyrussell.zsh-theme
