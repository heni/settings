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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

Plugin 'vim-scripts/vcscommand.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/local_vimrc'

Plugin 'vim-syntastic/syntastic'
Plugin 'pignacio/vim-yapf-format'

Plugin 'cespare/vim-toml'
Plugin 'chr4/nginx.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tfnico/vim-gradle'
Plugin 'udalov/kotlin-vim'

call vundle#end()
filetype plugin indent on

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

"syntastic setup
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['rust', 'python', 'go'],'passive_filetypes': ['c++'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['python3', 'pyflakes', 'mypy']


"apply local settings
if filereadable(expand("~/.local/.vimrc"))
    source ~/.local/.vimrc
endif

"specific file formatters
function FormatFile()
    let filename = expand("%")
    let extension = fnamemodify(filename, ':e')
    if extension == "py"
        "please setup g:yapf_format_yapf_location to the yapf library location
        call YapfFullFormat()
    elseif extension == "rs"
        call rustfmt#Format()
    else
        let l:lines = "all"
        let l:clang_format_path = expand("~/bin/clang-format.py")
        if filereadable(l:clang_format_path)
            exec "py3file " . l:clang_format_path
        else
            echo "see https://clang.llvm.org/docs/ClangFormat.html#vim-integration for clang-format.py installation"
        endif
    endif
endfunction
