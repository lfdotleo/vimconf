#!/bin/sh
cp .vimrc ~/.vimrc
cd ~/.vimrc
ln -s ~/vimconf/coc-settings.json  coc-settings.json
cd ~
ln -s ~/vimconf/.gvimrc .gvimrc
ln -s ~/vimconf/.ideavimrc .ideavimrc
