"========================================================== Setting =========================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable use mouse
"set mouse=a

"Sets how many lines of history VIM has to remember
set history=500

"Treat numbers starting with 0 as decimal
set nrformats=

" Eliminating delays on ESC in vim and zsh, See https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Enable filetype plugins
set nocompatible
filetype on
filetype indent on
filetype plugin on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=" "

" Display cursorline
"set cursorline

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set 7 lines to the cursor - when moving vertically using j/k
"set scrolloff=7

" Avoid garbled characters in Chinese language windows OS
"let $LANG='en'
"set langmenu=en

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" Set cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=utf8,ucs-bom,latin1,gb18030,gbk,gb2312,cp936
set termencoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display invisible characters.
set list
set listchars=tab:▸\ ,trail:▫

" Display line number
set nu

" Display relative line number
"set relativenumber

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Auto pastetoggle
inoremap <C-v> <esc>:set paste<cr>a<C-R>+<esc>:set nopaste<cr>

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"========================================================== Key Mapping ==========================================================

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>
vnoremap zy "+y
noremap zv f{V%

" Replace keymap, quick click
noremap 0 ^
noremap ^ 0

" terminal to normal
tmap <leader>t <C-\><C-n>

" C-^ go to alternate file
nnoremap <silent> <leader>o <C-^>
map S :w<CR>
map X :q<CR>
noremap R :source $MYVIMRC<CR>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" input model key mapping
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
inoremap <C-k> <Esc>C

" Buffer
" :e open the file buffer
" :enew create a new buffer
" :bd close the file buffer
" :b<number> switch number buffer
nnoremap <silent> <leader>bn :enew<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>
" <C-^> swap buffer
nnoremap Q :bd<CR>
nnoremap <silent> <leader>Q :bdelete!<CR>
nnoremap <silent> <leader>ba :bufdo bd<CR>
nnoremap <silent> <leader>bo :%bd <bar> e# <bar> bd#<CR>
nnoremap <silent> <leader>bl :ls<CR>

" Window
map <leader>wl :set splitright<CR>:vsplit<CR>
map <leader>wh :set nosplitright<CR>:vsplit<CR>
map <leader>wk :set nosplitbelow<CR>:split<CR>
map <leader>wj :set splitbelow<CR>:split<CR>
map <leader>wo :only<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>w, <C-w>t<C-w>H
map <leader>w. <C-w>t<C-w>K

map <leader><Up> :res +5<CR>
map <leader><Down> :res -5<CR>
map <leader><Left> :vertical resize+5<CR>
map <leader><Right> :vertical resize-5<CR>

" Tab
map <leader>tn :tabnew<CR>
map <leader>ts :tab split<CR>

map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

"nnoremap <silent> g<Tab> jump to last tab
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]T :tablast<CR>
nnoremap <silent> [T :tabfirst<CR>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undodir")
    call mkdir($HOME."/.vim/undodir", "", 0700)
endif
set undodir=~/.vim/undodir
set undofile

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" You can use :tab split to full green, and use :tabclose exit full green
" zoom in
function! Zoom()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

" format json
com! FormatJSON %!python3 -m json.tool
