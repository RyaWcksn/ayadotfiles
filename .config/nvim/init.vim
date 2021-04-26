filetype plugin indent on
syntax on
scriptencoding utf-8
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

call plug#begin()
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'yannickcr/eslint-plugin-react'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andreypopp/vim-colors-plain'
Plug 'kiteco/vim-plugin'
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
Plug 'kchmck/vim-coffee-script'
call plug#end()
colorscheme PaperColor
set background=light
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

let NERDTreeQuitOnOpen=1
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

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <space>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <space>r  <Plug>(go-run)
autocmd FileType go nmap <space>t  <Plug>(go-test)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <space>do <Plug>(coc-codeaction)
nmap <space>rn <Plug>(coc-rename)

