@echo off
pushd "%~dp0"

set PYTHONWARNINGS=default
set PYTHONPYCACHEPREFIX=out\pycache
set ANKIDEV=1

REM put mpv on the path
set PATH=%PATH%;out\extracted\win_amd64_audio

call tools\ninja pylib/anki qt/aqt extract:win_amd64_audio || exit /b 1
.\out\pyenv\scripts\python tools\run.py %* || exit /b 1
popd
