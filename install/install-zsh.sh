mkdir -p "$ZDOTDIR"

cat "$DOTFILES/zsh/zshenv" | sed "s|^export DOTFILES=.*$|export DOTFILES=\"${DOTFILES}\"|g" > "$HOME/.zshenv"
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
    ask_yn "Change shell to zsh?" && sudo chsh -s "$(which zsh)" "$USER"
fi
