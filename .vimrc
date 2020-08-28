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
Plug 'Xuyuanp/nerdtree-git-plugin' " Nerdtree git integration

" development tools
Plug 'neoclide/coc.nvim', {'branch': 'release'} " vscode like autocompletion
Plug 'yggdroot/indentline' " add indentlines
Plug 'tpope/vim-surround' " Easily surround text with quotes etc.
Plug 'tpope/vim-repeat' " Repeat vim surround using \. command.
Plug 'scrooloose/nerdcommenter' " Easily create comments

" database tools
Plug 'tpope/vim-dadbod' " db querying
Plug 'kristijanhusak/vim-dadbod-ui' " db ui

" html tools
Plug 'mattn/emmet-vim' " html autoexpand

" db querying

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
set redrawtime=10000 

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
" {{{ Cheat
fun! Cheat()
  
    echo "<leader>cd                  pwd change to current directory"

    echo "<leader><leader>            emmet completion"

    echo ":%DB                        run db query on selection"
    echo ":DBUI                       get db browsing interface in vim split"

    echo "I                           Open nerdtree in horizontal split"
    echo "S                           Open nerdtree in vertical split"

    echo "CTRL+X                      Open fzf in horizontal split"
    echo "CTRL+V                      Open fzf in vertical split"

    echo "<leader>f :gfiles<cr>       open gitfiles"
    echo "<leader>F :files<cr>        open filesystem"

    echo ":Files                      [PATH] Files (runs $FZF_DEFAULT_COMMAND if defined)"
    echo ":GFiles                     [OPTS]  Git files (git ls-files)"
    echo ":Buffers                    Open buffers"
    echo ":Ag [PATTERN]               ag search result (ALT-A to select all, ALT-D to deselect all)"
    echo ":Rg [PATTERN]               rg search result (ALT-A to select all, ALT-D to deselect all)"
    echo ":Lines                      [QUERY]  Lines in loaded buffers"
    echo ":BLines                     [QUERY] Lines in the current buffer"
    echo ":Tags                       [QUERY] Tags in the project (ctags -R)"
    echo ":BTags                      [QUERY]  Tags in the current buffer"
    echo ":History                    v:oldfiles and open buffers"
    echo ":History:                   Command history"
    echo ":History/                   Search history"
    echo ":Commits                    Git commits (requires fugitive.vim)"
    echo ":BCommits                   Git commits for the current buffer"
    echo ":Commands                   Commands"
    echo ":Maps                       Normal mode mappings"
    echo ":Helptags                   Help tags 1"
    echo ":Filetypes                  File types"

endf

noremap <F4> :call Cheat() <CR>
" }}}
" {{{ Search options
set ic " ignore case
set hls is " set highlighting
set incsearch " search as chars are entered
set hlsearch " highlight matches
" }}}
" {{{ NerdCommenter
let NERDSpaceDelims=1
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

" coc-yank settings
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

let g:coc_global_extensions = [
      \'coc-browser',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-db',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-lists',
      \'coc-markdownlint',
      \'coc-pairs',
      \'coc-python',
      \'coc-sql',
      \'coc-tsserver',
      \'coc-vetur',
      \'coc-vimlsp',
      \'coc-xml',
      \'coc-yank'
      \]
" }}}
" {{{ FZF
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
" }}}
" {{{ NerdTree
map <F2> :NERDTreeToggle<CR>
" }}}
" {{{ DBGUI
map <F3> :DBUIToggle<CR>
" }}}
" {{{ DB per directory
" set database connection for dwh
" let g:db= "postgresql://username:password@host/database"
" disable unsafe commands in project specific .vimrc
set secure
" }}}
