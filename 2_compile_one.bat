@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ../scripts/preprocess.php cmain.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _cmain.lst _cmain.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/lst2bin.php _cmain.lst ./release/cmain.sav sav

..\scripts\rt11dsk.exe d main.dsk .\release\cmain.sav >NUL
..\scripts\rt11dsk.exe a main.dsk .\release\cmain.sav >NUL

echo.