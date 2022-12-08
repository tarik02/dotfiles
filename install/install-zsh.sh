mkdir -p "$ZDOTDIR"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"

ln -sf "$DOTFILES/zsh/dircolors" "$ZDOTDIR/dircolors"


case "$OSTYPE" in
    'darwin'*)
        current_shell="$(dscl . -read ~/ UserShell | sed 's/UserShell: //')"
        ;;

    *)
        current_shell="$(getent passwd $(id -un) | awk -F : '{print $NF}')"
        ;;
esac

if [[ "$current_shell" != *'/zsh' ]]; then
    ask_yn "Change shell to zsh?" && chsh -s "$(which zsh)" "$USER"
fi
