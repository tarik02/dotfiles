if command -v kubectl >/dev/null; then
    echo "source <($(which kubectl) completion zsh)"
fi
