"========================================================== Plug-in ==========================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'ybian/smartim'
Plug 'junegunn/goyo.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

Plug 'w0rp/ale'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting & Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" LeaderF
map <leader>p :Leaderf file<CR>
map <leader>f :Leaderf mru<CR>
" Goyo
map gy :Goyo<CR>

" NERDTree
map ff :NERDTreeToggle<CR>
" show line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" hidden file
let NERDTreeShowHidden=1
" set height
let NERDTreeWinSize=31
" auto open 
let g:nerdtree_tabs_open_on_console_startup=1
" hidden files list
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" show bookmarks
let NERDTreeShowBookmarks=1
" display git info
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" TagbarToggle
nmap <F8> :TagbarToggle<CR>

" MarkdownPreview
nmap <leader>mm :MarkdownPreview<CR>
nmap <leader>ms :MarkdownPreviewStop<CR>
