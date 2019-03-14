" Load vim-plug plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Nicer vim integration
Plug 'wincent/terminus'
" vim-git integration
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
call plug#end()

" Auto bracket plugin
filetype plugin indent on

colorscheme badwolf
syntax on

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
highlight Normal ctermfg=grey

nmap <C-n> :NERDTreeToggle<CR>

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

call deoplete#enable()
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" And use ctrl+] when the cursor is positioned in a symbol to quickly jump to
" a definition or declaration.
au FileType c,cpp nnoremap <buffer> <c-]> :YcmCompleter GoTo<CR>

" Set a new <leader> character
let mapleader = ","
let g:mapleader = ","

"augroup vimrc_autocmds
"    autocmd BufEnter * highlight OverLength ctermbg=red guibg=#592929
"    autocmd BufEnter * match OverLength /\%81v.*/
"augroup END

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>x :x<cr>

" Latex compilation
nmap <leader>ll :w! \| :!pdflatex %<cr>
" Compile bibliography too with bibtex
nmap <leader>lb :!pdflatex % && bibtex expand('%:e')<cr>

" Fuzzy file finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
" omni completion
set omnifunc=syntaxcomplete#Complete
" Tab Settings
" Share clipboard with general OS clipboard
set clipboard=unnamed
set textwidth=80
set tabstop=4 " number of visual spaces a tab counts for
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " tabs are spaces
set ruler
set showcmd
set guicursor=

set backspace=indent,eol,start

" ctrlp ignore stuff
set wildignore+=*/tmp/*,*.zip,.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,
set wildignore+=*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$|eigen$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Indentation Settings
set autoindent
set cindent

set relativenumber  " relative line numbers
set number          " display absolute line number of current line
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlights search matches
set ignorecase      " ignore case when searching
set smartcase       " smart case searching
set cursorline
nmap <leader>c :nohlsearch<CR>
set foldmethod=syntax

" Allow for mouse click to move cursor
set mouse=a

" Make all tabs align
set shiftround

" j/k treat wrapped lines as distinct lines when going up/down the page
" nmap j gj
" nmap k gk
" move to beginning/end of line
nmap B ^
nmap E $
" Insert single character by pressing space
nmap <Space> i_<Esc>r
" Change tabs
nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>
nmap H :tabp<CR>
nmap L :tabn<CR>
nmap <CR> i<CR><Esc>l
" save session
nmap <leader>s :mksession!<CR>
" tab expansion
nmap <leader>a :tab all<CR>

if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" adjust configuration for such hostile environment as Windows {{{
if has("darwin")
elseif has("unix")
else
    " Cygwin stuff
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
endif
" }}}

" Vim-Latex Settings

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nmap <F12>     :ShowSpaces 1<CR>
nmap <S-F12>   m`:TrimSpaces<CR>``
nmap <S-F12>   :TrimSpaces<CR>
