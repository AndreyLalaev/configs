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
Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'vim-airline/vim-airline'

" Short keys
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F3> :bprev<CR>
nmap <F4> :bnext<CR>
nmap <C-e> :YcmCompleter GoToInclude<CR>
nmap <C-r> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Paste text
:inoremap <C-v> <ESC>"+pa
" Copy text
:vnoremap <C-c> "+y
" Cut text 
:vnoremap <C-d> "+d
" Save file
noremap <ESC><ESC> :update<CR>


nnoremap <leader>q :bp<cr>:bd #<cr>
:autocmd InsertEnter,InsertLeave * set cul!
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

syntax on
set mouse=a
set splitbelow
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_semantic_triggers = { 'c': [ 're!.' ] }
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.c = ['re!(?=[a-zA-Z_]{3})']

set pumheight=7
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 5

let g:airline#extensions#tabline#enabled=1
let g:NERDTreeWinSize=30
colorscheme dracula
"let g:airline_theme='dark theme with powerline symbols'
let g:airline#extensions#tabline#buffer_nr_show = 1


" All settings for brackets
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
inoremap { {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i


" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a
function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction

function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction
