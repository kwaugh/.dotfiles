" Start pathogen
execute pathogen#infect()

" Auto bracket plugin
filetype plugin indent on

colorscheme badwolf
syntax on

" Syntastic recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

" Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" Disable ycm for haskell files
let g:ycm_filetype_blacklist = {
      \ 'hs' : 1,
\}

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

" Fuzzy file finding
set runtimepath^=~/.vim/bundle/ctrlp.vim
" omni completion
set omnifunc=syntaxcomplete#Complete
" Tab Settings
" Share clipboard with general OS clipboard
set clipboard=unnamed
set tabstop=8 " number of visual spaces a tab counts for
set shiftwidth=4
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set ruler

" ctrlp ignore stuff
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$',
  \ 'file': '\v\.(exe|so|dll)$',
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
nnoremap <leader>c :nohlsearch<CR>

" Allow for mouse click to move cursor
set mouse=a

" Make all tabs align
set shiftround

" j and k treat wrapped lines as distinct lines when going up and down the page
" nmap j gj
" nmap k gk
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
nmap <CR> i<CR><Esc>l
" save session
nnoremap <leader>s :mksession!<CR>

if exists('+colorcolumn')
    set colorcolumn=95
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>95v.\+', -1)
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

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
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
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>
