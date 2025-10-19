@echo off
setlocal enabledelayedexpansion
if not exist "%~dp0..\test" (
  echo This script must be placed in the repository under scripts\\ and run from the repo root.
  pause
  exit /b 1
)
mkdir "%~dp0..\test_results" 2>nul
cd /d "%~dp0.."
echo Running Flutter tests one-by-one...
for /f "delims=" %%f in ('dir /b /s test\*.dart') do (
  echo ==================================================
  echo Running %%f
  flutter test "%%f" --reporter=expanded > "test_results\%%~nxf.log" 2>&1
  if ERRORLEVEL 1 (
    echo TEST FAILED: %%f -- see test_results\%%~nxf.log
  ) else (
    echo TEST PASSED: %%f
  )
)
echo.
echo All tests ran. See the folder test_results for per-test logs.
endlocal
pause

