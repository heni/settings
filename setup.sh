#!/usr/bin/env bash
set -eu -o pipefail

pushd $(dirname $0)

cp -r .vimrc ~/.vimrc
touch ~/.viminfo
chown ${USER} ~/.vimrc ~/.viminfo

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    pushd ~/.vim/bundle/Vundle.vim
    git pull
    popd
fi
popd
