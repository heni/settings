#!/usr/bin/env bash
set -eu -o pipefail

pushd $(dirname $0)
cp -r .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
popd
