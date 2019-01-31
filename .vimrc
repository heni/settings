syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set autoindent
set nocompatible
set backspace=2

set modelines=5
set mmp=40000

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'heni/restore_vim_cursor'
Plugin 'heni/ToggleCppHeader.vim'
Plugin 'heni/TrimWhiteSpaces.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'python_fold_compact'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tfnico/vim-gradle'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'chr4/nginx.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'
call vundle#end()
filetype on

"nerdtree settings
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <C-R> :NERDTreeFind<CR>
let g:NERDTreeNodeDelimiter="\u00a0"
"open directory
nnoremap <C-U> :e %:p:h<CR>
"goto definition/usage
:map <C-F> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

"vim-airline settings
set laststatus=2
let g:airline_theme="silver"
let g:airline_section_z=airline#section#create(['%3p%%', '%#__accent_bold#%{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#%#__restore__#%#__accent_bold#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__restore__#',':%3v', '(%B)'])

"local_vimrc plugin
let g:local_vimrc = ['.config', '_vimrc_local.vim']

"restore_vim_cursor settings
set viminfo='10,\"100,:20,%,n~/.viminfo

"apply local settings
if filereadable(expand("~/.local/.vimrc"))
    source ~/.local/.vimrc
endif
