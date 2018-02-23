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

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

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
nnoremap <leader>q :execute 'new <bar> 0read ! bq query --dry_run < ' expand('%')<cr> 
nnoremap <leader><leader>q :execute 'new <bar> 0read ! bq query < ' expand('%')<cr> 
command Bqhelp :execute 'new <bar> 0read ! bq help '
command -nargs=1 Bqls :execute 'new <bar> 0read ! bq ls <f-args>'
command  Bqlsa :execute 'new <bar> 0read ! bq ls'
command -nargs=1 Bqshow :execute 'new <bar> 0read ! bq show <f-args>'
" }}}
" {{{ Code beautify
"pip install sqlparse
command Btfsql :%!
autocmd FileType sql setlocal equalprg=sqlformat\ --reindent\ --keywords\ upper\ --identifiers\ lower\ -
"pip install jsbeautifier
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
" }}}
