" --[ Basic ]--------------------------------------------------------------------
set nocompatible
set t_Co=256
syntax enable
set cursorline
set number
set relativenumber
set noshowmode
colorscheme OceanicNext

" --[ Remapping ]------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" --[ Pengaturan colorscheme ]-----------------------------------------------------
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

if (has("termguicolors"))
 set termguicolors
endif

" --[ Plugin ]--------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'mhartington/oceanic-next'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
call plug#end()

" --[ Lightline ]------------------------------------------------------------------
let g:lightline = {
\   'colorscheme': 'oceanicnext',
\   'active': {
\    'left' :[[ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly' ],
\             [ 'filename', 'modified' ]],
\    'right':[[ 'lineinfo' ],
\             [ 'percent' ],
\             [ 'filetype', 'fileencoding', 'fileformat' ] ]
\   },
\   'component': {
\     'lineinfo': ' %3l:%-2v',
\     'filename': '%<%f'
\   },
\   'component_function': {
\     'gitbranch': 'LightlineFugitive',
\     'readonly': 'LightlineReadonly',
\     'modified': 'LightlineModified',
\     'fileformat': 'LightlineFileformat',
\     'filetype': 'LightlineFiletype',
\   }
\}
"  'left': '', 'right': ''
let g:lightline.separator = {
\   'left': '', 'right': ''
\}
"   'left': '', 'right': ''
let g:lightline.subseparator = {
\   'left': '│', 'right': '│'
\}
let g:lightline.tabline = {
\   'left': [['buffers']],
\   'right': [['string1'], ['string2']]
\}
let g:lightline.component_expand = {
\   'buffers': 'lightline#bufferline#buffers'
\}
let g:lightline.component_type = {
\   'buffers': 'tabsel'
\}

function! LightlineModified()
  return &modified ? '●' : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return fugitive#head()
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

" autoreload
command! LightlineReload call LightlineReload()

function! LightlineReload()
 call lightline#init()
 call lightline#colorscheme()
 call lightline#update()
endfunction

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" --[ Lightline Buffers ]--------------------------------------------------------------------
let g:lightline#bufferline#unnamed = "[NO NAME]"
let g:lightline#bufferline#filename_modifier= ":."
let g:lightline#bufferline#more_buffers = "..."
let g:lightline#bufferline#modified = " ●"
let g:lightline#bufferline#read_only = " "
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

" --[ indentLine ]--------------------------------------------------------------------
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
