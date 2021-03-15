#VIMRC
#au BufNewFile,BufRead *.c map <Leader><F6> :w!\| :! clear;python3 ~/.vim/my_vim/vim-C.py %< 0<CR><CR>
#au BufNewFile,BufRead *.c map <Leader><F5> :w!\| :! clear;python3 ~/.vim/my_vim/vim-C.py %< 1<CR><CR>

import os
import sys

file_name=sys.argv[1]
state_upload=int(sys.argv[2])

path_original=os.getcwd()											# 현재 파일 경로 저장

#print("VIM C")
#print(path_original)

if state_upload==1:
	command='gnome-terminal -- bash -c \"gcc ./'+file_name+'.c -o'+file_name+'.out;exec bash\"'
else:
	command='gnome-terminal -- bash -c \"./'+file_name+'.out;exec bash\"'

os.system(command)

