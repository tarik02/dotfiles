#!/usr/bin/env bash

set -e


###############################################################################
# zinit
###############################################################################
if [ ! -d $DFI_THIRDPARTY/zinit ]; then
	mkdir -p $DFI_THIRDPARTY/zinit
	git clone https://github.com/zdharma-continuum/zinit.git $DFI_THIRDPARTY/zinit/bin
	zsh -c "source $DFI_THIRDPARTY/zinit/bin/zinit.zsh; zinit module build"
fi


###############################################################################
# starship.rs
###############################################################################
if [ ! -d $DFI_THIRDPARTY/starship/bin ]; then
	mkdir -p "$DFI_THIRDPARTY/starship/bin"
	curl -fsSL https://starship.rs/install.sh | bash -s - --yes --bin-dir "$DFI_THIRDPARTY/starship/bin" > /dev/null
fi


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


###############################################################################
# thefuck
###############################################################################
if command -v pip3 &> /dev/null; then
	pip3 install thefuck
fi


###############################################################################
# fzf
###############################################################################
if [ ! -d $HOME/.fzf ] && command -v git &> /dev/null; then
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
	$HOME/.fzf/install --key-bindings --completion --no-update-rc
fi
