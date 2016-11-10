" Start pathogen
execute pathogen#infect()

" Auto bracket plugin
filetype plugin indent on

colorscheme badwolf
syntax on

" Set a new <leader> character
let mapleader = ","
let g:mapleader = ","

"augroup vimrc_autocmds
"    autocmd BufEnter * highlight OverLength ctermbg=red guibg=#592929
"    autocmd BufEnter * match OverLength /\%81v.*/
"augroup END

" Fast saving
nmap <leader>w :w!<cr>

" Fuzzy file finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
" omni completion
set omnifunc=syntaxcomplete#Complete
" Tab Settings
" Share clipboard with general OS clipboard
set clipboard=unnamed
set tabstop=4 " number of visual spaces a tab counts for
set shiftwidth=4
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set ruler

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
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
" save session
nnoremap <leader>s :mksession!<CR>


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

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

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
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>
