set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Align'
NeoBundle 'skammer/vim-css-color'
"NeoBundle 'sudo.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'altercation/vim-colors-solarized'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax enable

set autoread
set splitbelow
set splitright
set autoindent
set smartindent
set hlsearch
set nowrapscan
set showmatch
set showmode
set expandtab
set tabstop=4
set shiftwidth=4
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set browsedir=buffer
set laststatus=2
set showcmd
set wildmode=list,full
set fileencodings=utf8,iso-2022-jp,cp932,euc-jp
"set t_Co=256
set clipboard=unnamed,autoselect
set incsearch
set smartindent
set smarttab
"set scrolloff=999

if exists('&ambiwidth')
  set ambiwidth=double
endif

"highlight Pmenu ctermbg=4

"swp files
set directory-=.

"backup files
set backup
set backupdir=/tmp

"show special character
set list
set lcs=tab:>-,trail:_,extends:>,precedes:<

scriptencoding utf-8

set cursorline
"augroup cch
"    autocmd! cch
"    autocmd WinLeave * set nocursorline
"    autocmd WinEnter,BufRead * set cursorline
"augroup END
hi clear CursorLine
hi CursorLine gui=underline
"
""colorscheme
""colorscheme wombat256
""colorscheme desert
""colorscheme molokai
"------------------------------------
" Solarized Configure
"------------------------------------
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=1
"let g:solarized_degrade=1
"let g:solarized_underline=1
"let g:solarized_italic=1
let g:solarized_contrast='high'
"let g:solarized_visibility='high'
colorscheme solarized
set background=dark


" remove autocomment
autocmd FileType * set formatoptions-=ro

" for perl files
"autocmd BufNewFile,BufRead *.psgi set filetype=perl
"autocmd BufNewFile,BufRead *.t set filetype=perl



"---------------------------------------------------------------------
" Key mappings
"---------------------------------------------------------------------

" mapleader
let mapleader = ","

" for scratch
nnoremap <Leader>s :Scratch<CR>

" for basics
nnoremap <Space>w :<C-u>write<CR>
nnoremap <Space>q :<C-u>quit<CR>
nnoremap <Space>a :<C-u>wqall<CR>

nnoremap <Space>v :<C-u>tabnew ~/.vimrc<CR>
nnoremap <Space>s :<C-u>source ~/.vimrc<CR>

nnoremap <Space>zz :<C-u>tabnew ~/.zshrc<CR>
nnoremap <Space>ze :<C-u>tabnew ~/.zshenv<CR>
nnoremap <Space>za :<C-u>tabnew ~/.zshalias<CR>

nnoremap <Space>zlz :<C-u>tabnew ~/.zshrc.local<CR>
nnoremap <Space>zle :<C-u>tabnew ~/.zshenv.local<CR>
nnoremap <Space>zla :<C-u>tabnew ~/.zshalias.local<CR>

nnoremap <Space>e :e ++enc=utf-8<CR> :set encoding=utf-8<CR> :w<CR>

nnoremap <Space>] <C-w>]

" for command line
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" for perl
inoremap <C-d> $
inoremap <C-a> @
inoremap <C-p> <C-x><C-o>

" for others
vnoremap < <gv
vnoremap > >gv

" expand path
cmap <C-x> <C-r>=expand('%:p:h')<CR>/
" expand file (not ext)
cmap <C-z> <C-r>=expand('%:p:r')<CR>

" for alc
nnoremap <Leader>a <Esc>:Ref alc<Space>

" for perldoc
nnoremap <Leader>p <Esc>:Ref perldoc<Space>

" add \n
nnoremap U :<C-u>call append(expand('.'), '')<Cr>j

" replace Y
nnoremap Y y$

"yank and paste clipboard
if !has('gui')
  nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
  vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
  nnoremap <silent> <Space>p :r !pbpaste<CR>
  vnoremap <silent> <Space>p :r !pbpaste<CR>
else
  " GVim(Mac & Win)
  noremap <Space>y "+y<CR>
  noremap <Space>p "+p<CR>
endif

"repeat command
nnoremap c. q:k<Cr>

"no search offset
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

"substitute word under cursor
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

"replace word under cursor with yanked string
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"tabnew with gf
nnoremap gf <C-w>gf

"カーソル一文字単位移動
"inoremap <silent> <C-s> <Left>
"inoremap <silent> <C-d> <Right>

"単語単位移動（行末で止めたい場合）
inoremap <silent> <C-f> <S-Left>
inoremap <silent> <C-b> <S-Right>

inoremap jj <Esc>
inoremap .. ->

set pastetoggle=<F2>

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" Unite Outiline
noremap <C-U><C-E> :Unite outline<CR>
-

"------------------------------------
" quick-run
"------------------------------------
" quickrun && watchdogs {{{
let g:quickrun_config = {}
let g:quickrun_config = {
\   "_" : {
\       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
\       "hook/unite_quickfix/enable_failure" : 1,
\       "hook/close_quickfix/enable_exit" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "outputter" : "multi:buffer:quickfix",
\       "outputter/buffer/into" : 1,
\       "hook/inu/enable" : 1,
\       "hook/inu/wait" : 20,
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\   }
\}

let g:quickrun_config['perl']= {
\ 'command': 'prove',
\ 'cmdopt': '--norc --nocolor --timer --trap -lwv --exec "perl -Ilib -It/lib -MProject::Libs -MTest::Name::FromLine"',
\ }

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"------------------------------------------------------------------------------------
" For neocomplcache
"------------------------------------------------------------------------------------
" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

