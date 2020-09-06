"========================================================== Setting =========================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable use mouse
"set mouse=a

"Sets how many lines of history VIM has to remember
set history=500

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

" Display relative line number
set relativenumber

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
map <silent> <leader><cr> :noh<cr>

" Replace keymap, quick click
noremap <C-i> ^
noremap <C-n> $
noremap <C-d> 5<C-e>
noremap <C-u> 5<C-y>
tmap <leader>t <C-\><C-n>
map S :w<CR>
map X :q<CR>
map zs :source $MYVIMRC<CR>
map J 5j
map K 5k

" Buffer
" :e open the file buffer
" :enew create a new buffer
" :bd close the file buffer
" :b<number> switch number buffer
nnoremap <silent> <leader>bl :ls<CR>
nnoremap <silent> <leader>bn :enew<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap Q :bd<CR>
nnoremap <silent> <leader>Q :bdelete!<CR>

" Window
map <leader>wl :set splitright<CR>:vsplit<CR>
map <leader>wh :set nosplitright<CR>:vsplit<CR>
map <leader>wj :set nosplitbelow<CR>:split<CR>
map <leader>wk :set splitbelow<CR>:split<CR>

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
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

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

