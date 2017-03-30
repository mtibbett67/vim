set nocompatible
syntax on
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set relativenumber
execute pathogen#infect()
filetype plugin indent on
centers the current pane as the middle 2 of 4 imaginary columns
" should be called in a window with a single pane
function CenterPane()
lefta vnew
wincmd w
exec 'vertical resize '. string(&columns * 0.75)
endfunction
" optionally map it to a key:
" nnoremap <leader>c :call CenterPane()<cr>
