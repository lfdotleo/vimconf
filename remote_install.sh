#!/bin/sh

cat ./base.vim > ~/.vimrc

echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc
echo "Plug 'vim-airline/vim-airline'" >> ~/.vimrc
echo "Plug 'mbbill/undotree'" >> ~/.vimrc
echo "Plug 'itchyny/vim-cursorword'" >> ~/.vimrc
echo "call plug#end()" >> ~/.vimrc
echo "let g:airline#extensions#tabline#enabled=1" >> ~/.vimrc
echo "let g:airline#extensions#tabline#buffer_nr_show=1" >> ~/.vimrc
echo "map <leader>ud :UndotreeToggle<CR>" >> ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
