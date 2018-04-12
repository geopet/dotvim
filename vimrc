runtime macros/matchit.vim
set nocompatible              " Vim instead of Vi settings (:h 'nocompatible')
syntax on                     " Syntax highlighting (:h syntax)

" Setting <leader> to the spacebar (:h mapleader)
let mapleader=" "
" Trying to sort out why vim is slowing down my spacebar now
nnoremap <SPACE> <Nop>
" Fix slow O and spaces inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

execute pathogen#infect()
execute pathogen#helptags()

set t_Co=256
set background=dark
colorscheme monokai

set cursorline

set winwidth=79

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
set splitbelow
set splitright
set showtabline=2                 " Always show the tab bar

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
set mouse=a                       " Yeah, yeah... I'm adding mouse support

set nobackup
set noswapfile

set hidden                        " Deals with changed buffers silently (:h 'hidden')
set list                          " Show invisible characters (:h list)
set listchars=tab:▸\
set listchars+=eol:¬
set listchars+=trail:·

" Tired of the autoinsertion of comments
autocmd FileType * setlocal formatoptions-=cro

" Working with handlebars and ember I'm getting errors from syntastic this
" should fix this issue:
let g:syntastic_mode_map={ 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }

" Use JSX syntax highlighting for all JS files
let g:jsx_ext_required = 0

" Format elm files on save
let g:elm_format_autosave = 1

" Markdown prefs
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal textwidth=80

" set formatting for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

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

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" maps and leaders

nnoremap <leader>sr :silent :call <SID>StripTrailingWhitespaces()<CR>

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

" clean up file formatting
map <leader>i mmgg=G`m<CR>

" Ctrlp mapping
nnoremap <leader>b :CtrlPBuffer<CR>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" add pry binding iabbrev
iabbrev bpry require 'pry'; binding.pry
