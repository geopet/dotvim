runtime macros/matchit.vim
set nocompatible              " Vim instead of Vi settings (:h 'nocompatible')
syntax on                     " Syntax highlighting, rather important (:h syntax)

" Setting <leader> to the spacebar (:h mapleader)
let mapleader=" "
" Trying to sort out why vim is slowing down my spacebar now
nnoremap <SPACE> <Nop>
" Fix slow O and spaces inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

" Setting list for disabling plugins
" let g:pathogen_disabled = ['syntastic']

" Loading plugins via Pathogen for runtime management <https://github.com/tpope/vim-pathogen>
execute pathogen#infect()

" Allows me to manage my colorscheme & language syntax files with submodules and Pathogen
execute pathogen#infect('colors/{}')
execute pathogen#infect('languages/{}')

" Invokes :helptags on everything in the runtimepath
execute pathogen#helptags()

" Dealing with .swp files cluttering up my working directory:
set directory=~/.vim/tmp/swap//

set t_Co=256 " 256 colors
silent! colorscheme jellybeans
set background=dark

"for irb on ubuntu
if version >= 703
  set colorcolumn=81
endif
set cursorline

set winwidth=84
set winheight=15
set winminheight=10
set winheight=999

filetype plugin on                " When a filetype is edited, its plugin file is loaded (:h filetype-plugin-on)
filetype indent on                " When a filetype is edited, its indent file is loaded (:h filetype-indent-on)

set showcmd                       " Display incomplete commands (:h 'showcmd')
set laststatus=2                  " Always show status line (:h 'laststatus')
set ruler                         " Show line and column number in status (:h 'ruler')
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set number                        " Show line number (:h number)
set numberwidth=5                 " Giving space on the number line (:h 'numberwidth')
set encoding=utf-8                " Set encoding to UTF-8 (:h 'encoding')
set scrolloff=8                   " Keep cursor 8 lines from the top or bottom of the buffer

set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set nowrap                        " Turn off line wrap (:h nowrap)
set expandtab                     " Turns tabs to spaces (:h 'expandtab')

set hlsearch                      " Highlight search results (:h 'hlsearch')
set incsearch                     " Highlights search incrementally (:h 'incsearch')
set ignorecase                    " Case insensitive searching (:h 'ignorecase')
set smartcase                     " Overrides ignorecase when an upper case character is present (:h 'smartcase')

set tabstop=2                     " Set tabs to 2 spaces (:h 'tabstop')
set shiftwidth=2                  " Spaces for autoindent >> and cindent (:h 'shiftwidth')
set autoindent                    " Repeat the indent from the line previous (:h 'autoindent')
set smartindent                   " A little better indenting (:h 'smartindent')
set cindent                       " C-style indentation (:h 'cindent)
set wildmode=longest,list,full    " Tab completion order (:h 'wildmode')
set wildmenu                      " Tab completion in commandline (:h 'wildmenu')

set hidden                        " Deals with changed buffers silently (:h 'hidden')
set list                          " Show invisible characters (:h list)
"set listchars=tab:>-
set listchars=tab:▸\
"set listchars+=eol:<
set listchars+=eol:¬
"set listchars+=trail:.
set listchars+=trail:·

" Tired of the autoinsertion of comments
autocmd FileType * setlocal formatoptions-=cro

" Working with handlebars and ember I'm getting errors from syntastic this
" should fix this issue:
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }

" Markdown prefs
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal textwidth=80

" clean up nerdtree oddities
let g:NERDTreeDirArrows=0
" prevent NERDTree from opening at startup
let g:NERDTreeHijackNetrw=0

" Function to remove trailing whitespace ala VimCasts http://vimcast.org/e/4
function! <SID>StripTrailingWhitespaces()
  " Preparation save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" highlight trailing whitespace (phishme fun!)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" maps and leaders

nnoremap <leader>sr :silent :call <SID>StripTrailingWhitespaces()<CR>

" Shortcut to rapidly toggle `set list`
" nmap <leader>l :set list!<CR>
nmap <leader>l :echoe "use unimpaired col"<CR>

" Map :noh to <CR>
noremap <CR> :noh<CR>

" Map kj to escape
inoremap kj <ESC>

" Fugitive mapping
noremap <leader>gs :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" paste mode / paste from system / kill paste mode
map <leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" clean up file formatting
map <leader>i mmgg=G`m<CR>

" NERDTree mapping
noremap <leader>t :NERDTreeToggle<CR>

" Ctrlp mapping
nnoremap <leader>b :CtrlPBuffer<CR>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Show/hide line numbers
" map <leader>n :set nonumber!<CR>
map <leader>n :echoe "use unimpaired con"<CR>

" set formatting for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72
