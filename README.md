# README

This is the repo for my vim dotfile management.

This commit history is going to be a mess. If you read it, I suspect you'll be
able to see into a dark place in my mind.

## Modules:

[Pathogen](https://github.com/tpope/vim-pathogen) - Manage runtime path and plugins  
[Syntastic](https://github.com/scrooloose/syntastic/) - Syntax checking  
[NERDTree](https://github.com/scrooloose/nerdtree) - File exploring  
[NERDCommenter](https://github.com/scrooloose/nerdcommenter) - Simple commenting  
[SuperTab](https://github.com/ervandew/supertab) - Better tab completion  
[Bundler](https://github.com/tpope/vim-bundler) - Bundler support  
[CSS-Color](https://github.com/skammer/vim-css-color) - Highlights CSS  
[Fugitive](https://github.com/tpope/vim-fugitive) - An awesome Git wrapper  
[Rails](https://github.com/tpope/vim-rails) - Rails power tools  
[Rake](https://github.com/tpope/vim-rake) - Rake power tools (may be redundant)  
[Ctrlp](https://github.com/kien/ctrlp.vim) - Fuzzy file/buffer finder  
[Tabular](https://github.com/godlygeek/tabular) - Text filtering and alignment

## Colorschemes:

[Tomorrow-Theme](https://github.com/chriskempson/vim-tomorrow-theme)  
[Solarized](https://github.com/altercation/vim-colors-solarized)  
[Jellybeans](https://github.com/nanotech/jellybeans.vim)  
[IR-Black](https://github.com/wgibbs/vim-irblack)  
[Twilight](git://github.com/matthewtodd/vim-twilight.git)  

## Installation:

`git clone git://github.com/geopet/dotvim.git ~/.vim`

Create symlinks:

`ln -s ~/.vim/vimrc ~/.vimrc`  
`ln -s ~/.vim/gvimrc ~/.gvimrc`  

`cd ~/.vim`  
`git submodule update --init`

## Upgrade submodule plugins:

### Single plugin:

`cd ~/.vim/bundle/[plugin_to_be_updated]`  
`git pull origin master`

### All submodule plugins:

`cd ~/.vim`  
`git submodule foreach git pull origin master`

_Install instructions shamelessly taken from [Vimcasts Episode 27](http://vimcasts.org/e/27)._

## Adding new plugins

1. Find the plugin you want (ideally on GitHub).
1. Depending on the type of resource run the Git submodule add command: i.e.
`$ git submodule add git://github.com/scrooloose/syntastic.git bundle/syntastic`

## Vim resources:

[The Vim Editor](http://www.vim.org/)  
[Derek Wyatt's Videos](http://www.derekwyatt.org/vim/vim-tutorial-videos/) - I can't recommend this resouce highly enough.  
[Vimcasts](http://vimcasts.org/) - Every episode I've watched I've learned something.  

## Some additional references:

[thoughtbot's vimrc](https://github.com/thoughtbot/dotfiles/blob/master/vimrc)  
[Mislav Marohnic's vim post](http://mislav.uniqpath.com/2011/12/vim-revisited/)  
