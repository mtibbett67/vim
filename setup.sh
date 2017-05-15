#! /bin/bash
cp ./vimrc ~/.vimrc
cp -r ./templates ~/.vim/
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle/
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/tpope/vim-surround.git
