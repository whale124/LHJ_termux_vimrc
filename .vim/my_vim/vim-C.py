import os
import sys

file_name=sys.argv[1]
file_name_1=sys.argv[2]
state_upload=int(sys.argv[3])

path_original=os.getcwd()											# 현재 파일 경로 저장

print("VIM C")
print(path_original+"/"+file_name)

print("--------------------\n")

if state_upload==1:
	command='gcc ./'+file_name+' -o'+file_name_1+'.out'
else:
	command='./'+file_name_1+'.out'

os.system(command)

print("\n--------------------")
input("Press any key to exit...")
