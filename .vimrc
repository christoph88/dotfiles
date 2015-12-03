" vim:fdm=marker
"
"
"
" {{{ Vundle setup
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

Plugin 'altercation/vim-colors-solarized' " Solarized vim theme
Plugin 'Lokaltog/vim-easymotion' " Easily move around
Plugin 'scrooloose/nerdtree' " File tree browser
Plugin 'scrooloose/nerdcommenter' " Easily create comments
Plugin 'scrooloose/syntastic' " Syntax highlighter
Plugin 'tpope/vim-surround' " Easily surround text with quotes etc.
Plugin 'ervandew/supertab' " Use autocomplete everywhere
Plugin 'Valloric/MatchTagAlways' " Match the closing tag
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " Expand html tags
Plugin 'kien/ctrlp.vim' " Fuzzy Finder
Plugin 'tpope/vim-fugitive' " Vim git integration
Plugin 'bling/vim-airline' " Added airline plugin
Plugin 'sjl/gundo.vim' " Added gundo plugin
Plugin 'docunext/closetag.vim' " Close html tags
Plugin 'chrisbra/Colorizer' " Colorize rgb and hex values 
Plugin 'godlygeek/tabular' " Automatically align with tabs
Plugin 'SirVer/ultisnips' " Add snippets for programming
Plugin 'christoomey/vim-tmux-navigator' " seamless tmux window navigation

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
" }}}
"{{{ Gui options
syntax on
filetype indent on
let g:NERDTreeWinPos = "left"
set number
set cursorline
set cursorcolumn
set showcmd
set lazyredraw
let g:solarized_bold=1
let g:solarized_italic=1
let g:solarized_underline=1
set background=dark
colorscheme solarized

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
" }}}
" {{{ Editor options
:let mapleader="," " set leader button to ,
set clipboard=unnamed " system clipboard as default buffer
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
runtime macros/matchit.vim
" open all splits horizontally
set splitright
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

" Stamping
nnoremap <leader>p diw"0P

" Store swap files in fixed location, not current directory.
set directory=~/.vimswap//
set backupdir=~/.vimbackup//
" Add ctags from ruby gem
set tags+=gems.tags
" }}}
" {{{ Search options
set ic " ignore case
set hls is " set highlighting
set incsearch " search as chars are entered
set hlsearch " highlight matches
" search and replace for selected text
vnoremap <leader>r "hy:%s/<C-r>h//g<left><left><left>
" show lines for selected text
vnoremap <leader>f "hy:g/<C-r>h/
" }}}
" {{{ NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
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
let g:airline_theme='solarized'
" }}}
" {{{ Gundo
nnoremap <F3> :GundoToggle<CR>
" }}}
" {{{ Tabularize
nmap <leader>t& :Tabularize /&<CR>
vmap <leader>t& :Tabularize /&<CR>
nmap <leader>t= :Tabularize /^[^=]*\zs=<CR>
vmap <leader>t= :Tabularize /^[^=]*\zs=<CR>
nmap <leader>t=> :Tabularize /=><CR>
vmap <leader>t=> :Tabularize /=><CR>
nmap <leader>t: :Tabularize /:<CR>
vmap <leader>t: :Tabularize /:<CR>
nmap <leader>t:: :Tabularize /:\zs<CR>
vmap <leader>t:: :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,<CR>
vmap <leader>t, :Tabularize /,<CR>
nmap <leader>t,, :Tabularize /,\zs<CR>
vmap <leader>t,, :Tabularize /,\zs<CR>
nmap <leader>t<Bar> :Tabularize /<Bar><CR>
vmap <leader>t<Bar> :Tabularize /<Bar><CR>
" }}}
" {{{ Colorizer
  let g:colorizer_auto_filetype='css,html,scss,html.erb'
" }}}
" {{{ ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
