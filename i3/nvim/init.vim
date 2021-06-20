filetype plugin indent on
syntax on
set splitbelow
set noerrorbells
set smartindent
set noswapfile
set nobackup
set incsearch
set encoding=utf-8
set cursorline
set ruler
set smarttab
set tabstop=2
set mouse=a
set invignorecase
set smartcase
set autoread
set clipboard=unnamedplus
set showtabline=2
set number
set title
set scrolloff=5
set tabstop=2
set softtabstop=2
set shiftwidth=2
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'yannickcr/eslint-plugin-react'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'digitaltoad/vim-jade'
Plug 'mhinz/vim-startify'
Plug 'arcticicestudio/nord-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'preservim/NERDTree'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'ap/vim-css-color'
Plug 'voldikss/vim-floaterm'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'SirVer/ultisnips' | Plug'honza/vim-snippets'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug '~/my-prototype-plugin'
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}

call plug#end() 

colorscheme nord
set background=dark
nmap <F8> :TagbarToggle<CR>
map <space>nn :NERDTreeToggle<CR>
map <space>nb :NERDTreeFromBookmark<CR>
map <space>nf :NERDTreeFind<CR>
map <space>q :q<CR>
map <space>w :w<CR>
map qq :q!<CR>
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h
nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)
map te :tabedit<CR>
map tt :tabnew<CR>
map <space>k :tabn<CR>
map <space>j :tabp<CR>
map <space>v :vsplit<CR>
map <space>b :split<CR> 
vnoremap <silent> <space>r :call VisualSelection('replace')<CR>
map <space>ss :setlocal spell<CR>
nnoremap + <C-a>
nnoremap - <C-x>
map <space><up> <C-w>+
map <space><down> <C-w>-
map <space><left> <C-w><
map <space><right> <C-w>>
map <space>t :terminal<CR>
map <space>tn :FloatermNew<CR>
map <F12>  :FloatermHide<CR>
map <space>tk :FloatermKill<CR>
map <F9> :FloatermPrev<CR>
map <F10> :FloatermNext<CR>
map <F11> :FloatermShow<CR>
map <F5> :Startify<CR>
map <F3> :source %<CR>
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:coc_global_extensions = [
  \ 'coc-tsserver',
	\	'coc-css',
	\	'coc-eslint',
	\	'coc-html',
	\	'coc-phpls',
	\	'coc-prettier',
	\ 'coc-python',
	\ 'coc-html'
  \ ]
let NERDTreeQuitOnOpen=1
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
