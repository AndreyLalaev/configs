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
"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

Plugin 'ericcurtin/CurtineIncSw.vim' "switcher between .c and .h files (but i dont use it)
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Shougo/unite.vim'

Plugin 'davidhalter/jedi-vim' "Python autocompletion



filetype plugin indent on

syntax on
set scrolloff=1
set termguicolors
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

set mouse=a
set splitbelow
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80

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

let mapleader='\'
nnoremap <leader>q :bd<CR>
:autocmd InsertEnter,InsertLeave * set cul!
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
if !exists('g:ycm_semantic_triggers')
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.c = ['re!(?=[a-zA-Z_]{3})']

set pumheight=7
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 5

let g:airline#extensions#tabline#enabled=1
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1

"let g:airline_theme='dark theme with powerline symbols'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/' } }


