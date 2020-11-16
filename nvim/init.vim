set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
"Plugin 'arakashic/chromatica.nvim'
Plugin 'zchee/deoplete-clang'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap jk <Esc>
nnoremap <F1> :cprev<cr>
nnoremap <F2> :cnext<cr>
nnoremap <silent> <F3> :cclose\|cd %:h/..\|make!\|cd %:h\|copen\|redraw!<cr>:normal G<cr>
nnoremap <silent> <F4> :cclose\|cd %:h/..\|make!\|cd %:h\|redraw!<cr>
nmap <F5> :TagbarToggle<CR>
" nmap <F4> <Plug>LLBreakSwitch
" nnoremap <F5> :LLmode debug<CR>
" nnoremap <F6> :LL step<CR>
" nnoremap <F7> :LL next<CR>
" nnoremap <F8> :LL continue<CR>
" nnoremap <F9> :LL process interrupt<CR>

if has('nvim')
    tnoremap <Esc> <c-\><c-n>
endif

let mapleader = ','

filetype plugin indent on
let &cpo=s:cpo_save
unlet s:cpo_save
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set fileencodings=utf-8,ucs-bom,default,latin1
set encoding=utf-8
set termencoding=utf-8
set modelines=0
set window=0
set number
set hidden
set nowrap
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch
set switchbuf=usetab,newtab
set nojoinspaces
set cino=:0,=4             " fix indentation for switch statements
"set cursorline
"let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
"set noshowmatch         " Don't match parentheses/brackets
set laststatus=2
set noshowcmd
set noshowmode
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
"set scrolljump=8       " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
autocmd BufWritePre * :%s/\s\+$//e

set guitablabel=%N/\ %t\ %M

" vim: set ft=vim :

" enables to search in all open buffers with :Search <pattern>
function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

function! GrepBuffers (expression)
  exec 'vimgrep/'.a:expression.'/ '.join(BuffersList())
endfunction

command! -nargs=0 Cclear call setqflist([]) | cclose

command! -nargs=+ Search call setqflist([]) | call GrepBuffers(<q-args>) | copen

let g:deoplete#enable_at_startup = 1

let g:airline_powerline_fonts=1
let g:airline_theme='koe'

let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"let g:chromatica#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
"let g:chromatica#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"let g:chromatica#responsive_mode=1
"let g:chromatica#enable_at_startup=1

let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'

"let g:deoplete#sources#clang#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
"let g:deoplete#sources#clang#clang_header='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'

let g:python3_host_prog='/usr/bin/python3'

set completeopt -=preview

syntax enable

colorscheme koe
