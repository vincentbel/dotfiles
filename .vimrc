" ========================  general ========================

set nocompatible              " be iMproved
let mapleader = ","           " let leader key map to ',' rather than '\'

set t_Co=256
set background=dark
colorscheme spacegray-eighties " set color scheme to solarized
let g:solarized_termtrans=1

set backupdir=~/.vim/backups  " backup directory
set directory=~/.vim/swaps    " swaps directory
set undodir=~/.vim/undo       " undo directory

set history=1000              " store a ton of history (default is 20)
set encoding=utf-8 nobomb     " BOM often causes trouble
set number                    " show the line number
syntax on                     " turn on syntax highlight
set cursorline                " highlight current line
" set spell                   " spell checking on
set showmode                  " display the current mode

set scrolljump=5              " lines to scroll when cursor leaves screen
set scrolloff=3               " minimum lines to keep above and below cursor

set mouse=a                   " automatically enable mouse usage
set mousehide                 " hide the mouse cursor while typing

set showmatch                 " show matching brackets/parenthesis
set incsearch                 " find as you type search
set hlsearch                  " highlight search terms
set ignorecase                " case insensitive search
set smartcase                 " ignore 'ignorecase' if search patter contains uppercase characters

set tabstop=2                 " number of spaces that a <Tab> in the file counts for
set shiftwidth=2              " number of spaces to use for each step of (auto)indent
set expandtab                 " make the tab key (in insert mode) insert spaces instead of tab characters
set smarttab                  " at start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces

" wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" easier moving in tabs and windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" speed up viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" if has('clipboard')
"     if has('unnamedplus')  " when possible use + register for copy-paste
"         set clipboard=unnamed,unnamedplus
"     else         " On mac and Windows, use * register for copy-paste
"         set clipboard=unnamed
"     endif
" endif



" ========================  plugins ========================

call plug#begin('~/.vim/plugged')

" lean & mean status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'

" Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
" map <F3> :NERDTreeToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup = 1


" show relative number in normal mode
Plug 'jeffkreeftmeijer/vim-numbertoggle'


" show a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'


" syntax checking hacks for vim
Plug 'scrooloose/syntastic'
" setting from: <http://usevim.com/2016/03/07/linting/>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" visualize your vim undo tree
Plug 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_width = 72
let g:gundo_preview_height = 20

" full path fuzzy file, buffer, mru, tag, ... finder for vim
Plug 'ctrlpvim/ctrlp.vim'
" open ctrlp with cmd+p
" let g:ctrlp_map = '<D-p>'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" preview colors in source code while editing
Plug 'ap/vim-css-color'

" Plugin 'Lokaltog/vim-easymotion'
" map <Space> <Plug>(easymotion-s2)
" map <Space>h <Plug>(easymotion-lineforward)
" map <Space>j <Plug>(easymotion-j)
" map <Space>k <Plug>(easymotion-k)
" map <Space>l <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" let g:EasyMotion_smartcase = 1

" Plugin 'terryma/vim-multiple-cursors'

call plug#end()

" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
