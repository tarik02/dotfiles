mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"

ln -sf "$DOTFILES/zsh/dircolors" "$ZDOTDIR/dircolors"

if [[ "$(getent passwd $(id -un) | awk -F : '{print $NF}')" != *'/zsh' ]]; then
    ask_yn "Change shell to zsh?" && chsh -s "$(which zsh)" "$USER"
fi
