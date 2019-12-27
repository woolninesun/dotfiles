source $VIMRUNTIME/syntax/syntax.vim

set nocompatible " VIM 不使用和 VI 相容的模式
colorscheme default
syntax enable    " 語法上色顯示

" General
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace

" search
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally
hi Search cterm=reverse ctermbg=none ctermfg=none

" tab
set autoindent		" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set tabstop=4		" tab 的字元數
set expandtab		" 用 space 代替 tab
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

" highlight line
set cursorline   " 顯示目前的游標位置
hi CursorLine   cterm=none ctermbg=DarkMagenta ctermfg=White
hi CursorLineNR cterm=bold ctermbg=DarkMagenta ctermfg=White

set laststatus=2
set statusline=[%t][%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%{FileSize()}%{IsBinary()}%=%c,%l/%L\ [%3p%%]
function IsBinary()
    if (&binary == 0)
        return ""
    else
        return "[Binary]"
    endif
endfunction
function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

set encoding=utf8
set viminfo+=n~/.local/vim/viminfo

" netrw options
let g:netrw_home = '~/.local/vim/netrwhist'
