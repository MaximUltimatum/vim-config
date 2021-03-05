" pathogen setup
execute pathogen#infect()
syntax on
filetype plugin indent on

"Vim-one setup
let g:airline_theme='one'
colorscheme one
set background=dark

"NERDTree setup
"Ctrl-space to open NERDTree
nnoremap <C-@> :NERDTreeFocus<CR>
"Start NERDTree if vim has no file arguements
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"Start NERDTree if vim is started with a directory arguement
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

