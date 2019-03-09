" load template into new files
if has("autocmd")
        augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
        autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
        augroup END
endif

" Get git branch
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '/n'")
endfunction

" Get git branch
function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" automatically leave insert mode after 'updatetime' milliseconds of inaction
autocmd CursorHoldI * stopinsert

" set 'updatetime' to 15 seconds when in insert mode
"au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
"au InsertLeave * let &updatetime=updaterestore

syntax on
set t_Co=256
set background=dark
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set relativenumber
" nnoremap <esc> :noh<return><esc>
execute pathogen#infect()
filetype plugin indent on

" NEERDtree settings
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<cr>

" Add marker at 80 char
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%80v.\+/

" Configure status line
set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

autocmd BufWritePre * :%s/\s\+$//e
call pathogen#helptags()
