syntax on
filetype plugin indent on

set belloff=all
set background=dark
set termguicolors
set guifont=Consolas:h9
set number relativenumber
set cindent autoindent
set smartindent
set noswapfile
set modifiable
set tabstop=2 expandtab shiftwidth=2
set scrolloff=15
set nowrap
set backspace=indent,eol,start
set splitright
set incsearch
set guioptions-=m
set guioptions-=T
set guioptions-=r
set spelllang=en,de

call plug#begin('~/vimfiles/plugged')

Plug 'eemed/sitruuna.vim'
Plug 'tpope/vim-commentary'

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js'
let g:closetag_filenames = '.html,.xhtml,.phtml,.jsx,*.js'
let g:closetag_emptyTags_caseSensitive = 1

Plug 'preservim/nerdtree'


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
autocmd FileType python nnoremap <buffer> <leader>new VGdi

" CP
  "Compile
let &makeprg='g++ -std=c++14 -DLOCAL % -o %<'
autocmd FileType c,cpp nmap <buffer> <C-b> :w\|make\|redraw!\|cw<CR>
autocmd FileType c,cpp imap <buffer> <C-b> <esc><C-b>

  "Directories
let $cp = '~\Documents\cp'
let $T = $cp . '\src\snippets'

  "Variables 
let $kw = 'DATE'

  "C++
autocmd FileType c,cpp nnoremap <buffer> <leader>put :-1read $T\basic.cpp<CR>4jo
autocmd FileType c,cpp nnoremap <buffer> <leader>new :-1read $T\main.cpp<CR>:execute '%s/' . $kw . '/\=strftime("%d.%m.%Y %H:%M:%S")'<CR>gg18jVGdO

" map <leader>D :put =strftime('%d.%m.%Y %H:%M:%S')<CR>

  "Python
autocmd FileType python nnoremap <buffer> <leader>new ggVGdi
  
  "Text Files
autocmd FileType txt set wrap linebreak spell
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set wrap linebreak spell | endif
