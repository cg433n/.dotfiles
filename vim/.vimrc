filetype plugin indent on
syntax enable

set autoindent
set smartindent
set backspace=indent,eol,start
set completeopt=menu,menuone,preview
set omnifunc=syntaxcomplete#Complete
set infercase
set nowrap
set linebreak
set incsearch
set hidden
set guioptions=mc
set clipboard^=unnamed,unnamedplus
set formatoptions=tcroqjn
set showmatch
set expandtab
set tabstop=2
set shiftwidth=0
set diffopt=vertical
set autowrite
set autowriteall
set shortmess+=I
set noswapfile
set showcmd
set hlsearch
set wildmenu
set wildignore+=*.git,*venv/*,*node_modules/*,*vendor/*,*__pycache__/*,*.aux,*.cls,*dist/*,*output/*
set wildignorecase
set autoread
set spelllang=en_us
set sidescrolloff=5
set scrolloff=5
set tags^=./.git/tags
set laststatus=2
set statusline=%<[%{fnamemodify(getcwd(),':t')}]\ %f\ %h%m%r%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%l,%c%V\ %L%)\ %P\ [%{wordcount().words}]
set foldlevel=5
set virtualedit=all
set linespace=1

colorscheme hemisu

if has('gui_macvim')
  set guifont=SFMono-Regular:h12
  set transparency=10
  augroup LookandFeel
    autocmd VimEnter,ColorScheme,BufEnter,OSAppearanceChanged * if v:os_appearance == 0 | set bg=light | else | set bg=dark | endif
    autocmd VimEnter,ColorScheme,BufEnter * highlight EndOfBuffer guifg=bg
  augroup END
endif

" Close buffer without closing window
command! Bd :bn | :bd#

" Change working directory to currently open file
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h

" Toggle hard wrap
command! HardWrap if &fo =~ 'a' | setlocal fo-=a | else | setlocal fo+=a | endif

" Find word under cursor
command! Find :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

vnoremap < <gv
vnoremap > >gv
nnoremap <leader>e :edit **/*
nnoremap <leader>p gqip$
nnoremap <leader>a :tag *

ia <expr> :date: strftime("%Y-%m-%d")

packadd! matchit
nnoremap - :Ex<cr>
let g:netrw_banner = 0
let g:markdown_folding = 1

augroup Writing
  autocmd FileType text,rst,markdown setlocal spell
augroup END

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
nnoremap <leader>u :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>

let g:polyglot_disabled = ['markdown']
