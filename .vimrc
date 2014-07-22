"set nocp

set background=dark
set ruler
set laststatus=2
set incsearch
set hlsearch
set bs=2
set nobackup
set writebackup
set history=50
set smartindent
set autoindent
set showcmd
set showmatch
set shortmess=at
set shiftwidth=4
set tabstop=4
set noexpandtab
set fo=tcroq
set cinoptions=(0
set cinkeys=0{,0},:,;,o,!<Tab>,0#,!
"set cindent
set ic
" Use mouse to navigate
set mouse=a
set ttymouse=xterm2
"set nowrapscan
set modeline

"colorscheme dalue

nnoremap <silent> <F4> :Tlist<CR>
" Don't use Ex mode, use Q for formatting
map Q gq
" goto end of line on ctrl-e
map <C-e> $
imap <C-e> <esc>A

" goto beginning of line on ctrl-a
map <C-a> ^
imap <C-a> <esc>I

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
  syntax on

" Mapping for <F7>
map <F11> :tp<CR>
" Mapping for <F8>
map <F12> :tn<CR>

filetype indent on
filetype plugin indent on

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  if version > 580
    filetype indent plugin on
  else
    filetype on
  endif

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufNewFile,BufRead *SW-NetBSD*/* set noexpandtab 
  "autocmd BufNewFile,BufRead *SW-NetBSD*/* cs add /work/swos-01/ashokkumar/$P4CLIENT/SW-NetBSD$NBSD_VERSION/cscope.out
"  autocmd BufNewFile,BufRead *SW-NetBSD*/* if filereadable("/work/swos-01/ashokkumar/$P4CLIENT/SW-NetBSD$NBSD_VERSION/tags ")
  "            \ | set tags=/work/swos-01/ashokkumar/$P4CLIENT/SW-NetBSD$NBSD_VERSION/tags | 
  "            \ else | set tags=/work/swos-01/ashokkumar/$P4CLIENT/tags | endif
  autocmd BufNewFile,BufRead *SW/*.[ch] set expandtab
  "autocmd BufNewFile,BufRead *SW/* cs add /work/swos-01/ashokkumar/$P4CLIENT/SW/cscope.out
"  autocmd BufNewFile,BufRead *SW/* if filereadable("/work/swos-01/ashokkumar/$P4CLIENT/SW/tags")
   "           \ | set tags=/work/swos-01/ashokkumar/$P4CLIENT/SW/tags | 
   "           \ else | set tags=/work/swos-01/ashokkumar/$P4CLIENT/tags | endif

  augroup END
endif " has("autocmd")


"cscope mapping
if has("cscope")
    " Find functions calling this function
    map <C-_> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    " Find this C symbol
    map <C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

    " Find this definition
    map g<C-]> :cstag <C-R>=expand("<cword>")<CR><CR>
endif

	" map <F10> :!echo % ../SW-NetBSD/usr/src/sys/bcm/% \| sed 's,/work/sw/ashokkumar/emain-sjc-1/SW,,g' >> /tmp/tmp <CR><CR>dd:w<CR><F10>

