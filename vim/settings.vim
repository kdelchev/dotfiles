set encoding=utf-8 nobomb

set nobackup      " no backup files
set nowritebackup " no backup file while editing
set noswapfile    " no swap files

set autoread      " read file if changed outside vim
set autowrite     " write buffers
set autowriteall  " write buffers

set list                           " show special characters :help listchars
set listchars=tab:▸·,eol:¬,trail:● " symbol settings for special characters
set backspace=indent,eol,start     " liberal backspacing in insert mode

" tabstop == softtabstop - work with tabs
" softtabstop == shiftwidth - work with spaces
set tabstop=2     " width of a tab character§
set softtabstop=2 " set the amount of space to be inserted
set shiftwidth=2  " set the amount of space to add/remove when indenting
set expandtab     " use spaces instead tab characters
set smarttab      " insert blanks in front of a line
set smartindent   " smart autoindent on new line
set shiftround    " round indent to multiple of shiftwidth

if has("autocmd")
  " :set filetype? /. ft?
  " :set filetype=xml

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=80
  autocmd FileType markdown setlocal textwidth=80
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=2 sts=2 sw=2 expandtab

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off
  autocmd! FileType *.slim set sw=2 sts=2 expandtab

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=
  autocmd BufLeave,FocusLost * silent! wall

  "autocmd BufWritePre *.rb,*.js :call <SID>StripTrailingWhitespaces()

  " Set md to markdown, not module2
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif

set background=dark
set hlsearch " highlight previous search
syntax sync fromstart " TODO: check this setting
syntax on    " switch syntax highlighting on, when the terminal has colors


if executable('ag')
  "let g:ackprg = 'ag --vimgrep'
  "let g:ackprg = 'ag --vimgrep --smart-case'
  "cnoreabbrev ag Ack
  "cnoreabbrev aG Ack
  "cnoreabbrev Ag Ack
  "cnoreabbrev AG Ack

  set grepprg=ag\ --nogroup\ --nocolor
endif

set autoindent  " copy indentation from current line when starting new line
set ignorecase smartcase " ignore case if all caps are the same
set incsearch   " show pattern as you type
set hidden      " allows buffers to be switched without saving

hi Search ctermbg=Yellow ctermfg=Black

set laststatus=2    " always show statusline
set ruler           " always show cursor position
set showmode        " display curent mode
set showcmd         " display incomplete commands
"set relativenumber  " show relative number (hybrid mode)
set number          " show line numbers

set wildmenu
set wildignore=.keep,coverage,node_modules,tmp
set nowrap                      " break by words
set showmatch                   " show matching brackets when hovering
set viminfo='25,\"50,n~/.vim/.viminfo
set splitright

set history=100
set ttyfast

set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set undofile                  " save undo's after file closes
set undodir=$HOME/.vim/undo   " where to save undo histories
set undolevels=1000           " how many undos
set undoreload=10000          " number of lines to save for undo
set clipboard=unnamed         " used by easyclip to specify which clipboard to use
set textwidth=120
set colorcolumn=+1
highlight ColorColumn ctermbg=gray "set to whatever you like
set cursorline                " highlight current line
set showtabline=2             " Always show tab bar at the top
set shell=zsh

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
set re=1

" This should make vertical split resize depending on focus
"set winwidth=85
"set winminwidth=20
"set winheight=15
"set winminheight=5
set complete-=t
set matchtime=1
set timeoutlen=1000 ttimeoutlen=0

set cursorcolumn
