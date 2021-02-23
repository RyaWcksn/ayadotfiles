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
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4



call plug#begin()
Plug 'preservim/NERDTree'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
colorscheme gruvbox
set background=dark
set number
set tabstop=2
set expandtab
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

let NERDTreeQuitOnOpen=1
let mapleader = " "
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-pairs',
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-snippets',
    \ ]
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


