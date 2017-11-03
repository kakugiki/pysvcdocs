ECHO OFF

call "%VS140COMNTOOLS%\vsvars32.bat"

REM check if PySvcDocs exists
sc query PySvcDocs | find "does not exist" > nul
if %ERRORLEVEL% EQU 1 GOTO EXISTS
if %ERRORLEVEL% EQU 0 GOTO MISSING

:EXISTS
REM sc stop PySvcDocs
sc stop PySvcDocs

REM sc delete PySvcDocs
sc delete PySvcDocs

:MISSING

REM C:\Users\wguo\PycharmProjects\pysvcdocs
CD %~dp0

python.exe .\pysvcdocs.py --startup=delayed install

net start PySvcDocs 

pause