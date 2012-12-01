
" Enable Syntax Colors
syntax on
if has("gui_running")
  set guifont=Mensch\ 10
else
  colorscheme mustang
endif

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized


" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Disable the blinking cursor.
set gcr=a:blinkon0

" Highlight current line 
if has("gui_running")
  set cursorline
endif