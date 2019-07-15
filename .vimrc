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

Plugin 'tomasiser/vim-code-dark'

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

Plugin 'ericcurtin/CurtineIncSw.vim' "switcher between .c and .h files (but i dont use it)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Shougo/unite.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'davidhalter/jedi-vim' "Python autocompletion

" Multicursor settings
"normal mode / visual mode
"start: <C-n> start multicursor and add a virtual cursor + selection on the match
"next: <C-n> add a new virtual cursor + selection on the next match
"skip: <C-x> skip the next match
"prev: <C-p> remove current virtual cursor + selection and go back on previous match
"select all: <A-n> start muticursor and directly select all matches
"You can now change the virtual cursors + selection with visual mode commands.
"For instance: c, s, I, A work without any issues. You could also go to normal mode by pressing v and use normal commands there.
"
"At any time, you can press <Esc> to exit back to regular Vim.
"
" NOTE: start with g<C-n> to match without boundaries (behaves like g* instead of *)
"
"visual mode when multiple lines are selected
"start: <C-n> add virtual cursors on each line
"You can now change the virtual cursors with normal mode commands. For instance: ciw.
"
filetype plugin indent on

syntax on
set scrolloff=1
set termguicolors
colorscheme codedark
highlight Normal ctermbg=None

set mouse=a
set splitbelow
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80

" Short keys
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F3> :bprev<CR>
nmap <F4> :bnext<CR>
nmap <C-e> :YcmCompleter GoToInclude<CR>
nmap <C-r> :YcmCompleter GoToDefinitionElseDeclaration<CR>


:autocmd InsertEnter,InsertLeave * set cul!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
if !exists('g:ycm_semantic_triggers')
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.c = ['re!(?=[a-zA-Z_]{3})']

set pumheight=7
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 5
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
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDCustomDelimiters={ 'c': { 'left': '/**','right': '*/' } }

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Kernel autocompletion 

"-------------------------------------------------------------------------------
" OmniCppCompletion plugin
"-------------------------------------------------------------------------------

" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete
" 
" " Configure menu behavior
" " http://vim.wikia.com/wiki/VimTip1386
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" 
" " Use Ctrl+Space for omni-completion
" " http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"   \ "\<lt>C-n>" :
"   \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"   \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"   \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>
" 
" " Popup menu hightLight Group
" highlight Pmenu ctermbg=13 guibg=LightGray
" highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" 
" " enable global scope search
" let OmniCpp_GlobalScopeSearch = 1
" " show function parameters
" let OmniCpp_ShowPrototypeInAbbr = 1
" " show access information in pop-up menu
" let OmniCpp_ShowAccess = 1
" " auto complete after '.'
" let OmniCpp_MayCompleteDot = 1
" " auto complete after '->'
" let OmniCpp_MayCompleteArrow = 1
" " auto complete after '::'
" let OmniCpp_MayCompleteScope = 0
" " don't select first item in pop-up menu
" let OmniCpp_SelectFirstItem = 0
" 
