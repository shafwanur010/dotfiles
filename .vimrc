syntax on
filetype plugin indent on

set belloff=all
set background=dark
set termguicolors
set guifont=Consolas
set number relativenumber
set cindent autoindent
set smartindent
set noswapfile
set tabstop=2 expandtab shiftwidth=2
set scrolloff=15
set nowrap
set backspace=indent,eol,start
set splitright
set incsearch
set guioptions-=m
set guioptions-=T
set guioptions-=r

call plug#begin('~/vimfiles/plugged')

Plug 'nvie/vim-flake8'
Plug 'eemed/sitruuna.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

let mapleader = " "
colorscheme sitruuna

nnoremap yank ggVG"+y
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader><Left> :bp!<CR>
nnoremap <leader><Right> :bn!<CR>

vmap <C-c> "+y
nmap <C-a> ggVG
imap <C-a> <esc><C-a>
imap <C-v> <esc>"+pa
nmap <C-b> :w <CR>
imap <C-b> <esc><C-b>

" Python
autocmd FileType python nmap <buffer> <C-b> :w <bar> call flake8#Flake8()<CR>
autocmd FileType python imap <buffer> <C-b> <esc><C-b>
autocmd FileType python nnoremap <buffer> <leader>new VGdi

" CP
  "Compile
let &makeprg='g++ -std=c++14 -DLOCAL % -o %<'
autocmd FileType c,cpp nmap <buffer> <C-b> :w\|make\|redraw!\|cw<CR>
autocmd FileType c,cpp imap <buffer> <C-b> <esc><C-b>

  "Directories
let $cp = '~\Documents\CP'
let $T = $cp . '\src\snippets'

  "Snippets
nnoremap <leader>gameon :edit $cp\test.cpp<CR>:e $cp\code.cpp<CR>

  "C++
autocmd FileType c,cpp nnoremap <buffer> <leader>new :-1read $T\main.cpp<CR>18jVGdk<bar>:%s#-1#\=strftime("%d/%m/%Y %X (%Z)")#<CR>14jo
autocmd FileType c,cpp nnoremap <buffer> <leader>dbg :-1read $T\debug.cpp<CR>gg
