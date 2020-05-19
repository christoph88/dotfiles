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

" theme and display
Plug 'marcopaganini/termschool-vim-theme'
Plug 'vim-airline/vim-airline' " Added airline plugin
Plug 'vim-airline/vim-airline-themes' " Added airline plugin
Plug 'airblade/vim-gitgutter' "Add git gutter to easily see changes

" files, search and motions
Plug 'Lokaltog/vim-easymotion' " Easily move around
Plug 'christoomey/vim-tmux-navigator' " seamless tmux window navigation
Plug 'https://github.com/scrooloose/nerdtree.git' " Nerdtree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" git
Plug 'tpope/vim-fugitive' " Vim git integration

" development tools
Plug 'neoclide/coc.nvim', {'branch': 'release'} " vscode like autocompletion
Plug 'yggdroot/indentline' " add indentlines
Plug 'tpope/vim-surround' " Easily surround text with quotes etc.
Plug 'tpope/vim-repeat' " Repeat vim surround using \. command.
Plug 'scrooloose/nerdcommenter' " Easily create comments

" html tools
Plug 'mattn/emmet-vim' " html autoexpand
Plug 'tmhedberg/matchit' " html % matching

" db querying
Plug 'tpope/vim-dadbod' " db querying

" Initialize plugin system
call plug#end()
" }}}
"
"{{{ Gui options
syntax on
colorscheme termschool
filetype indent on
set number
set showcmd
set wildmenu
nmap ; :
" }}}

" {{{ Editor options
set clipboard=unnamed
set t_BE=
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
" {{{ Emmet
let g:user_emmet_leader_key=','
" }}}
" {{{ Coc
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <tab> and shift <tab> to navigate list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <cr> to confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"" }}}
" }}}
" {{{ FZF
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>H :Helptags!<CR>
" }}}
" {{{ NerdTree
map <F2> :NERDTreeToggle<CR>
" }}}
" {{{ Cheat
fun! Cheat()
  
    echo "<leader>cd                  pwd change to current directory"

    echo "B                           move to beginning of line"
    echo "E                           move to end of line"

    echo "<leader><leader>            emmet completion"

    echo "<leader>f :gfiles<cr>       open gitfiles"
    echo "<leader>F :files<cr>        open filesystem"
    echo "<leader>b :buffers<cr>      open buffers"
    echo "<leader>h :history<cr>      open history"
    echo "<leader>t :btags<cr>        open buffer tags"
    echo "<leader>t :tags<cr>         open tags"
    echo "<leader>l :blines<cr>       open buffer lines"
    echo "<leader>l :lines<cr>        open lines"
    echo "<leader>' :marks<cr>        open marks"
    echo "<leader>h :helptags!<cr>    open helptags"
endf

noremap <F3> :call Cheat() <CR>
" }}}
