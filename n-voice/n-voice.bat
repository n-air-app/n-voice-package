@echo off
cd %~dp0
n-voice-engine.exe open_jtalk_dic_shift_jis-1.11 user.dic nvoice_default@2022-07-31T02-26-41.0100@False_nvoice_16k_mcd_L20-D10_S4-F64-C64-I0@2022-08-02T01-20-38.0040@False_False.pt n-voice_extra-voices
del *.wav
del *.txt
