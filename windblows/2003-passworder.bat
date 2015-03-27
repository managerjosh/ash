@ECHO OFF

TITLE Changing Passwords

ECHO "Username","Password"
    
FOR /F "skip=1" %%A IN ('wmic useraccount get name') DO (
	ECHO "Administrator krbtgt binddn %USERNAME%"  | FINDSTR /V /I "%%A" 1>nul 2>nul) && (
		CALL :SETPASSWORD %%A
	)
)
     
GOTO :EOF
     
:SETPASSWORD
FOR /F "tokens=*" %%B IN ('NET USER %~1 /RANDOM ^| FINDSTR /I password') DO @SET OUTPUT="%%B"
SET PASSWORD=%OUTPUT:*is: =%
ECHO "%~1","%PASSWORD%

