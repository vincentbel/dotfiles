set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14

" don’t blink cursor in normal mode
set guicursor=n:blinkon0

" map cmd-n to open tab n
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
imap <D-1> <C-O>1gt
imap <D-2> <C-O>2gt
imap <D-3> <C-O>3gt
imap <D-4> <C-O>4gt
imap <D-5> <C-O>5gt

if has("gui_macvim")
  " map some common used keys as common editors do:
  "  New Tab:     cmd-t       => cmd-n
  "  New Window:  cmd-n       => cmd-shift-n
  "  Open Tab:    cmd-shift-t => none
  "  Show Errors: cmd-l       => none
  "  Print:       cmd-p       => none
  macmenu &File.New\ Tab key=<nop>
  macmenu &File.New\ Tab key=<D-n>
  macmenu &File.New\ Window key=<nop>
  macmenu &File.New\ Window key=<D-N>
  macmenu &File.Open\ Tab\.\.\. key=<nop>
  macmenu &Tools.List\ Errors key=<nop>
  macmenu &Tools.Make key=<nop>
  " disable print shortcut for 'goto anything...'
  macmenu File.Print key=<nop>
  map <D-p> :CtrlP<cr>
  map <D-t> :CtrlP<cr>
  imap <D-p> <esc>:CtrlP<cr>
  imap <D-t> <esc>:CtrlP<cr>
endif
