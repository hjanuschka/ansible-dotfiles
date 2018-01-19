
" vim-sublime - A minimal Sublime Text - like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts
" Updated by Dorian Neto (https://github.com/dorianneto)"

" Share ClipBoard
set clipboard=unnamed
set t_Co=256  " vim-monokai now only support 256 colours in terminal.
"

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

set re=1
set ttyfast
set lazyredraw
set nofsync





set nocompatible
filetype off

set directory^=$HOME/tmp/hjvim
set backupdir^=$HOME/tmp/hjvim
"let g:loaded_matchparen = 1


let g:DisableAutoPHPFolding = 1
let php_folding = 0

call plug#begin('~/.vim/plugged')
" ------Plugins-------
Plug 'iberianpig/tig-explorer.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'crusoexia/vim-monokai'
Plug 'tpope/vim-endwise'
Plug 'rhysd/vim-clang-format'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'marijnh/tern_for_vim'
Plug 'empanda/vim-varnish'
Plug 'tpope/vim-surround'
Plug 'gcmt/breeze.vim'
Plug 'osyo-manga/vim-over'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'jelera/vim-javascript-syntax'

Plug 'leshill/vim-json'
Plug 'maksimr/vim-jsbeautify'
"Plug 'tpope/vim-fugitive'
Plug 'beyondwords/vim-twig'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'milch/vim-fastlane'
Plug 'hjanuschka/vim-danger'
Plug 'mhinz/vim-startify'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'davidegx/ctrlp-smarttabs'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'dyng/ctrlsf.vim'
Plug 'Shougo/neocomplete'

call plug#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['phpcs'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace'],
\   'php': ['phpcbf', 'remove_trailing_lines', 'trim_whitespace'],
\   'sh': ['shmft', 'remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_php_phpcs_standard = "PSR2"
let g:ale_php_phpcbf_standard = 'PSR2'

" JS as JSX
let g:jsx_ext_required = 0
 

let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
let g:php_cs_fixer_cache = "/tmp/.php_cs.cache" " options: --cache-file

let g:ctrlp_extensions = ['smarttabs']

" ALT+P on my keyboard
nnoremap π :CtrlPSmartTabs<CR> " Altgr+p to open SmartTabs


imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

"NEOCOMPLETE
"
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction


let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
"define Keyword

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'


autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS


"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

"NEO SNIPPETS
"imap <expr><C-k> (pumvisible() ? "\<C-y>":"")."\<Plug>(neosnippet_expand_or_jump)"
"


"""""""

map \ :
let mapleader = ','





" Nerdtree
map <C-j> :NERDTreeTabsToggle<CR>


" Color Themes

colorscheme monokai

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}


" Beatufiy
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType php noremap <buffer> <c-f> :call PhpCsFixerFixFile()<cr>
autocmd FileType c,cpp,objc noremap <buffer> <c-f> :<C-u>ClangFormat<CR>


filetype plugin indent on

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set showmatch
set showmode
"set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

"set relativenumber
set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

" FIXME: (broken) ctrl s to save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode
inoremap <C-c> <Esc>




"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_regexp = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'


"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-a> <esc>ggVG<CR>


nnoremap <C-x>  :tabprevious<CR>
inoremap <C-x>  <Esc>:tabprevious<CR>i
nnoremap <C-y>  :tabnext<CR>
inoremap <C-y>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
"nnoremap <C-k>  :tabclose<CR>
"inoremap <C-k>  <Esc>:tabclose<CR>i

" lazy ':'

nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>




" TAB NAV
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif



