" ========================  general ========================

set nocompatible              " be iMproved
let mapleader = " "           " let leader key map to ' ' rather than '\'

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

set backspace=indent,eol,start" make backspace work norally <https://vi.stackexchange.com/a/2163>

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

if has('clipboard')
    if has('unnamedplus')  " when possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif



" ========================  plugins ========================

call plug#begin('~/.vim/plugged')

" color scheme
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'

" lean & mean status/tabline
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" a tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeShowHidden=1 " show hidden file by default
map <Leader>n <plug>NERDTreeTabsToggle<CR>


" show relative number in normal mode
Plug 'jeffkreeftmeijer/vim-numbertoggle'


" show a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" a code-completion engine for vim
" Plug 'Valloric/YouCompleteMe'
" don't map <tab> key. <tab> key for the use of 'ultisnips'
" let g:ycm_key_list_select_completion = ['<Down>']

" the ultimate snippet solution for vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" visualize your vim undo tree
Plug 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_width = 72
let g:gundo_preview_height = 20

" full path fuzzy file, buffer, mru, tag, ... finder for vim
Plug 'ctrlpvim/ctrlp.vim'
" custom ignore
" use 'ag' to search faster, and ignore files by '~/.agignore'
" <https://github.com/kien/ctrlp.vim/issues/58#issuecomment-247017402>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'


" vim plugin for the Perl module / CLI script 'ack'
Plug 'mileszs/ack.vim'
" use 'ag' to search
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

Plug 'sheerun/vim-polyglot'

" preview colors in source code while editing
Plug 'ap/vim-css-color'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  " 1. install python3
  " 2. install newvim python client: pip3 install neovim
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Plugin 'Lokaltog/vim-easymotion'
" map <Space> <Plug>(easymotion-s2)
" map <Space>h <Plug>(easymotion-lineforward)
" map <Space>j <Plug>(easymotion-j)
" map <Space>k <Plug>(easymotion-k)
" map <Space>l <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" let g:EasyMotion_smartcase = 1

Plug 'terryma/vim-multiple-cursors'

call plug#end()


set t_Co=256
set background=dark
" should set color scheme after plug#end()
" <https://github.com/junegunn/vim-plug/wiki/faq#im-getting-cannot-find-color-scheme--does-vim-plug-support-color-schemes>
colorscheme Tomorrow-Night-Eighties
