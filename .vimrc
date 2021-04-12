" setting

syntax on
set number					" 줄번호 표시
set cindent					" C 프로그래밍용 자동 들여쓰기
set autoindent				" 자동 들여쓰기
set smartindent				" 스마트한 들여쓰기

set encoding=utf-8			" 한글 입력 설정
set termencoding=utf-8

set shiftwidth=4			" << or >>로 들여쓰기 할 때 스페이스의 갯수
set tabstop=4				" tab size 4
set laststatus=2			" 상태바 표시를 항상한다
set showmatch				" 괄호 표시
set hlsearch				" 검색시 강조

"===================================================================

" 색상 테마 설정
colorscheme jellybeans

"===================================================================

"Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vim plugin set
Plugin 'VundleVim/Vundle.vim'

" NERDTREE
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" tagbar
Plugin 'majutsushi/tagbar'

" 자동 완성
Plugin 'AutoComplPop'

call vundle#end()

"===================================================================

" 단축키
let mapleader=","
nmap <Leader>= gg=G								" 자동 들여쓰기

" 기본
nmap <F4> :wqa!<CR>								" 모든 창 저장하고 닫기
nmap <Leader>x :q!<CR>							" 저장하지 않고 닫기
nmap <Leader>s :w!<CR>							" 강제로 저장하기

"nmap <Leader>og :!gedit % &<CR><CR>				" gedit에서 열기
"nmap <Leader>of :!nemo % &<CR><CR>				" NEMO 열기

" term
nmap <C-D> :below term ++rows=10<CR>

" term terminal mode stop
" press "i" to restart term
tnoremap <Esc> <C-W>N

"설정 관련
nmap <Leader>vn :set number!<CR>				" 줄 번호
"nmap <Leader>vs :rightbelow vnew $MYVIMRC<CR>	" VIMRC 열기
nmap <Leader>vs :tabedit $MYVIMRC<CR>			" VIMRC 열기

" 창 이동
nmap <C-H> <C-W>h                           	" 왼쪽 창으로 이동
nmap <C-J> <C-W>j                           	" 아래 창으로 이동
nmap <C-K> <C-W>k                           	" 윗 창으로 이동
nmap <C-L> <C-W>l                           	" 오른쪽 창으로 이동

" 창분할 관련
nnoremap <Leader>rc :rightbelow vnew %<CR>
nnoremap <Leader>rn :rightbelow vnew<CR>

nmap <Leader>mv :tab vnew %<CR>					" copy to new tab
nnoremap <Leader>rtn :tabnew<CR>				" 새 탭으로 열기
" n번 째 탭 이동: 일반 모드에서 ngt

" 창 크기 조절
nmap <S-N> <C-W>-
nmap <S-M> <C-W>+

nmap <C-N> <C-W><
nmap <C-M> <C-W>>


" NERDtree
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

"C tags
nnoremap <Leader>t :TagbarToggle<CR>

"===================================================================

"C file
au BufNewFile,BufRead *.c exec ShortC()
function ShortC()
	" 하단 창 분활 후 컴파일
	:map <F5> :w!\| :below term ++rows=10 gcc % -o %<.out<CR>
	:map <F6> :w!\| :below term ++rows=10 ./%<.out<CR>

	" 새 창에서 컴파일&업로드
	:map <Leader><F5> :w!\| :tab term gcc % -o %<.out<CR>
	:map <Leader><F6> :w!\| :tab term ./%<.out<CR>
	
	" 파일 지우기
	":nmap <Leader>rd :w!\| :! clear;mv *.out ~/.local/share/Trash/;ls -l<CR>
	:nmap <Leader>rd :w!\| :below term ++rows=20 remove_out.sh<CR>
endfunction

"===================================================================

"Python file
au BufNewFile,BufRead *.py exec ShortPython()
function ShortPython()
	" 하단 창 분활 후 컴파일
	:map <F5> :w!\| :below term ++rows=10 python3 %<CR>
	
	" 새창에서 컴파일&업로드
	:map <Leader><F5> :w!\| : term python3 %<CR>
endfunction

"===================================================================

"arduino file
"au BufNewFile,BufRead *.ino exec ShortArduino()
"function ShortArduino()
"	" Arduio CLI Setting
"	:map <Leader>ab :w!\| :! clear;python3 /usr/share/arduino-cli/vim-board.py<CR>
"	:map <Leader>as :w!\| :! clear;python3 /usr/share/arduino-cli/vim-setting.py<CR>
"	
"	" 컴파일
"	:map <F5> :w!\| :! clear;python3 /usr/share/arduino-cli/vim-upload.py % 0<CR>
"	:map <F6> :w!\| :! clear;python3 /usr/share/arduino-cli/vim-upload.py % 1<CR>
"endfunction

"===================================================================

"Bash file
au BufNewFile,BufRead *.sh exec ShortBash()
function ShortBash()
	:map <F5> :w!\| :below term ++rows=10 chmod +x %<CR>
	
	 " 하단 창 분활 후 컴파일
	:map <F6> :w!\| :below term ++rows=10 ./%<CR>
	
	" 새창에서 컴파일&업로드
	:map <Leader><F6> :w!\| : term ./%<CR>
endfunction

"===================================================================

"fcitx 한글 
"if has('mac') && filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
"	autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
"endif
