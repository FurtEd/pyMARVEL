@echo off
set IMAGE=furted/pymarvel:latest
set CONTAINER=pymarvel

echo ===================================================
echo   pyMARVEL - Checking Updates and Starting App
echo ===================================================

docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not running!
    echo Please start Docker Desktop first, then try again.
    pause
    exit /b
)

echo [INFO] Checking for the latest application updates...
docker pull %IMAGE%

docker container inspect %CONTAINER% >nul 2>&1
if %errorlevel% == 0 (
    echo [INFO] Updating local container environment...
    docker stop %CONTAINER% >nul 2>&1
    docker rm %CONTAINER% >nul 2>&1
)

echo [INFO] Launching pyMARVEL environment...
docker run -d --name %CONTAINER% -p 8080:8080 %IMAGE%

echo [INFO] Waiting for local server to initialize...
timeout /t 3 /nobreak >nul

echo [INFO] Opening Web Interface...
start http://localhost:8080

echo ===================================================
echo   Application is now RUNNING at http://localhost:8080
echo   Minimize this window, but DO NOT close it.
echo   Press any key inside this window to STOP the server.
echo ===================================================
pause

echo [INFO] Stopping pyMARVEL container...
docker stop %CONTAINER%
echo [INFO] Done.
timeout /t 2 >nul