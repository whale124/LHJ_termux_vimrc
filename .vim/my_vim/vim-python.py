import os
import sys

file_name=sys.argv[1]

path_original=os.getcwd()											# 현재 파일 경로 저장

os.system("python3 --version")

# 파일 경로
print(path_original+"/"+file_name)

print("--------------------\n")
command='python3 '+file_name

os.system(command)

print("\n--------------------")
input("Press any key to exit...")
