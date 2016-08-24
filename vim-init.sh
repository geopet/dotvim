#!/usr/bin/env bash

cd

# remove current vim directories

rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.gvimrc

git clone git@github.com:geopet/dotvim.git ~/.vim

# install pathogen

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim configs create sym links

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# install plugins

cd ~/.vim/bundle

git clone git@github.com:kien/ctrlp.vim.git
git clone git@github.com:ervandew/supertab.git
git clone git@github.com:scrooloose/syntastic.git
git clone git@github.com:tpope/vim-bundler.git
git clone git@github.com:tpope/vim-commentary.git
git clone git@github.com:tpope/vim-fugitive.git
git clone git@github.com:tpope/vim-rails.git
git clone git@github.com:tpope/vim-rake.git
git clone git@github.com:tpope/vim-repeat.git
git clone git@github.com:tpope/vim-surround.git
git clone git@github.com:tpope/vim-unimpaired.git
git clone git@github.com:tpope/vim-vinegar.git
git clone git@github.com:tpope/vim-eunuch.git
git clone git@github.com:skalnik/vim-vroom.git

git clone git@github.com:pangloss/vim-javascript.git
git clone git@github.com:tpope/vim-markdown.git
git clone git@github.com:vim-ruby/vim-ruby.git
git clone git@github.com:mxw/vim-jsx.git
git clone git@github.com:elixir-lang/vim-elixir.git
git clone https://github.com/rust-lang/rust.vim.git rust.vim

# colors

git clone git@github.com:matthewtodd/vim-twilight.git
git clone git@github.com:nanotech/jellybeans.vim.git
git clone git@github.com:chriskempson/vim-tomorrow-theme.git
git clone git@github.com:rking/vim-detailed.git
git clone git@github.com:acarapetis/vim-colors-github.git
git clone git@github.com:wesgibbs/vim-irblack.git
git clone git@github.com:vim-scripts/Zenburn.git
git clone git@github.com:tomasr/molokai.git
