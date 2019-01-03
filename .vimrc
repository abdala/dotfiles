set nocompatible   " Disable vi-compatibility

execute pathogen#infect()
call pathogen#helptags()

let mapleader=","               " Change the leader to be a comma vs slash

syntax on

" colorscheme xoria256
set guifont=menlo\ for\ powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " Save on buffer switch
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" ================ Turn Off Swap Files ==============

set noswapfile
"set nobackup
"set nowb

" ================ Windows ==========================

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current"
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set sidescrolloff=15
set sidescroll=1

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

" Open splits
nmap vv :vsplit<cr>
nmap ss :split<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Quickly close the current window
nnoremap qq :q<CR>

" Quickly save
nnoremap <leader>w :w<CR>
"inoremap ww <Esc>:w<cr>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj')
inoremap jj <Esc>

"Moving in tabs"
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>

" <C-p> or <C-t> to search files"
nnoremap <silent> <leader>, :CtrlPMixed<cr>

" <M-p> for open buffers
nnoremap <silent> <leader>. :CtrlPBuffer<cr>

" <M-S-p> for MRU
"nnoremap <silent> <leader>/ :CtrlPMRU<cr>

" Paste from clipboard
nmap <silent> <leader>p :r !xsel -p<cr>

nmap <silent> <leader>/ :TagbarToggle<CR>

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let NERDTreeQuitOnOpen=1

set undofile                 "turn on the feature  
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored

