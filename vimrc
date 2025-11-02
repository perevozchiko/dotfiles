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
au BufRead,BufNewFile *.cpp,*.hpp,*.c,*.h set filetype=cpp  " Set filetype to cpp for C/C++ files
autocmd FileType c,cpp setlocal cindent      " Enable C-style indentation for C/C++ files
autocmd FileType c,cpp setlocal smartindent  " Enable smart indentation for C/C++ files
autocmd FileType c,cpp setlocal autoindent   " Enable automatic indentation for C/C++ files
autocmd FileType c,cpp setlocal cinkeys=0{,0},0),0#,!^F,o,O,e  " Set C indentation trigger keys
autocmd FileType c,cpp setlocal cinoptions=:0,l1,t0,g0,(0,W4   " Configure C indentation options

" ===== TMUX INTEGRATION =====
" Tmux navigator - seamless navigation between tmux panes and vim splits
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  " Normal vim split navigation when not in tmux
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
endif
