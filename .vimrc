"autoindent
set autoindent

set number
set ruler


syntax on
set hlsearch
set antialias


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
map <C-g> :Gtags
map <C-f> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

