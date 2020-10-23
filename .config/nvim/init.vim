" colorscheme iceberg
colorscheme nord

set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set number
set ruler

set tabstop=2
set shiftwidth=2
set expandtab

set title
set showmatch
set autoindent
set smartindent
set smarttab
set cursorline

set encoding=utf-8

set list
set listchars=tab:»-,space:-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set laststatus=2
set t_Co=256

set laststatus=2

set nocompatible

set hidden


" <Leader> をspaceキーに割り当てる
let mapleader = "\<Space>"
" <LocalLeader>を_に割り当てる
let maplocalleader = "\<Space>"

" normal modeでEnterで改行を挿入
nnoremap <C-i> i<CR><ESC>

" normal modeでCtrl+oで改行を挿入
nnoremap <C-o> o<ESC>

" insert modeで文途中で改行を挿入
inoremap <C-o> <ESC>o

" ======================== ウィンドウ関連のkeymap ========================
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>


" ===========
" Plugins
" ===========

augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END
command! -nargs=0 PluginUpdate call dein#update()

let s:dein_dir = expand('$HOME/.config/nvim/bundle/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo.dein.vim'

    if !isdirectory(s:dein_repo_dir)
        execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_repo_dir)
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif

let g:dein#install_pax_processed = 48

let s:toml_file = '~/.config/nvim/dein.toml'
let s:toml_lazy_file = '~/.config/nvim/dein_lazy.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml(s:toml_file, {'lazy': 0})
    call dein#load_toml(s:toml_lazy_file, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
