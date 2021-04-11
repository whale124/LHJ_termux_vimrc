echo "INSTALL"

termux-setup-storage 
pkg update -y && pkg update -y
 
pkg install wget -y
 
pkg install vim -y

pkg install clang -y
pkg install python -y

mv .bashrc .vim* ~
cd ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -rf LHJ_termux_vimrc
