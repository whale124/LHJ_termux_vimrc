# VIMRC
#au BufNewFile,BufRead *.py map <Leader><F5> :w!\| :! clear;python3 ~/.vim/my_vim/vim-python.py %<<CR><CR>

import os
import sys

file_name=sys.argv[1]

path_original=os.getcwd()											# 현재 파일 경로 저장

#print(path_original)

command='gnome-terminal -- bash -c \"python3 ./'+file_name+'.py;exec bash\"'

os.system(command)

