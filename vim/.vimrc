set nocompatible
set encoding=utf-8 nobomb

call plug#begin('~/dotfiles/vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder
Plug 'junegunn/fzf.vim'               " vim fzf plugin
Plug 'airblade/vim-gitgutter'         " shows git status
Plug 'terryma/vim-multiple-cursors'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-ruby/vim-ruby'              " Complie ruby with vim
Plug 'tpope/vim-rails'                " Plugin for rails
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'        " copy to system clipboard
Plug 'thoughtbot/vim-rspec'           " Run rspec inside vim

call plug#end()              " required


let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:airline#extensions#tabline#enabled=1
nmap <silent> <f2> :NERDTreeToggle<cr>


" fzf
" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }

" [Files] Extra options for fzf
"         e.g. File preview using CodeRay (http://coderay.rubychan.de/)
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'


" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'



" APPEARANCE
syntax enable
syntax sync fromstart
set background=dark
color default
colorscheme Monokai

set autoindent      " always set autoindenting on
set autoread        " Auto read
set autowrite
set autowriteall    " Save on buffer switch

set laststatus=2    " always show statusline
set ruler           " always show cursor position
set showmode        " display curent mode
set showcmd         " display incomplete commands
set number          " show line numbers
set list            " visual warnings for unsafe characters
set listchars=tab:▸·,trail:·,nbsp:●

" INTERFACE
set wildmenu
set wildignore=.keep,coverage,node_modules,tmp
set wrap lbr                    " break by words
set backspace=indent,eol,start  " liberal backspacing in insert mode
set showmatch                   " show matching brackets when hovering
set viminfo='25,\"50,n~/.vim/.viminfo
set splitright

" DEFAULT TAB STOPS & INDENTING
set tabstop=4
set softtabstop=2
set shiftwidth=2
set shiftround
set autoindent
set smartindent
set expandtab
set smarttab

set history=50
set smartcase
set ttyfast

" SEARCH
set ignorecase
set incsearch
"set hlsearch
hi Search ctermbg=Yellow ctermfg=Black

" TECHNICAL
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set nobackup                  " no backup files
set nowritebackup             " no backup file while editing
set noswapfile                " no swap files

set undofile                  " save undo's after file closes
set undodir=$HOME/.vim/undo   " where to save undo histories
set undolevels=1000           " how many undos
set undoreload=10000          " number of lines to save for undo
set clipboard=unnamed         " used by easyclip to specify which clipboard to use
set textwidth=80
set colorcolumn=+1

map <C-d> :Files<cr>
map <C-b> :Buffers<cr>
map <C-f> :Ag<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
