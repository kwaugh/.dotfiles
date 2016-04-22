" Auto bracket plugin
filetype plugin indent on

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

colorscheme badwolf

" Tab Settings
set tabstop=4 " number of visual spaces a tab counts for
set shiftwidth=4
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

" Indentation Settings
set autoindent
set cindent

" Show line numbers
set relativenumber " relative line numbers
set number " display absolute line number of current line
set cursorline " highlight the current line
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlights search matches
" remap highlight off to /<space>
nnoremap <leader>c :nohlsearch<CR>

" Allow for mouse click to move cursor
set mouse=a

" Make all tabs align
set shiftround

" j and k treat wrapped lines as distinct lines when going up and down the page
nmap j gj
nmap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" Insert single character by pressing space
nmap <Space> i_<Esc>r
" Change tabs
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>
nmap H :tabp<CR>
nmap L :tabn<CR>
" absolute line number jumping by typing line number then enter
:nnoremap <CR> G
" save session
nnoremap <leader>s :mksession<CR>

syntax on

" adjust configuration for such hostile environment as Windows {{{
if has("darwin")
else
    " Cygwin stuff
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif
" }}}

