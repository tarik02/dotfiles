#!/usr/bin/env bash

set -e


###############################################################################
# zinit
###############################################################################
mkdir -p $DFI_THIRDPARTY/zinit
git clone https://github.com/zdharma/zinit.git $DFI_THIRDPARTY/zinit/bin
zsh -c "source $DFI_THIRDPARTY/zinit/bin/zinit.zsh; zinit module build"


###############################################################################
# starship.rs
###############################################################################
mkdir -p "$DFI_THIRDPARTY/starship/bin"
curl -fsSL https://starship.rs/install.sh | bash -s - --yes --bin-dir "$DFI_THIRDPARTY/starship/bin" > /dev/null


###############################################################################
# Tmux Plugin Manager
###############################################################################
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi


###############################################################################
# vim-plug
###############################################################################
if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
	curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
