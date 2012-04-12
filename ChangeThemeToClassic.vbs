Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run "rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:""C:\Windows\Resources\Ease of Access Themes\classic.theme"""

Wscript.Sleep 2000
WshShell.AppActivate("Desktop Properties")
WshShell.Sendkeys "%FC"
WshShell.Sendkeys "{F4}"