"autoindent
set autoindent

set number
set ruler


syntax on
set hlsearch
set antialias

set backupdir=~/.vim/tmp

"tab
set tabstop=4
set expandtab
set shiftwidth=4

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

set incsearch

set showmatch

set smartcase

"set smartindent

set nowrapscan

"-----------------------
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_disable_caching_file_path_pattern = '.*'
"let g:neocomplcache_enable_ignore_case = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_auto_completion_start_length = 3
"

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'c'          : $HOME . '/.vim/dict/c.dict',
    \ 'cpp'        : $HOME . '/.vim/dict/cpp.dict',
    \ 'java'       : $HOME . '/.vim/dict/java.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ 'lua'        : $HOME . '/.vim/dict/lua.dict',
    \ 'ocaml'      : $HOME . '/.vim/dict/ocaml.dict',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict',
    \ 'php'        : $HOME . '/.vim/dict/php.dict',
    \ 'scala'      : $HOME . '/.vim/dict/scala.dict',
    \ 'scheme'     : $HOME . '/.vim/dict/scheme.dict',
    \ 'vim'        : $HOME . '/.vim/dict/vim.dict',
    \ 'vimshell'   : $HOME . '/.vimshell/command-history',
    \ }

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'Lokaltog/vim-powerline'
" vim-scripts repos
NeoBundle 'L9'
" NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'
" Non github repos
NeoBundle 'git://git.wincent.com/command-t.git'
" Non git repos
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" ...

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

    " Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
            \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
endif

let g:Powerline_symbols = 'fancy'
