# README

This is the repo for my vim dotfile management.

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
