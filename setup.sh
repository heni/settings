#!/usr/bin/env bash
set -eu -o pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_deps() {
    sudo apt-get install -y \
        ripgrep fzf clangd clang-format clang-tidy shellcheck chktex jq

    pipx install ruff
    pipx install mypy

    if command -v rustup >/dev/null 2>&1; then
        rustup component add rust-analyzer rust-src
    fi
    if command -v go >/dev/null 2>&1; then
        go install golang.org/x/tools/gopls@latest
    fi
}

install_vimrc_classic() {
    cp "${SCRIPT_DIR}/.vimrc.classic" "$HOME/.vimrc"
    touch "$HOME/.viminfo"

    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git \
            "$HOME/.vim/bundle/Vundle.vim"
    else
        git -C "$HOME/.vim/bundle/Vundle.vim" pull
    fi

    vim +PluginInstall +qall
}

install_vimrc_modern() {
    cp "${SCRIPT_DIR}/.vimrc.modern" "$HOME/.vimrc"
    touch "$HOME/.viminfo"

    mkdir -p "$HOME/.vim/autoload"

    if [ ! -d "$HOME/.vim/vim-plug" ]; then
        git clone --depth 1 https://github.com/junegunn/vim-plug.git \
            "$HOME/.vim/vim-plug"
    else
        git -C "$HOME/.vim/vim-plug" pull
    fi
    ln -sf "$HOME/.vim/vim-plug/plug.vim" "$HOME/.vim/autoload/plug.vim"

    vim +PlugInstall +qall
}

install_vimrc_minimal() {
    cp "${SCRIPT_DIR}/.vimrc.minimal" "${HOME}/.vimrc"
    touch "${HOME}/.viminfo"
}

case "${1:-}" in
    --classic)
        install_deps
        install_vimrc_classic
        ;;
    --modern|"")
        install_deps
        install_vimrc_modern
        ;;
    --minimal)
        install_vimrc_minimal
        ;;
    -h|--help)
        echo "Usage: $0 [--classic | --modern]"
        exit 0
        ;;
    *)
        echo "Unknown option: $1" >&2
        echo "Usage: $0 [--classic | --modern]" >&2
        exit 2
        ;;
esac
