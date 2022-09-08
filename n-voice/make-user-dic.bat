@echo off
cd %~dp0
mecab-dict-index.exe -d open_jtalk_dic_shift_jis-1.11 -u user.dic -f utf-8 -t shift-jis user.csv
pause
