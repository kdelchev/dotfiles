"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
" :map j gg    " maps j -> qq
" :map Q j     " maps Q -> j -> gg
" :noremap W j " maps W -> j
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :Files!<CR>
map <F3> :Ag!<CR>
map <F4> :Buffers!<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clear search highlighting
nmap <silent> <leader>, :nohlsearch<CR>

nnoremap <leader>' :NERDTreeToggle<cr>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>? :NERDTreeFind<CR>

" Move smoothly over wrapped lines
nnoremap j gj
nnoremap k gk

" Spend hitting shift
nnoremap ; :

" Move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resize split with Alt-arrow keys
" iTerm2 Profile->key bindings, load xterm preset
" alt-left ^[^[[A - Up
" alt-left ^[^[[B - Down
" alt-left ^[^[[C - Right
" alt-left ^[^[[D - Left
"map <Esc>[3;9A <C-w>+
"map <Esc>[1;9B <C-w>-
"map <Esc>[1;9C <C-w>>
"map <Esc>[1;9D <C-w><

" Shortcuts for rails projects
map <leader>gv :Files app/views<cr>
map <leader>gc :Files app/controllers<cr>
map <leader>gm :Files app/models<cr>
map <leader>gh :Files app/helpers<cr>
map <leader>gl :Files lib<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Test mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" TODO: make this map working
"   If used now it gives side efects. When using the arrow keys in normal mode
"   it enters edit mode and write upcase letter.
"nnoremap <esc> :noh<return><esc>
"nmap <esc> :noh<CR><esc>

"nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<cr>
"nmap <F7> :TagbarToggle<CR>

" vim-autotag mappings
":tn  Move to next definition (:tnext)
":tp  Move to previous definition (:tprevious)
":ts  List all definitions (:tselect)
"^]   Jump to definition
"^t   Jump back from definition
"^W } Preview definition
"g]   See all definitions


" HARD MODE: Disable the arrow and Pg Up/Down keys
nmap <Left> <Nop>
nmap <Right> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>

imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

vmap <Left> <Nop>
vmap <Right> <Nop>
vmap <Up> <Nop>
vmap <Down> <Nop>

" Disable entering Ex mode with Q
"map Q <Nop>

" Disable visual mode too
map W <Nop>

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>
nnoremap <leader>who oputs "-" * 60 + " #{} " + "-" * 60<esc>

" in-vim serch results
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"p method(:render).source_location
"p method(:render).super_method.source_location

" copy result to the system clipboard and echo the result
" the > prompt means the clipboard
" *f*ile *n*ame, ex. init.vim
map <Leader>fn :let @+ = expand("%:t") \| echo '> ' . @+<CR>
" *f*ile *p*ath, ex. /home/user/nvim/init.vim
map <Leader>fp :let @+ = expand("%:p") \| echo '> ' . @+<CR>
" copy file relative path with extensnion
map <Leader>yy :let @+ = expand("%:r") . '.' . expand("%:e") \| echo '> ' . @+<CR>

map <Leader>r :redraw!<cr>

"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

" Center on current line when searching
nmap n nzz
nmap N Nzz
nmap <C-o> <C-o>zz
nmap <C-i> <C-i>zz
nmap gg ggzz

nmap <leader>tig :!tig %<CR>
nmap <leader>x :bd<CR>
