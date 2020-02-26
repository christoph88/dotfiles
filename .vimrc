"
"
"{{{ fzf
set rtp+=/usr/local/opt/fzf
" }}}
"{{{ Plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'Lokaltog/vim-easymotion' " Easily move around
Plug 'airblade/vim-gitgutter' "Add git gutter to easily see changes
Plug 'christoomey/vim-tmux-navigator' " seamless tmux window navigation
Plug 'https://github.com/scrooloose/nerdtree.git' " Nerdtree
Plug 'scrooloose/nerdcommenter' " Easily create comments
Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'raimondi/delimitmate' " Autoclose
Plug 'mattn/emmet-vim' " html autoexpand
Plug 'tmhedberg/matchit' " html autoexpand
Plug 'tpope/vim-surround' " Easily surround text with quotes etc.
Plug 'tpope/vim-repeat' " Repeat vim surround using \. command.
Plug 'vim-airline/vim-airline' " Added airline plugin
Plug 'vim-airline/vim-airline-themes' " Added airline plugin
Plug 'w0rp/ale' " code autoformatting
Plug 'ycm-core/YouCompleteMe' " autocompletion plugin
Plug 'yggdroot/indentline' " add indentlines
Plug '/usr/local/opt/fzf' " fzf
Plug 'junegunn/fzf.vim'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'tpope/vim-dadbod' " db querying

" Initialize plugin system
call plug#end()
" }}}
"{{{ Gui options
syntax on
colorscheme termschool
filetype indent on
set number
set showcmd
set wildmenu
set foldenable
set foldnestmax=2
set foldmethod=syntax
nnoremap <space> za
nmap ; :
" }}}

" {{{ Editor options
set clipboard=unnamed
:let mapleader="," " set leader button to ,
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set exrc " read .vimrc from current directory

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Press ii to exit insert mode.
imap ii <Esc>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>w <C-w>

" Store swap files in fixed location, not current directory.
set directory=~/.vimswap//
set backupdir=~/.vimbackup//

" shortcut to move to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" }}}
" {{{ Search options
set ic " ignore case
set hls is " set highlighting
set incsearch " search as chars are entered
set hlsearch " highlight matches
" }}}
" {{{ Airline
set laststatus=2
let g:airline_theme='deus'
" }}}
" {{{ ale
" fix files with prettier, and then eslint.
let b:ale_fixers = {'javascript': ['prettier','eslint'], 'sql': ['pgformatter']}
" set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" enable completion where available.
" this setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
" }}}
" {{{ NerdTree
map <F2> :NERDTreeToggle<CR>
" }}}
