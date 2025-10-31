if command -v mise >/dev/null; then
    echo 'eval "$(mise activate zsh)"'
fi

if [ -d /opt/homebrew/bin ]; then
    echo 'export PATH="/opt/homebrew/bin:$PATH"'
fi

if [ ! -z "${XDG_RUNTIME_DIR:-}" ] && [ -e "unix://$XDG_RUNTIME_DIR/podman/podman.sock" ]; then
    echo 'export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"'
fi
