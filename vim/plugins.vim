call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Tools
  Plug 'airblade/vim-gitgutter'
    " ]c - next hunk
    " [c - prev hunk
    " <leader>hs - stage hunk
    " <leader>hu - unstage hunk
    " <leader>hp - preview hunk changes
  Plug 'editorconfig/editorconfig-vim' " editor configuration
  Plug 'rizzatti/dash.vim'             " Dash.app
  Plug 'scrooloose/nerdtree'           " file and dir list
    Plug 'Xuyuanp/nerdtree-git-plugin' " show git status in nerdtree
  Plug 'svermeulen/vim-easyclip'       " clipboard support
    " lots of mappings: https://github.com/svermeulen/vim-easyclip#default-key-mappings TODO
    Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'            " vim surround
    " cs and more mappings: https://github.com/tpope/vim-surround#surroundvim TODO
  Plug 'tpope/vim-dispatch'            " dispatch to shell
  Plug 'tpope/vim-eunuch'              " UNIX helpers
    " https://github.com/tpope/vim-eunuch#eunuchvim
  Plug 'nelstrom/vim-visual-star-search' " visual select & search
  Plug 'mileszs/ack.vim'
    " https://github.com/mileszs/ack.vim#usage
  Plug 'tyok/nerdtree-ack'
  Plug 'qpkorr/vim-bufkill'            " buffer manager without closing splits
  Plug 'tpope/vim-fugitive'            " illegal git wrapper
    " Nice stuff to stage code
    " https://github.com/tpope/vim-fugitive#screencasts
    Plug 'tpope/vim-rhubarb' " makes Gbrowse work
  Plug 'junegunn/vim-easy-align'
    " https://github.com/junegunn/vim-easy-align#quick-start-guide

  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'                " close tags in ruby
  Plug 'vim-airline/vim-airline'          " airline
  Plug 'vim-airline/vim-airline-themes'   " theme for airline
  Plug 'vim-scripts/Gist.vim'             " vimscript for gist
  Plug 'vim-scripts/taglist.vim'          " tag list
  Plug 'janko-m/vim-test'                 " test launcher
  Plug 'w0rp/ale'                         " lint engine
  Plug 'danchoi/ruby_bashrockets.vim'     " toggle hash style Bashrockets Hashrockets
    " C-j C-k to navigate between errors

  " tmux
  Plug 'christoomey/vim-tmux-navigator'   " C-hjkl navigation
  Plug 'melonmanchan/vim-tmux-resizer'    " M-hjkl resizing
  Plug 'keith/tmux.vim'                   " syntax highlight for tmux

  " Other
  Plug 'altercation/vim-colors-solarized'
    " ToggleBG
  Plug 'slim-template/vim-slim'           " syntax highlight for slim template
  Plug 'mtscout6/vim-cjsx'                " syntax highlight for cjsx
  Plug 'mxw/vim-jsx'                      " syntax highlight for react jsx
  Plug 'gabrielelana/vim-markdown'        " syntax highlight for markdown and support
  Plug 'kchmck/vim-coffee-script'         " syntax highlight for coffeescript and support
  Plug 'chrisbra/Colorizer'               " colors stuff
  Plug 'KabbAmine/vCoolor.vim'            " colors picker
  " Plug 'flomotlik/vim-livereload'         " reload browser on save
  " Elixir
  " Plug 'elixir-lang/vim-elixir'
  " Plug 'mattreduce/vim-mix'

  " Go
  " Plug 'fatih/vim-go'

  " TODO
  Plug 'tpope/vim-unimpaired'
  " https://github.com/tpope/vim-commentary
  " https://github.com/tomtom/tcomment_vim
  " https://github.com/sheerun/vim-polyglot
  " https://github.com/tpope/vim-sleuth       - automatic identation
  " https://github.com/wellle/targets.vim     - additional text objects
  " https://github.com/terryma/vim-expand-region
call plug#end()

colorscheme solarized
call togglebg#map("<F5>") " TODO: remove mapping

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" https://github.com/scrooloose/nerdtree
" :help nerdtree
let g:NERDTreeShowHidden = 1

" https://github.com/vim-airline/vim-airline
" :help airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
  let g:airline_theme = 'cool'


" https://github.com/junegunn/fzf.vim
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" https://github.com/scrooloose/syntastic
" Add all recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" make test commands execute using dispatch.vim
let test#strategy = 'dispatch'
let g:test#preserve_screen = 1 " TODO: check this is working
" TODO: add option to run suite with coverage
"let test#ruby#rspec#options = {
"  \ 'nearest': '--backtrace',
"  \ 'file':    '--format documentation',
"  \ 'suite':   '--tag ~slow',
"\}

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2


let g:ale_fixers = {
\   'ruby': ['rails_best_practices', 'rubocop', 'ruby', 'brakeman', 'reek'],
\}
let g:airline#extensions#ale#enabled = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  "let g:ag_lhandler="topleft lopen"
endif
