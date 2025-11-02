set expandtab                " Convert tabs to spaces
set smarttab                 " Smart tab behavior at beginning of lines
set tabstop=4                " Number of spaces that a tab character displays as
set softtabstop=4            " Number of spaces inserted when pressing Tab in insert mode
set shiftwidth=4             " Number of spaces used for each step of autoindent
set number                   " Show line numbers
set foldcolumn=2             " Show fold column with width of 2 characters
syntax enable                " Enable syntax highlighting engine
syntax on                    " Turn on syntax highlighting
colorscheme desert           " Set color scheme to desert
set noerrorbells             " Disable error bell sounds
set novisualbell             " Disable visual bell (screen flashing)
set mouse=a                  " Enable mouse support in all modes
set clipboard=unnamed        " Use system clipboard for yank/paste operations
inoremap jj <Esc>            " Map 'jj' in insert mode to Escape key
au BufRead,BufNewFile *.cpp,*.hpp,*.c,*.h set filetype=cpp  " Set filetype to cpp for C/C++ files
autocmd FileType c,cpp setlocal cindent      " Enable C-style indentation for C/C++ files
autocmd FileType c,cpp setlocal smartindent  " Enable smart indentation for C/C++ files
autocmd FileType c,cpp setlocal autoindent   " Enable automatic indentation for C/C++ files
autocmd FileType c,cpp setlocal cinkeys=0{,0},0),0#,!^F,o,O,e  " Set C indentation trigger keys
autocmd FileType c,cpp setlocal cinoptions=:0,l1,t0,g0,(0,W4   " Configure C indentation options
