declare -A ZINIT
ZINIT[HOME_DIR]=$DFI_THIRDPARTY/zinit
ZINIT[BIN_DIR]=$DFI_THIRDPARTY/zinit/bin
ZINIT[PLUGINS_DIR]=$DFI_THIRDPARTY/zinit/plugins
ZINIT[COMPLETIONS_DIR]=$DFI_THIRDPARTY/zinit/completions
ZINIT[SNIPPETS_DIR]=$DFI_THIRDPARTY/zinit/snippets

source "$DFI_THIRDPARTY/zinit/bin/zinit.zsh"

DFI_INC .zshrc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
