syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'heni/restore_vim_cursor'
Plugin 'derekwyatt/vim-scala'
Plugin 'git://repo.or.cz/vcscommand.git'
Plugin 'python_fold_compact'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
call vundle#end()
filetype on

"nerdtree settings
nnoremap <C-T> :NERDTreeToggle<CR> 

"vim-airline settings
set laststatus=2
let g:airline_theme="silver"

"restore_vim_cursor settings
set viminfo='10,\"100,:20,%,n~/.viminfo
