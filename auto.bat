@echo off
REM === Step 1: 啟動 Anaconda 環境 ===
CALL conda activate melody

REM === Step 2: 定義檔案與輸出路徑 ===
SET INPUT_AUDIO="fairytale.wav"
SET STEM_OUTPUT_DIR=output
SET VOCAL_PATH=output\converted_audio\vocals.wav
SET MIDI_OUTPUT_DIR=output\midi

REM === Step 3: 分離主旋律（vocals）與伴奏 ===
echo 🎵 正在使用 Spleeter 分離主旋律...
spleeter separate %INPUT_AUDIO% -p spleeter:2stems -o %STEM_OUTPUT_DIR%

REM === Step 4: 使用 Basic Pitch 轉換主旋律成 MIDI ===
echo 🎼 正在使用 Basic Pitch 轉換成 MIDI...
basic-pitch %MIDI_OUTPUT_DIR% %VOCAL_PATH%

REM === Step 5: 完成提示 ===
echo ✅ 轉換完成！請查看 %MIDI_OUTPUT_DIR%
pause
