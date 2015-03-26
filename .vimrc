set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'Lokaltog/vim-easymotion' " Easily move around
Plugin 'scrooloose/nerdtree' " File tree browser
Plugin 'scrooloose/nerdcommenter' " Easily create comments
Plugin 'scrooloose/syntastic' " Syntax highlighter
Plugin 'tpope/vim-surround' " Easily surround text with quotes etc.
Plugin 'ervandew/supertab' " Use autocomplete everywhere
Plugin 'Valloric/MatchTagAlways' " Match the closing tag
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " Expand html tags
Plugin 'jeffkreeftmeijer/vim-numbertoggle' " Use ctrl+n to switch between numbering styles

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

" gui options
color codeschool
syntax on
filetype indent on
let g:NERDTreeWinPos = "left"
set number
set relativenumber
set cursorline
set cursorcolumn
set showcmd
set lazyredraw

" Store swap files in fixed location, not current directory.
set directory=~/.vimswap//
set backupdir=~/.vimbackup//

" editor options
:let mapleader="," " set leader button to ,
set clipboard=unnamed " system clipboard as default buffer
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
runtime macros/matchit.vim
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" Press ii to exit insert mode.
imap ii <Esc>

" search options
set ic " ignore case
set hls is " set highlighting
set incsearch " search as chars are entered
set hlsearch " highlight matches

" plugin options
map <silent> <F2> :NERDTreeToggle<CR>

" search visual selection
function! GetVisual() range
    let reg_save = getreg('"')
    let regtype_save = getregtype('"')
    let cb_save = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', reg_save, regtype_save)
    let &clipboard = cb_save
    return selection
endfunction

vmap <leader>z :%s/<c-r>=GetVisual()<cr>/
