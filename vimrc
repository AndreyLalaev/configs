set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()            " required
filetype plugin indent on    " required
"
" Put your non-Plugin stuff after this line
Plugin 'tomasiser/vim-code-dark'

"---------=== Code/project navigation ===-------------
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/unite.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'

" FOR FUNCTION HIGHLIGHT https://vimawesome.com/plugin/vim-cpp-enhanced-highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'godlygeek/tabular'

syntax on
set scrolloff=1
colorscheme codedark

set enc=utf-8
set ls=2
set mouse=a
set splitbelow
set number
" disable folding
set nofoldenable

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
set clipboard+=unnamedplus
" Short keys
nmap <F8> :TagbarToggle<CR>
map <F5> i -- Andrew Lalaev <andrey.lalaev@gmail.com> <esc>:r !date -R <CR>i<Backspace> <esc>

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set omnifunc=syntaxcomplete#Complete
:autocmd InsertEnter,InsertLeave * set cul!

set pumheight=7
set completeopt-=preview
" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1

call airline#parts#define('line-info', {
\ 'raw' : '%l/%L:%v',
\ 'accent' : 'bold'})
let g:airline_section_z = airline#section#create(['line-info'])

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

autocmd BufRead,BufNewFile *.vt set filetype=verilog
"auto close {
function! s:CloseBracket()
    let line = getline('.')
    if line =~# '^\s*\(struct\|class\|enum\) '
        "return "{\<Enter>}\<Esc>O"
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
let g:vim_markdown_folding_disabled = 1

autocmd BufRead,BufNewFile *.bb,*.bbappend,*.inc set filetype=sh
