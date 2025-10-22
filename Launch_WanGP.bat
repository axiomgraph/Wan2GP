@echo off
title WanGP Portable Launcher

:: ==============================
:: 💡 User-configurable paths
:: ==============================
set "PYTHON_PATH=%~dp0python_embeded\python.exe"
set "WANGP_PATH=%~dp0wan2gp"

:: =====================================================
:: Main Menu
:: =====================================================
:menu
cls
echo ==============================
echo     WanGP PORTABLE LAUNCHER
echo ==============================
echo.
echo [1] Update WanGP (git pull + install requirements)
echo [2] Launch WanGP (skip update)
echo [3] Run Python pip command
echo [4] Exit
echo.
set /p choice=Choose an option (1/2/3/4): 

if "%choice%"=="1" goto update
if "%choice%"=="2" goto launch
if "%choice%"=="3" goto python_cmd
if "%choice%"=="4" exit

echo Invalid choice.
pause
goto menu

:: ==============================
:: Update Section
:: ==============================
:update
echo.
echo Navigating to WanGP directory...
cd /d "%WANGP_PATH%"

echo.
echo Pulling latest changes from GitHub...
git pull

echo.
echo Installing/Updating Python requirements...
"%PYTHON_PATH%" -m pip install --upgrade pip
"%PYTHON_PATH%" -m pip install -r requirements.txt

echo.
echo Update complete.
pause
goto menu

:: ==============================
:: Launch Section
:: ==============================
:launch
echo.
echo Starting WanGP...
cd /d "%WANGP_PATH%"
"%PYTHON_PATH%" wgp.py --open-browser
pause
goto menu

:: ==============================
:: Python pip Command Section
:: ==============================
:python_cmd
echo.
echo Enter Python pip command arguments (e.g., install requests):
set /p usercmd=python -m pip 
if "%usercmd%"=="" (
    echo No command entered.
) else (
    "%PYTHON_PATH%" -m pip %usercmd%
)
pause
goto menu
