if [ -f $DFI_THIRDPARTY/direnv/direnv ]; then
  eval "$($DFI_THIRDPARTY/direnv/direnv hook zsh)"
  export PATH="$DFI_THIRDPARTY/direnv:$PATH"
fi
