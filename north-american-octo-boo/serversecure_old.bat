REM Delete volume shadow copy and then disable service
vssadmin delete shadows /all
sc config "VSS" start= disabled
sc stop "VSS"
REM Services to stop
net stop WinHttpAutoProxySvc
net stop TermService
REM Attempt to stop malicious services (cortana/cobalt strike known services--probably won't work but will alert you if found. use tasskill <PID> /f to destroy)
net stop netsrv
net stop racsvc
net stop huntsvc
REM Backup Firewall
netsh advfirewall export "C:\Windows\web\web.wfw"
REM The following two entries set the RPC port on DCs to a statically bound port rather than a dynamic range
REG add "HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" /v "TCP/IP Port" /t REG_DWORD /d 35353 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "DCTcpipPort" /t REG_DWORD /d 35353 /f
REM The following restricts anonymous enumeration access
REG add "HKLM\SYSTEM\CurrentControlSet\Control\LSA\" /v "EveryoneIncludesAnonymous" /t REG_DWORD /d 0 /f
REM The following disables WPAD
REG add "HKLM\SYSTEM\CurrentControlSet\services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d 4 /f
REM Disable accounts
net user Guest /active:no
REM Disable Windows Script Host and VBS Scripts
reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_DWORD /d 0 /f
REM Block ports
netsh advfirewall firewall add rule name="Block Port 445 in TCP" dir=in action=deny protocol=TCP localport=445
netsh advfirewall firewall add rule name="Block Port 134 in TCP" dir=in action=deny protocol=TCP localport=134
netsh advfirewall firewall add rule name="Block Port 3389 in TCP" dir=in action=deny protocol=TCP localport=3389
netsh advfirewall firewall add rule name="Block Port 4444 in TCP" dir=in action=deny protocol=TCP localport=4444
netsh advfirewall firewall add rule name="Block Port 137 in TCP" dir=in action=deny protocol=TCP localport=137
netsh advfirewall firewall add rule name="Block Port 138 in TCP" dir=in action=deny protocol=TCP localport=138
netsh advfirewall firewall add rule name="Block Port 139 in TCP" dir=in action=deny protocol=TCP localport=139
netsh advfirewall firewall add rule name="Block Port 22 in TCP" dir=in action=deny protocol=TCP localport=22
netsh advfirewall firewall add rule name="Block Port 445 in UDP" dir=in action=deny protocol=UDP localport=445
netsh advfirewall firewall add rule name="Block Port 134 in UDP" dir=in action=deny protocol=UDPlocalport=134
netsh advfirewall firewall add rule name="Block Port 3389 in UDP" dir=in action=deny protocol=UDPlocalport=3389
netsh advfirewall firewall add rule name="Block Port 4444 in UDP" dir=in action=deny protocol=UDP localport=4444
netsh advfirewall firewall add rule name="Block Port 137 in UDP" dir=in action=deny protocol=UDP localport=137
netsh advfirewall firewall add rule name="Block Port 138 in UDP" dir=in action=deny protocol=UDPlocalport=138
netsh advfirewall firewall add rule name="Block Port 139 in UDP" dir=in action=deny protocol=UDP localport=139
netsh advfirewall firewall add rule name="Block Port 22 in UDP" dir=in action=deny protocol=UDP localport=22
netsh advfirewall firewall add rule name="Block Port 445 out TCP" dir=out action=deny protocol=TCP localport=445
netsh advfirewall firewall add rule name="Block Port 134 out TCP" dir=out action=deny protocol=TCP localport=134
netsh advfirewall firewall add rule name="Block Port 3389 out TCP" dir=out action=deny protocol=TCP localport=3389
netsh advfirewall firewall add rule name="Block Port 4444 out TCP" dir=out action=deny protocol=TCP localport=4444
netsh advfirewall firewall add rule name="Block Port 137 out TCP" dir=out action=deny protocol=TCP localport=137
netsh advfirewall firewall add rule name="Block Port 138 out TCP" dir=out action=deny protocol=TCP localport=138
netsh advfirewall firewall add rule name="Block Port 139 out TCP" dir=out action=deny protocol=TCP localport=139
netsh advfirewall firewall add rule name="Block Port 22 out TCP" dir=out action=deny protocol=TCP localport=22
netsh advfirewall firewall add rule name="Block Port 445 out UDP" dir=out action=deny protocol=UDP localport=445
netsh advfirewall firewall add rule name="Block Port 134 out UDP" dir=out action=deny protocol=UDPlocalport=134
netsh advfirewall firewall add rule name="Block Port 3389 out UDP" dir=out action=deny protocol=UDPlocalport=3389
netsh advfirewall firewall add rule name="Block Port 4444 out UDP" dir=out action=deny protocol=UDP localport=4444
netsh advfirewall firewall add rule name="Block Port 137 out UDP" dir=out action=deny protocol=UDP localport=137
netsh advfirewall firewall add rule name="Block Port 138 out UDP" dir=out action=deny protocol=UDPlocalport=138
netsh advfirewall firewall add rule name="Block Port 139 out UDP" dir=out action=deny protocol=UDP localport=139
netsh advfirewall firewall add rule name="Block Port 22 out UDP" dir=out action=deny protocol=UDP localport=22
REM rename hosts file
ren "%SystemRoot%\system32\drivers\etc\hosts" hosts_old
REM drop current ARP table
arp -d *
REM Turn off and remove remote desktop/terminal services rules and add high encryption to term serv--may break it for red team?
netsh firewall set service type = remotedesktop mode = disable
netsh advfirewall firewall set rule group="remote desktop" new enable=No
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 9833 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 1 /f
REG ADD "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v SecurityLayer /t REG_DWORD /d 1 /f
REG ADD "HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v MinEncryptionLevel /t REG_DWORD /d 4 /f
REM Remove Sticky Key entries
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Utilman.exe" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DisplaySwitch.exe" /f

REM delete ALL scheduled tasks--not sure if want...
REM schtasks /delete /tn * /f

REM Re-enable automatic updates if disabled
REM 1 is don't check, 2 if check but don't download, 3 is download but don't install, and 4 is download and install
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
REM value of 0 is windows update server and a value of 1 is WSUS
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 0 /f
REM these registry keys set the value of the WSUS server
REM REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /F /v WUServer /t REG_SZ /d http://127.0.0.1
REM REG ADD "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /F /v WUStatusServer /t REG_SZ /d http://127.0.0.1
REM Delete policy fuckery. undo if something fucks up. value should be 0
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoWindowsUpdate /f
REM This may be for some legacy shit.. not sure.. delete anyway
REG DELETE "HKLM\SYSTEM\Internet Communication Management\Internet Communication" /F /v DisableWindowsUpdateAccess
REM More policy fuckery. Delete. undo if something breaks. value should be 0
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /F /v DisableWindowsUpdateAccess
