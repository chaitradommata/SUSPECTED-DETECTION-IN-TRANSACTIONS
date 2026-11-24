@echo off
title Suspicious Detection in Transactions - SecureBank
color 0B

echo ======================================================================
echo       SUSPICIOUS DETECTION IN TRANSACTIONS - SYSTEM LAUNCHER           
echo ======================================================================
echo.

REM Create bin directory if it doesn't exist
if not exist "bin" mkdir bin

echo [1/2] Compiling Java source files...
javac -encoding UTF-8 -d bin -sourcepath src src/model/*.java src/database/*.java src/service/*.java src/utils/*.java src/components/*.java src/ui/*.java src/Main.java

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Compilation failed! Please ensure JDK is installed and PATH is configured.
    pause
    exit /b %ERRORLEVEL%
)

echo [OK] Compilation successful!
echo.
echo [2/2] Launching Suspicious Detection Desktop Application...
echo.

java -cp bin Main

echo.
echo Application closed.
pause
