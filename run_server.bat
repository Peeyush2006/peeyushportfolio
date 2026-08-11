@echo off
title Peeyush Portfolio local server
echo ===================================================
echo   STARTING LOCAL SERVER FOR PEEYUSH PORTFOLIO
echo ===================================================
echo.

:: Detect open port
set PORT=8000
netstat -ano | findstr :%PORT% >nul
if %errorlevel% equ 0 (
    echo Port %PORT% is busy, trying port 8080...
    set PORT=8080
)

netstat -ano | findstr :%PORT% >nul
if %errorlevel% equ 0 (
    echo Port %PORT% is busy, trying port 5000...
    set PORT=5000
)

netstat -ano | findstr :%PORT% >nul
if %errorlevel% equ 0 (
    echo Port %PORT% is busy, trying port 9000...
    set PORT=9000
)

echo Opening default web browser at http://localhost:%PORT% ...
start http://localhost:%PORT%
echo.
echo Server is running on port %PORT%. Keep this window open!
echo Press Ctrl+C in this terminal to stop the server.
echo.
python -m http.server %PORT%
pause
