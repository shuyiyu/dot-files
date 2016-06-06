"""""""""""""""""""""""""""""
" jzh2106 VIM Settings
"""""""""""""""""""""""""""""
" Pathogen
execute pathogen#infect()
filetype plugin indent on

" Basic stuff
set nu
set wildmenu
set lazyredraw
set ruler
set pastetoggle=<F2>
syntax enable

" Theme
 colorscheme elflord
 set background=dark

" Use spaces instead of tabs
" 1 tab = 4 spaces
set expandtab
set shiftwidth=4
set tabstop=8
set softtabstop=4
inoremap <S-Tab> <C-V><Tab>

" Use smart tabs
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

" Indent
set si " Smart indent
set ai " Auto indent

" Wrap lines
set wrap

" Show matching brackets
set showmatch

" Searching
set hlsearch " highlight search
set incsearch " incremental search
set ignorecase " ignores case
set smartcase " smart case

" Many undo levels
set undolevels=1000

" Folding
set foldlevelstart=10
set foldnestmax=10 
nnoremap <space> za
set foldmethod=indent

" Movement
nnoremap j gj
nnoremap k gk

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
:map <F4> :Goyo<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
