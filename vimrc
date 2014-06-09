" Setup pathogen
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'clang_complete')
filetype off
call pathogen#runtime_append_all_bundles()

" Important stuff
set nocompatible
syntax enable
set modelines=0
filetype plugin indent on
set history=1000
set autowrite " Saves before commands like :make
set encoding=utf-8

" Whitespace
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:· " Shows trailing whitespace

" Other stuff
set title " gives terminal title
set encoding=utf-8
set scrolloff=3 " Number of lines between cursor and end of screen
set autoindent
set showmode
set showcmd
set hidden
set wildmenu " Shows command completion in a menu
set wildmode=list:longest
set visualbell " Instead of beeping
set cursorline " Highlights the line the cursor is on
set ttyfast
set ruler " Shows line and column number
set backspace=indent,eol,start
set laststatus=2 " Always show status line
set number

" Searching stuff
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault " Substitutes all in a line instead of one
set incsearch
set showmatch
set hlsearch

" Directories for backup files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Clear search with <leader><space>
nnoremap <leader><space> :noh<cr>

" Navigate between windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Navigate between screen lines, not file lines
nnoremap j gj
nnoremap k gk

" Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=""<CR>

" Create new split window and go to it
nnoremap <leader>w <C-w>v<C-w>l

" If you forget to sudo a file, use this
cnoremap w!! w !sudo tee % >/dev/null

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement=1

" Move lines up and down with alt+arrow up/down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <c-up> :call <SID>swap_up()<CR>
noremap <c-down> :call <SID>swap_down()<CR>

" Fancy symbols for Powerline
python from powerline.vim import setup as powerline_setup
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'

" Clang-complete options
let g:clang_auto_select=1
let g:clang_complete_copen=1
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1
set completeopt-=preview

" Cmd-T options
let g:CommandTMaxHeight=20

" Syntax for GLSL
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl
au BufNewFile,BufRead *.pc set filetype=cpp
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" make uses real tabs
au FileType make set noexpandtab

" json syntax highlight
au BufNewfile,BufRead *.json set ft=javascript

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
au BufWritePost vimrc so ~/.vimrc

" open last buffer
noremap <Leader><Leader> <C-^>

" absolute line numbers in insert, relative otherwise
au InsertEnter * :set nu
au InsertLeave * :set rnu

" command line editing shortcuts
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" omni complete shortcut
"inoremap <C-space> <C-x><C-o>
"inoremap <C-@> <C-space>
