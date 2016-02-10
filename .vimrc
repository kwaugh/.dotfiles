" Auto bracket plugin
filetype plugin indent on

" Tab Settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation Settings
set autoindent
set cindent

" Show line numbers
set relativenumber
set number

" Allow for mouse click to move cursor
set mouse=a

" Make all tabs align
set shiftround

" j and k treat wrapped lines as distinct lines when going up and down the page
nmap j gj
nmap k gk

" Insert single character by pressing space
nmap <Space> i_<Esc>r
" Change tabs
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>
nmap H :tabp<CR>
nmap L :tabn<CR>

" Allow for absolute line number jumping by typing line number then enter
:nnoremap <CR> G

syntax on

" adjust configuration for such hostile environment as Windows {{{
if has("win32") || has("win16")
  " Cygwin stuff
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif
" }}}
