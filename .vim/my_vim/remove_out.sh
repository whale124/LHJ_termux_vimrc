#! /bin/bash
#원본 파일  ~/.vim/my_vim/remove_out.sh

echo "GCC file remover"
echo -e "Trash BIN = ~/local/share/Trash\n"


list_del=`ls |grep *.out`

# 파일 목록이 NULL 값이라면
if [ -z "$list_del" ]
then
	echo "There aren't *.out files"
else
	echo "Target Files:"
	echo "$list_del"

	# 지우기 전에 확인
	echo ""
	read -p 'Are you sure want to Delet this files? [Y/N/A]: ' answer
	
	if [ "$answer" = Y ] || [ "$answer" = y ]
	then
		mv $list_del ~/.local/share/Trash/
	elif [ "$answer" = A ] || [ "$answer" = a ]
	then
		rm $list_del
	fi
fi

echo -e "\nRemaining Files:"
ls -l --color=auto
