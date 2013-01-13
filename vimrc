" setting <leader> to the spacebar (:h mapleader)
let mapleader=" "

" loading Pathogen for runtime management <https://github.com/tpope/vim-pathogen>
execute pathogen#infect()
" Allows me to manage my color schemes with submodules and Pathogen
execute pathogen#infect('colors')

filetype plugin on      " When a filetype is edited, its plugin file is loaded (:h filetype-plugin-on)
filetype indent on      " When a filetype is edited, its indent file is loaded (:h filetype-indent-on)
syntax enable           " Syntax highlighting, rather important (:h syntax)

set nocompatible        " Vim instead of Vi settings (:h 'nocompatible')
set showcmd             " Display incomplete commands (:h 'showcmd')
set laststatus=2        " Always show status line (:h 'laststatus')
set ruler               " Show line and column number in status (:h 'ruler')
set number              " Show line number (:h number)
set numberwidth=5       " Giving space on the number line (:h 'numberwidth')
set encoding=utf-8      " Set encoding to UTF-8 (:h 'encoding')

set nowrap              " Turn off line wrap (:h nowrap)
set expandtab           " Turns tabs to spaces (:h 'expandtab')
set list                " Show invisible characters (:h list)

set hlsearch            " Highlight search results (:h 'hlsearch')
set incsearch           " Highlights search incrementally (:h 'incsearch')
set ignorecase          " Case insensitive searching (:h 'ignorecase')
set smartcase           " Overrides ignorecase when an upper case character is present (:h 'smartcase')

set tabstop=2           " Set tabs to 2 spaces (:h 'tabstop')
set shiftwidth=2        " Spaces for autoindent >> and cindent (:h 'shiftwidth')
set autoindent          " Repeat the indent from the line previous (:h 'autoindent')
set smartindent         " A little better indenting (:h 'smartindent')
set cindent             " C-style indentation (:h 'cindent)

set hidden              " Deals with changed buffers silently (:h 'hidden')
set listchars=tab:▸\ ,eol:¬

colorscheme Tomorrow-Night

" Saving myself:
nnoremap <Left> :echoe: "Use h"<CR>
nnoremap <Right> :echoe: "Use l"<CR>
nnoremap <Up> :echoe: "Use k"<CR>
nnoremap <Down> :echoe: "Use j"<CR>

" function to remove trailing whitespace
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
