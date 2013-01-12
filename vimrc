" setting <leader> to the spacebar (:h mapleader)
let mapleader=" "

" loading Pathogen for runtime management <https://github.com/tpope/vim-pathogen>
execute pathogen#infect()

filetype plugin on      " When a filetype is edited, its plugin file is loaded (:h filetype-plugin-on)
filetype indent on      " When a filetype is edited, its indent file is loaded (:h filetype-indent-on)
syntax enable           " Syntax highlighting, rather important (:h syntax)

set nocompatible        " Vim instead of Vi settings (:h 'nocompatible')
set showcmd             " Display incomplete commands (:h 'showcmd')
set laststatus=2        " Always show status line (:h 'laststatus')
set ruler               " Show line and column number in status (:h 'ruler')
set number              " Show line number (:h number)
set encoding=utf-8      " Set encoding to UTF-8 (:h 'encoding')

set nowrap              " Turn off line wrap (:h nowrap)
set expandtab           " Turns tabs to spaces (:h 'expandtab')
set list                " Show invisible characters (:h list)

set hlsearch            " Highlight search results (:h 'hlsearch')
set incsearch           " Highlights search incrementally (:h 'incsearch')
set ignorecase          " Case insensitive searching (:h 'ignorecase'
set smartcase           " Overrides ignorecase when an upper case character is present
