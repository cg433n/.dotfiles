filetype plugin indent on
syntax enable

set autoindent
set smartindent
set backspace=indent,eol,start
set completeopt=menu,menuone,preview,noselect
set omnifunc=syntaxcomplete#Complete
set infercase
set nowrap
set linebreak
set breakindent
set incsearch
set hidden
set guioptions=mc
set clipboard^=unnamed,unnamedplus
set formatoptions=tcroqjn
set showmatch
set expandtab
set tabstop=4
set shiftwidth=0
set diffopt=vertical
set autowrite
set autowriteall
set shortmess+=Ic
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
set thesaurus=~/.vim/thesaurus/mthesaur.txt
set isfname+=32
set belloff+=ctrlg
set mouse=a
set termguicolors

if has('gui_running')
  " macOS specific
  if has('gui_macvim')
    function! MacTheme()
      if v:os_appearance == 1
        set background=dark
        colorscheme xcodedark
        let g:airline_theme = "xcodedark"
        " call IndentGuides(&background)
      else
        set background=light
        colorscheme xcodelight
        let g:airline_theme = "xcodelight"
        " call IndentGuides(&background)
      endif
      call airline#extensions#tabline#buffers#invalidate()
      AirlineRefresh
    endfunction

    set guifont=SFMono-Regular:h12
    let macvim_hig_shift_movement = 1

    inoremap <D-[> <C-d>
    inoremap <D-]> <C-t>
    nnoremap <D-[> <<
    nnoremap <D-]> >>
    vnoremap <D-[> <<
    vnoremap <D-]> >>

    augroup LookandFeel
      autocmd!
      autocmd OSAppearanceChanged * call MacTheme()
      autocmd VimEnter * highlight Visual guibg=MacSelectedTextBackgroundColor
      autocmd VimEnter * highlight Comment gui=italic
      autocmd ColorScheme * highlight EndOfBuffer guifg=bg
    augroup END
  endif
else
  try
    colorscheme xcodedark
  catch
    colorscheme default
  endtry
endif

" Mappings
map <Space> <Leader>
map gf :e <cfile><CR>
noremap <silent> k gk
noremap <silent> j gj
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>o <C-O>
nnoremap <leader>i <C-I>
nnoremap <leader>e :edit **/*
nnoremap <leader>h gqip$
nnoremap <leader>a :tag *
nnoremap - :Ex<cr>
nnoremap <leader>u :CtrlPBuffer<cr>
nnoremap <leader>g :CtrlPTag<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>s :Gstatus<cr>

" Commands
command! Bd :bn | :bd#
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! HardWrap if &fo =~ 'a' | setlocal fo-=a | else | setlocal fo+=a | endif
command! Find :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" Abbreviations
iabbrev <expr> :date: strftime("%Y-%m-%d")
iabbrev <expr> [[]] strftime("[[%Y%m%d%H%M%S]]")

" Packages
packadd! matchit
let g:netrw_banner = 0
let g:markdown_folding = 1
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }
let g:ctrlp_use_caching = 0
let g:polyglot_disabled = ['markdown']
let g:ale_completion_enabled = 1
let g:Hexokinase_highlighters = ['sign_column']
let g:airline#extensions#wordcount#filetypes =
      \ ['asciidoc', 'help', 'mail', 'markdown', 'nroff', 'org', 'plaintex', 'rst', 'tex', 'text', 'pandoc']


" Autocommands
augroup Writing
    autocmd!
    autocmd FileType text,rst,markdown setlocal spell
    autocmd FileType text,rst,markdown setlocal nosmartindent
    autocmd FileType text setlocal foldmethod=indent
    autocmd FileType text,rst,markdown nnoremap <CR> :e <cfile><CR>
    autocmd FileType text,rst,markdown nnoremap <BS> :bp<CR>
    autocmd Syntax markdown syn match markdownUnderscoreNoop /_/
    autocmd FileType text,rmd,rst,markdown setlocal foldcolumn=0
    autocmd BufRead,BufNewFile *.otl   setfiletype votl
augroup END

augroup FrontEnd
    autocmd!
    autocmd FileType javascript set filetype=javascript.jsx
augroup END
