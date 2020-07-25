set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'tomasiser/vim-code-dark'

"---------=== Code/project navigation ===-------------
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/unite.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'

" Markdown
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'iamcco/markdown-preview.nvim'

filetype plugin indent on

syntax on
set scrolloff=1
"set termguicolors
colorscheme codedark
"highlight Normal ctermbg=None

set enc=utf-8
set ls=2
set mouse=a
set splitbelow
set number
set nofoldenable    " disable folding
" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80

" Short keys
nmap <F8> :TagbarToggle<CR>
nmap <F3> :bprev<CR>
nmap <F4> :bnext<CR>
map <F5> i -- Andrey Lalaev <a.lalaev@metrotek.ru> <esc>:r !date -R <CR>i<Backspace> <esc>

set omnifunc=syntaxcomplete#Complete
:autocmd InsertEnter,InsertLeave * set cul!

set pumheight=7
set completeopt-=preview
let g:airline#extensions#tabline#enabled=1
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/' } }
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

"auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        return "{\<Enter>};\<Esc>O"
    elseif searchpair('(', '', ')', 'bmn', '', line('.'))
        " Probably inside a function call. Close it off.
        return "{\<Enter>});\<Esc>O"
    else
        return "{\<Enter>}\<Esc>O"
    endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

setlocal formatprg=hindent

set t_Co=256

let g:mkdp_browser = 'safari'
