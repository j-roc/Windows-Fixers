:: Jesse Kulenski
:: Support Central
:: 5/9/11

:: This is the IE/Chrome fixer script, originally part of The One Batch File to Rule Them All, now in convenient component form.
:: It will: 

:: Delete IE temp files, history, cookies, saved form data, stored passwords
:: Delete Chrome temp files, history, cookies, saved form data, stored passwords
:: repopuplate default preferences for google apps
:: set gmail as the default mail client
:: set IE as default browser
:: set BBoard as IE homepage
:: disable IE script debugging
:: flush DNS cache

Title The All in One IE/Chrome Fixer Script

:: Delete IE Temp Files, history, cookies, form data, stored passwords,

@ECHO OFF
ECHO Deleting current user's Temporary Files, Cookies, History, Form Data and Stored Passwords
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

:: Delete Chrome temporary files, cookies, history, form data and stored passwords

@echo off
ECHO Deleting Chrome temporary files, cookies and history
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Cookies"
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\History"

:: set gmail as the default mail client for mailto: links
@echo off
ECHO fixing mailto: links
ftype mailto=C:\Program Files\Google\Chrome\Application\chrome.exe "https://mail.google.co/mail?extsrc=mailto&url=%1"


:: set IE as default browser 
@echo off
ECHO making sure IE is the Default Browser
reg add "HKCU\Software\Classes\.htm" /t REG_SZ /d "htmlfile" /ve /f
reg add "HKCU\Software\Classes\.html" /t REG_SZ /d "htmlfile" /ve /f
reg add "HKCU\Software\Classes\http\shell\open\command" /t REG_SZ /d "\"C:\Program Files\Internet Explorer\IEXPLORE.EXE\" -nohome" /ve /f
reg add "HKCU\Software\Classes\ftp\shell\open\command" /t REG_SZ /d "\"C:\Program Files\Internet Explorer\IEXPLORE.EXE\" %%1" /ve /f
reg add "HKCU\Software\Classes\https\shell\open\command" /t REG_SZ /d "\"C:\Program Files\Internet Explorer\IEXPLORE.EXE\" -nohome" /ve /f
reg delete "HKCU\Software\Classes\http\DefaultIcon" /ve /f
reg add "HKCU\Software\Classes\http\DefaultIcon" /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\url.dll,0" /ve /f
reg delete "HKCU\Software\Classes\ftp\DefaultIcon" /ve /f
reg add "HKCU\Software\Classes\ftp\DefaultIcon" /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\url.dll,0" /ve /f
reg delete "HKCU\Software\Classes\https\DefaultIcon" /ve /f
reg add "HKCU\Software\Classes\https\DefaultIcon" /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\url.dll,0" /ve /f
reg add "HKCU\Software\Classes\http\shell\open\ddeexec" /t REG_SZ /d "\"%%1\",,-1,0,,,," /ve /f
reg add "HKCU\Software\Classes\ftp\shell\open\ddeexec" /t REG_SZ /d "\"%%1\",,-1,0,,,," /ve /f
reg add "HKCU\Software\Classes\https\shell\open\ddeexec" /t REG_SZ /d "\"%%1\",,-1,0,,,," /ve /f
reg delete "HKCU\Software\Clients\StartMenuInternet" /ve /ve /f
reg add "HKLM\Software\Clients\StartMenuInternet" /t REG_SZ /d "IEXPLORE.EXE" /ve /f
reg add "HKCR\HTTP\shell\open\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKCR\HTTPS\shell\open\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKCR\FTP\shell\open\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKCR\htmlfile\shell\open\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKCR\htmlfile\shell\opennew\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKCR\mhtmlfile\shell\open\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKCR\mhtmlfile\shell\opennew\ddeexec\Application" /t REG_SZ /d "IExplore" /ve /f
reg add "HKLM\SOFTWARE\Classes\ftp\shell\open\ddeexec\ifExec" /t REG_SZ /d "*" /ve /f

:: set Google as IE homepage
@echo off
ECHO setting IE homepage to Google
REG ADD "HKCU\SOFTWARE\MICROSOFT\INTERNET EXPLORER\MAIN" /V "START PAGE" /D "http://www.google.com/" /F


:: Disable IE script debugging
@echo off
echo disabling IE script debugging
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /V "Disable Script Debugger" /D "yes" /F
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /V "DisableScriptDebuggerIE" /D "yes" /F

:: Flush DNS cache

@echo off
ECHO Flushing DNS cache
ipconfig /flushdns

exit