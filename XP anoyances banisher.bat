:: Windows XP expert mode tweaks
:: A new batch file by Jesse Kulenski

:: Search dog be gone:

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /V "use search asst" /D "no" /F

:: MSN be gone:

RunDll32 advpack.dll,LaunchINFSection %windir%\\INF\\msmsgs.inf,BLC.Remove

:: turn on status bar on explorer windows


:: turn on quicklaunch


:: set default view to details

:: show file extensions

:: show hidden files, show hidden OS files, show system folders

:: Set visual style to windows classic



:: turn off run desktop clean off wizard

:: Add My Computer, etc icons to desktop

:: Turn on clear type

:: Turn off transition effects

:: close language bar

:: Windows XP start menu

exit