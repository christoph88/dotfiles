" auto-install vim-plug
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" gui options
syntax on
colorscheme habamax
filetype indent on
set number
set showcmd
set wildmenu
nmap ; :

" editor options
set clipboard=unnamed
set t_BE=
:let mapleader="," " set leader button to ,
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set exrc " read .vimrc from current directory
autocmd BufEnter * :syntax sync fromstart

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" press ii to exit insert mode.
imap ii <Esc>

" split navigation handled by vim-tmux-navigator plugin
" (provides seamless Ctrl+H/J/K/L between vim splits and tmux panes)
nnoremap <Leader>w <C-w>

" store swap files in fixed location, not current directory.
set directory=~/.vimswap//
set backupdir=~/.vimbackup//

" shortcut to move to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" search options
set ic " ignore case
set hls is " set highlighting
set incsearch " search as chars are entered
set hlsearch " highlight matches
