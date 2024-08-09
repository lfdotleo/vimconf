#!/bin/sh
cp .vimrc ~/.vimrc
cd ~
ln -s ~/vimconf/coc-settings.json  coc-settings.json
ln -s ~/vimconf/.gvimrc .gvimrc
ln -s ~/vimconf/.ideavimrc .ideavimrc
