"""""""""""""""""""""""""""""""
" set leader and key mappings
"""""""""""""""""""""""""""""""
" Set <Leader> key
let mapleader=","

" Clear highlights
noremap <Leader><space> :noh<CR>

"""""""""""""""""""""""""""""""
" set options
"""""""""""""""""""""""""""""""
set autoread			" Reload files changed outside vim
"set background=light		" Try to use good colors for a dark/light background
set backspace=indent,eol,start	" Allow backspacing over autoindent, line breaks, and start of insert
set colorcolumn=80		" list of screen columns that are highlighted
set completeopt=menu		" Use a popup menu to show possible completions
"set cursorcolumn		" Highlight the screen column of the cursor
set cursorline			" Highlight the screen line of the cursor
"set expandtab			" Use spaces for tabs
set hidden			" A buffer is not unloaded when abandoned
set smartindent			" Use previous line indent, but with some C syntax smarts
set history=100			" Number of remembered ':' commands
set hlsearch			" Highlight all matches of a previous search pattern
set incsearch			" Highlight all matching patterns as it is typed
set ignorecase			" Ignore case in search patterns
set smartcase			" Override ignorecase if pattern contains uppercase
set laststatus=2		" Always have a status line
set list			" Display tabs and trailing blanks
set listchars=trail:.,tab:>.	" Set characters for displaying tabs and trailing spaces
set showmatch			" When a bracket is inserted, briefly jump to the matching one
set matchtime=5			" Tenths of a second to show match
set number			" Print line number in front of each line
set relativenumber		" Display relative line number
set ruler			" Show line and column number
set ttyfast			" For fast terminal connection
set wildmenu			" Show possible completion matches in menu
set wildmode=list:longest,full	" First completion show list and complete to largest
				" common string. Then complete next full match

"""""""""""""""""""""""""""
" Other Useful Stuff
"""""""""""""""""""""""""""
" Highlight trailing whitespace in red - from http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
