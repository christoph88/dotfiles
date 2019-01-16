" vim:fdm=marker
"
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
filetype indent on
set number
set showcmd
" }}}
" {{{ Editor options
:let mapleader="," " set leader button to ,
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" quit file without saving
command Q :q!

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

" }}}
" {{{ Search options
set ic " ignore case
set hls is " set highlighting
set incsearch " search as chars are entered
set hlsearch " highlight matches
" }}}
" {{{ Google Big Query
nnoremap <leader>q :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq query --dry_run --use_legacy_sql=false < ' expand('%')<cr> 
nnoremap <leader><leader>q :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq query --use_legacy_sql=false < ' expand('%')<cr> 
command Bqhelp :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq help '
command -nargs=1 Bqls :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq ls <f-args>'
command  Bqlsa :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq ls'
command -nargs=1 Bqshow :execute 'pedit bq <bar> wincmd p <bar> 0read ! bq show <f-args>'
" }}}
" {{{ Code beautify
"pip install sqlparse
command Btfsql :%!
autocmd FileType sql setlocal equalprg=sqlformat\ --reindent\ --keywords\ upper\ --use_space_around_operators\ -
"pip install jsbeautifier
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
" }}}
" {{{ CTRLp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" ctrlp use cwd as start
let g:ctrlp_working_path_mode = 'ra'
" enable regex mode on startup
let g:ctrlp_regexp = 1
" ctrlp ignore certain files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" }}}
" {{{ Airline
set laststatus=2
" }}}
" {{{ ale
" fix files with prettier, and then eslint.
let b:ale_fixers = {'javascript': ['prettier','eslint']}
" set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" enable completion where available.
" this setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
" }}}
