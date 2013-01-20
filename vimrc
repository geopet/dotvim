set nocompatible                  " Vim instead of Vi settings (:h 'nocompatible')

" Setting <leader> to the spacebar (:h mapleader)
let mapleader=" "

" Setting list for disabling plugins
" let g:pathogen_disabled = ['syntastic']

" Loading plugins via Pathogen for runtime management <https://github.com/tpope/vim-pathogen>
execute pathogen#infect()

" Allows me to manage my colorscheme & language syntax files with submodules and Pathogen
execute pathogen#infect('colors')
execute pathogen#infect('languages')

" Invokes :helptags on everything in the runtimepath
execute pathogen#helptags()

" Dealing with .swp files cluttering up my working directory:
set directory=~/.vim/tmp/swap//

colorscheme Tomorrow-Night
set guifont=Source\ Code\ Pro:h14
set colorcolumn=80

filetype plugin on                " When a filetype is edited, its plugin file is loaded (:h filetype-plugin-on)
filetype indent on                " When a filetype is edited, its indent file is loaded (:h filetype-indent-on)
syntax enable                     " Syntax highlighting, rather important (:h syntax)

set showcmd                       " Display incomplete commands (:h 'showcmd')
set laststatus=2                  " Always show status line (:h 'laststatus')
set ruler                         " Show line and column number in status (:h 'ruler')
set number                        " Show line number (:h number)
set numberwidth=5                 " Giving space on the number line (:h 'numberwidth')
set encoding=utf-8                " Set encoding to UTF-8 (:h 'encoding')
set scrolloff=8                   " Keep cursor 8 lines from the top or bottom of the buffer

set nowrap                        " Turn off line wrap (:h nowrap)
set expandtab                     " Turns tabs to spaces (:h 'expandtab')
set list                          " Show invisible characters (:h list)

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
set listchars=tab:▸\
set listchars+=eol:¬
set listchars+=trail:.

" PHP customization, see comments in syntax
let g:php_sql_query=1
let g:php_html_in_strings=1
let g:php_folding=1
let g:php_html_in_strings=1

" JavaScript customizations
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" NERDTree mapping
noremap <leader>n :NERDTreeToggle<CR>

" map <ESC> to jj
inoremap jj <ESC>

" Markdown prefs
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal textwidth=80

" Saving myself ala thoughtbot .vimrc https://github.com/thoughtbot/dotfiles/blob/master/vimrc:
nnoremap <Left> :echoe: "Use h"<CR>
nnoremap <Right> :echoe: "Use l"<CR>
nnoremap <Up> :echoe: "Use k"<CR>
nnoremap <Down> :echoe: "Use j"<CR>

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

nnoremap <leader>sr :silent :call <SID>StripTrailingWhitespaces()<CR>
