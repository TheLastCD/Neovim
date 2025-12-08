#!/bin/bash

dir = git/

cd $HOME
cd $dir

git clone --depth 1 https://github.com/Aietes/esp32.nvim

cd esp-idf

./install.sh

. ./export.sh

idf_tools.py install esp-clang

