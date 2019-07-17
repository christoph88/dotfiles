"
"
"{{{ Plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'Lokaltog/vim-easymotion' " Easily move around
Plug 'airblade/vim-gitgutter' "Add git gutter to easily see changes
Plug 'christoomey/vim-tmux-navigator' " seamless tmux window navigation
Plug 'ervandew/supertab' " Use autocomplete everywhere
Plug 'kien/ctrlp.vim' " Fuzzy Finder
Plug 'scrooloose/nerdcommenter' " Easily create comments
Plug 'scrooloose/syntastic' " Syntax highlighter
Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'tpope/vim-surround' " Easily surround text with quotes etc.
Plug 'vim-airline/vim-airline' " Added airline plugin
Plug 'vim-airline/vim-airline-themes' " Added airline plugin
Plug 'w0rp/ale' " code autoformatting
Plug 'yggdroot/indentline' " add indentlines

" Initialize plugin system
call plug#end()
" }}}
"{{{ Gui options
syntax on
colorscheme desert
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

" autoclose
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "
inoremap ""     ""
inoremap '      ''<Left>
inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '
inoremap ''     ''
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

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
" {{{ Google Big Query
" first read js file for udfs merge in query.sql
" then read sql file and add to query.sql
" always query query.sql
"nnoremap <leader>q :execute 'pedit bq <bar> wincmd p <bar> 0read ! cat ' expand('%:t:r').'.js > query.sql; cat 'expand('%:t:r').'.sql >> query.sql; ' 'bq query --dry_run --use_legacy_sql=false < query.sql'<cr> 
"nnoremap <leader><leader>q :execute 'pedit bq <bar> wincmd p <bar> 0read ! cat ' expand('%:t:r').'.js > query.sql; cat 'expand('%:t:r').'.sql >> query.sql; ' 'bq query --use_legacy_sql=false < query.sql'<cr> 
"command Bqhelp :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq help '
"command -nargs=1 Bqls :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq ls <f-args>'
"command  Bqlsa :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq ls'
"command -nargs=1 Bqshow :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq show <f-args>'
" }}}
" {{{ Airline
set laststatus=2
" }}}
" {{{ ale
" fix files with prettier, and then eslint.
let b:ale_fixers = {'javascript': ['prettier','eslint'], 'sql': ['sqlfmt']}
" set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" enable completion where available.
" this setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
" }}}
