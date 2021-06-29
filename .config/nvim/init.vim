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

call plug#begin()
"Plug 'vimsence/vimsence'
Plug 'SirVer/ultisnips'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-startify'

" Currently, es6 version of snippets is available in es6 branch only
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'digitaltoad/vim-jade'
Plug 'arcticicestudio/nord-vim'
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'phpactor/ncm2-phpactor'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
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
map <F5> :Startify<CR>
map <F3> :source %<CR>

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
let g:vimsence_client_id = '770987360972308500'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}
" ncm2 configuration
inoremap <c-c> <ESC>
" Saat <Enter> ditekan ketika popup menu masih munculia akan menyembunykan menu. Gunakan mapping ini untuk menutup menu dan juga memulai baris baru.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_global_extensions = [
  \ 'coc-tsserver',
	\	'coc-css',
	\	'coc-eslint',
	\	'coc-html',
	\	'coc-phpls',
	\	'coc-prettier',
	\ 'coc-python',
	\ 'coc-html',
	\  'coc-stylelint',
  \ 'coc-scssmodules',
	\ 'coc-json',
	\ 'coc-vimlsp',
	\ 'coc-yaml'
  \ ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:html5_event_handler_attributes_complete = 0 " Disable event-handler attributes
let g:html5_rdfa_attributes_complete = 0          " Disable RDFa attributes
let g:html5_microdata_attributes_complete = 0     " Disable microdata attributes
let g:html5_aria_attributes_complete = 0          " Disable WAI-ARIA attribute
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

