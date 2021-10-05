"========================================================== Plug-in ==========================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'

Plug 'ybian/smartim'
Plug 'ppwwyyxx/vim-PinyinSearch'
Plug 'easymotion/vim-easymotion'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
"Plug 'mhinz/vim-startify'

Plug 'w0rp/ale'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'

"need to install 'ag', macos exec `brew install the_silver_searcher`
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'

"tmux restore vim session
Plug 'tpope/vim-obsession'

Plug 'joom/vim-commentary'
Plug 'airblade/vim-gitgutter'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting & Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
set nofoldenable
if exists('g:plugs["vim-markdown"]')
  let g:mkdp_auto_close                        = 0
  let g:vim_markdown_auto_insert_bullets       = 0
  let g:vim_markdown_new_list_item_indent      = 0
  let g:vim_markdown_conceal                   = 0
  let g:vim_markdown_edit_url_in               = 'tab'
  let g:vim_markdown_folding_disabled          = 0
  let g:vim_markdown_folding_level             = 2
  let g:vim_markdown_follow_anchor             = 1
  let g:vim_markdown_frontmatter               = 1
  let g:vim_markdown_json_frontmatter          = 1
  let g:vim_markdown_math                      = 1
  let g:vim_markdown_no_extensions_in_markdown = 1
  let g:vim_markdown_strikethrough             = 1
  let g:vim_markdown_toc_autofit               = 1
  let g:vim_markdown_toml_frontmatter          = 1
  let g:vim_markdown_fenced_languages          = [
        \ 'csharp = cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'
        \ ]
endif

" LeaderF
map <leader>P :Leaderf file<CR>
map <leader>p :Leaderf mru<CR>

" Goyo
map gy :Goyo<CR>

" NERDTree
map <leader>f :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>zz
map <leader>nn :NERDTree<CR>
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

" MarkdownPreview
nmap <leader>mm :MarkdownPreview<CR>
nmap <leader>ms :MarkdownPreviewStop<CR>
let g:mkdp_open_to_the_world = 1

" md-padding
noremap <F6> :%!npx md-padding<CR>

" tagbar
nmap <leader>j :TagbarToggle<CR>
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }


" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" undo
map <leader>ud :UndotreeToggle<CR>

" coc
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-diagnostic',
    \ 'coc-explorer',
    \ 'coc-gitignore',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-stylelint',
    \ 'coc-syntax',
    \ 'coc-tasks',
    \ 'coc-todolist',
    \ 'coc-translator',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-yank']

set updatetime=100
set shortmess+=c

    " Tab 补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <C-o> coc#refresh()

    " 回车补全
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

    " 跳转错误
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

    " 跳转到变量定义
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

    " 查看文档
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

    " 重命名变量
nmap <leader>rn <Plug>(coc-rename)

    " 代码格式化
" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)


" pinyinSearch
let g:PinyinSearch_Dict = $HOME . '/.vim/plugged/vim-PinyinSearch/PinyinSearch.dict'
noremap \ :call PinyinSearch()<CR>
"noremap <leader>pn :call PinyinNext()<CR>

" vim-easymotion

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
nmap <leader>; <Plug>(easymotion-overwin-f)
