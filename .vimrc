syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent
set nocompatible

set modelines=5
set mmp=40000

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'heni/restore_vim_cursor'
Plugin 'derekwyatt/vim-scala'
Plugin 'git://repo.or.cz/vcscommand.git'
Plugin 'python_fold_compact'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tfnico/vim-gradle'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'pearofducks/ansible-vim.git'
call vundle#end()
filetype on

"nerdtree settings
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <C-R> :NERDTreeFind<CR>

"vim-airline settings
set laststatus=2
let g:airline_theme="silver"
let g:airline_section_z=airline#section#create(['%3p%%', '%#__accent_bold#%{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#%#__restore__#%#__accent_bold#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__restore__#',':%3v', '(%B)'])

"restore_vim_cursor settings
set viminfo='10,\"100,:20,%,n~/.viminfo
