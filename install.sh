# pkg install git
# git clone https://github.com/whale124/LHJ_termux_vimrc.git

echo "Termux INSTALL"

# termux 스토리지 접근 권한
termux-setup-storage 

# 패키지 업데이트 설치
pkg update -y && pkg update -y
 
# 기본 프로그램 설치
pkg install wget -y
 
pkg install vim -y

pkg install clang -y
pkg install python -y

apt-get update&&apt-get upgrade
apt-get ctags
apt-get build-essential

# 파일 복사
mv .bashrc .vim* ~
cd ~

# vim bundle 설치
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# remove_out.sh 환경변수 설정
ln -s ~/.vim/my_vim/remove_out.sh ~/../usr/bin

# 폴더 생성
mkdir -p ~/.local/share/Trash/

read -p "Do you want to install 'Termux Style'? [Y/N]:" an_style
if [ "$an_style" = Y ] || [ "$an_style" =y ]
then
	read -p "Do you want to install 'D2Coding'? [Y/N]:" an_font
	git clone https://github.com/adi1090x/termux-style
	
	if [ "$an_font" = Y ] || [ "$an_font" =y ]
	then
		wget https://github.com/Joungkyun/font-d2coding/blob/master/D2Coding.ttf -P termux-style/fonts	
	fi
	./termux-style/install
fi

rm -rf LHJ_termux_vimrc
