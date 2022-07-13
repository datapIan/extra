@echo off
cls
title Zonetool Helper v1.3
color 0a
goto :main
:main
cls
echo                     []==============================[]
echo.
echo                     	    Zonetool Helper v1.3     
echo                                 by forgive       
echo.
echo                     []==============================[]
echo.
pause
goto :warning

:warning
cls
echo                     []===============================[]
echo.
echo                           Rules and Prerequisites   
echo.
echo                     []===============================[]
echo.
echo      [-] Make sure this file is inside your Call of Duty game folder(s).
color 04
color 0a
echo.
echo      [-] This file is only compatible with Call of Duty 4, Modern Warfare 2, and Modern Warfare 3.
echo.
pause
goto :versioncheck

:versioncheck
if exist iw3mp.exe goto :iw3prep
if exist iw4x.exe goto :iw4prep
if exist iw5mp.exe goto :iw5prep
goto :versionchoice

:versionchoice
cls
echo                     []==============================[]
echo.
echo                             Game Version Menu
echo.
echo                     []==============================[]
echo.
color 04
echo		[-] Start off by telling me what game you are installing to.
color 0a
echo.
set /P c= Call of Duty 4[IW3]	Modern Warfare 2[IW4]	Modern Warfare 3[IW5]
echo.
if /I "%c%" EQU "IW3" goto :iw3check
if /I "%c%" EQU "IW4" goto :iw4check
if /I "%c%" EQU "IW5" goto :iw5check
goto :versionchoice.error

:versionchoice.error
cls
echo                     []==============================[]
echo.
echo                                   Error
echo.
echo                     []==============================[]
color 04
echo.
echo                     You did not input a valid argument!
echo.
pause
goto :versionchoice

:iw3check
cls
echo                     []==============================[]
echo.
echo                              One More Thing...
echo.
echo                     []==============================[]
echo.
color 04
echo     [x] Are you sure this is in the Call of Duty 4(IW3) folder? [y/n]
powershell -Command pwd
set /P c= y/n:
if /I "%c%" EQU "y" goto :iw3prep
goto :versionchoice

:iw3prep
cls
color 0a
echo                                     IW3
echo                     []==============================[]
echo.
echo                           Preparing to Download
echo.
echo                     []==============================[]
echo                               [-] Continue?
set /P c= y/n:
if /I "%c%" EQU "y" goto :iw3download
goto :main

:iw3download
color 06
echo [] Downloading...
powershell -Command "Invoke-WebRequest https://github.com/ZoneTool/zonetool/releases/latest/download/ZoneTool-x86-release.dll -OutFile ZoneTool-x86-release.dll"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/ZoneTool/zonetool-binaries/master/zonetool_iw3.exe -OutFile zonetool_iw3.exe"
ren ZoneTool-x86-release.dll zoneiw3.dll
echo [x] Done!
color 0a
goto :folders

:iw4check
cls
echo                     []==============================[]
echo.
echo                              One More Thing...
echo.
echo                     []==============================[]
echo.
color 04
echo     [x] Are you sure this is in the Modern Warfare 2(IW4) folder? [y/n]
powershell -Command pwd
set /P c= y/n:
if /I "%c%" EQU "y" goto :iw4prep
goto :versionchoice

:iw4prep
cls
color 0a
echo                                    IW4X
echo                     []==============================[]
echo.
echo                           Preparing to Download
echo.
echo                     []==============================[]
echo                               [-] Continue?
set /P c= y/n:
if /I "%c%" EQU "y" goto :iw4download
goto :main

:iw4download
color 06
[] Downloading...
powershell -Command "Invoke-WebRequest https://github.com/ZoneTool/zonetool/releases/latest/download/ZoneTool-x86-release.dll -OutFile ZoneTool-x86-release.dll"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/ZoneTool/zonetool-binaries/master/zonetool_iw4.exe -OutFile zonetool_iw4.exe"
ren ZoneTool-x86-release.dll zonetool.dll
[x] Done!
color 0a
goto :folders

:iw5check
cls
echo                     []==============================[]
echo.
echo                              One More Thing...
echo.
echo                     []==============================[]
echo.
color 04
echo     [x] Are you sure this is in the Modern Warfare 3(IW5) folder? [y/n]
powershell -Command pwd
set /P c= y/n:
if /I "%c%" EQU "y" goto :iw5prep
goto :versionchoice

:iw5prep
cls
color 0a
echo                                    IW5
echo                     []==============================[]
echo.
echo                           Preparing to Download
echo.
echo                     []==============================[]
echo                               [-] Continue?
set /P c= y/n:
if /I "%c%" EQU "y" goto :iw5download
goto :main

:iw5download
color 06
[] Downloading...
powershell -Command "Invoke-WebRequest https://github.com/ZoneTool/zonetool/releases/latest/download/ZoneTool-x86-release.dll -OutFile ZoneTool-x86-release.dll"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/ZoneTool/zonetool-binaries/master/zonetool_iw5.exe -OutFile zonetool_iw5.exe"
ren ZoneTool-x86-release.dll zonetool.dll
[x] Done!
color 0a
goto :folders

:folders
cls
color 0a
echo                     []==============================[]
echo.
echo                                Folder Setup
echo.
echo                     []==============================[]
echo.
echo   [-] Do you want me to make a zone_source and zonetool folder for you? [y/n]
set /P c= y/n:
if /I "%c%" EQU "y" goto :foldersetup
if /I "%c%" EQU "n" goto :finished
goto :finished

:foldersetup
md zone_source
md zonetool
goto :finished

:finished
cls
echo                     []==============================[]
echo.
echo                                 Finished
echo.
echo                     []==============================[]
echo.
echo [-] Thank you for using, feel free to run this file again whenever you need it.
echo.
echo [-] Credits to:
color 0a
echo          [] Rekti - For making Zonetool
echo          [] Expert - For giving me the idea
echo          [] Chopper - Automating and fixing the script
echo.
echo [x] Quitting now...
pause
exit