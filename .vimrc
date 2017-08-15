"""""""""""""""""""""""""""""""
" Stuff for vundle
"""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" Examples
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
""Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
""Plugin 'ascenator/L9', {'name': 'newL9'}

" Syntastic - syntax checking and whatnot
Plugin 'scrooloose/syntastic'
" The NERD Tree - file tree navigation
Plugin 'scrooloose/nerdtree'
" nerdtree-git-plugin - display git info in NERD Tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" CtrlP - full path fuzzy file, buffer, mru, tag, ... finder
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic settings
" For statusline, emulate standard status line with 'ruler' set, then
" add syntastic stuff
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Automatically populate loc list when :lopen
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 1
" Don't let loc list open automatically
let g:syntastic_auto_loc_list = 0
" Run checkers on open and save
let g:syntastic_check_on_open = 1
" Don't run checkers on wq
let g:syntastic_check_on_wq = 0

" NERD tree config
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



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
