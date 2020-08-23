syntax on
set noerrorbells
set smartindent
set noswapfile
set nobackup
set incsearch


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
Plug 'HendrikPetertje/vimify'
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
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>f :NERDTree<CR>


let mapleader = " "
let  g:spotify_token='NWRmNjIwZGM3YTUyNDFmN2E4YWQzNmM5ZDI5Y2EzMDk6ZWVkNzdhOWM3ZmY1NGI2Njk3ZmEzODkwMWZhZWMzZTg='
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif



