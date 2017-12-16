:Ini
set orgdir=%CD%
if not "%1"=="-sdb" @echo off
cls
REM Check superdebug paramter
if "%1"=="-sdb" set debug=true

set ver=1.1.1
set verdate=2017/09/14
set verdate_DE=14.09.2017
set WeegeeVer=0.3.1
title C'Man %ver%
color 0f

REM Folder where CMan files are loaded and saved.
REM USE '.' WITHOUT THE ''s IF YOU WANT TO AVOID A SUBDIRECTORY - DON'T KEEP IT EMPTY!
set rundir=CMan

REM Load portable if activated
if exist "%rundir%\cfg\port.cfg" set /p portable=<"%rundir%\cfg\port.cfg"

REM Checks priorized parameter portable mode. If activated, all data is saved in the local CMan folder instead externalized to %appdat%.
REM -port
if "%1"=="-port" set portable=true
if "%2"=="-port" set portable=true
if "%3"=="-port" set portable=true
if "%4"=="-port" set portable=true
if "%5"=="-port" set portable=true
if "%6"=="-port" set portable=true
if "%7"=="-port" set portable=true
if "%8"=="-port" set portable=true
if "%9"=="-port" set portable=true

REM Other portable settings

if "%portable%"=="true" set appdat=%CD%
if "%portable%"=="true" (set usernam=%username%) else (set usernam=CMan)
if not "%portable%"=="true" set appdat=%appdata%
REM Checks if application folder is inequal to current folder
if not "%portable%"=="true" if exist "%appdat%\%rundir%\cfg\dir.cfg" set /p checkdir=<"%appdat%\%rundir%\cfg\dir.cfg"
if not "%portable%"=="true" if exist "%appdat%\%rundir%\cfg\dir.cfg" if not "%cd%"=="%checkdir%" if not exist "%checkdir%" md "%checkdir%"
if not "%portable%"=="true" if exist "%appdat%\%rundir%\cfg\dir.cfg" if not "%cd%"=="%checkdir%" cd /D %checkdir%
if not "%portable%"=="true" if not exist "%appdat%\%rundir%\cfg\dir.cfg" set checkdir="%cd%"
REM if not "%portable%"=="true" if not exist "%appdat%\%rundir%\cfg\dir.cfg" md %checkdir%
REM if not "%portable%"=="true" if not exist "%appdat%\%rundir%\cfg\dir.cfg" cd %checkdir%
if "%portable%"=="true" set checkdir=%CD%
REM Checks if bot.js exists
if not exist "bot.js" (
set NC=1
) else (
set NC=0
)
REM Creates log folder
if not exist "%rundir%\log" md %rundir%\log
if exist "%rundir%\log\%usernam%.log" echo] >>"%rundir%\log\%usernam%.log"
if exist "%rundir%\log\%usernam%.log" echo ________________________________________________  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: CMan Version %ver% (%verdate%) has been started by %usernam%.  >>"%rundir%\log\%usernam%.log"
REM Delete old CMan_session.log
if exist "%rundir%\log\%usernam%_session.log" del /Q "%rundir%\log\%usernam%_session.log"
echo %date% - %time%: CMan Version %ver% (%verdate%) has been started by %usernam%.  >>"%rundir%\log\%usernam%_session.log"
echo] >>"%rundir%\log\%usernam%.log"
REM Checking if -debug parameter if active
REM -debug
if "%1"=="-debug" set debug=true
if "%2"=="-debug" set debug=true
if "%3"=="-debug" set debug=true
if "%4"=="-debug" set debug=true
if "%5"=="-debug" set debug=true
if "%6"=="-debug" set debug=true
if "%7"=="-debug" set debug=true
if "%8"=="-debug" set debug=true
if "%9"=="-debug" set debug=true
if "%debug%"=="true" echo %date% - %time%: Running in [debug] mode. >>"%rundir%\log\%usernam%.log"
if "%debug%"=="true" echo %date% - %time%: Running in [debug] mode. >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Debug mode recognized. Start CMan Version %ver% (%verdate%)...

REM if -debug = true show additional commands
if "%debug%"=="true" echo [%date% %time%] Initialize parameters...
echo %date% - %time%: Initialize parameters...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Initialize parameters...  >>"%rundir%\log\%usernam%_session.log"

REM -com
set com=false
if "%1"=="-com" set com=true
if "%2"=="-com" set com=true
if "%3"=="-com" set com=true
if "%4"=="-com" set com=true
if "%5"=="-com" set com=true
if "%6"=="-com" set com=true
if "%7"=="-com" set com=true
if "%8"=="-com" set com=true
if "%9"=="-com" set com=true

REM -direct
if "%1"=="-direct" set direct=true
if "%2"=="-direct" set direct=true
if "%3"=="-direct" set direct=true
if "%4"=="-direct" set direct=true
if "%5"=="-direct" set direct=true
if "%6"=="-direct" set direct=true
if "%7"=="-direct" set direct=true
if "%8"=="-direct" set direct=true
if "%9"=="-direct" set direct=true

REM -fast
if "%1"=="-fast" set fast=true
if "%2"=="-fast" set fast=true
if "%3"=="-fast" set fast=true
if "%4"=="-fast" set fast=true
if "%5"=="-fast" set fast=true
if "%6"=="-fast" set fast=true
if "%7"=="-fast" set fast=true
if "%8"=="-fast" set fast=true
if "%9"=="-fast" set fast=true

REM -install
if "%1"=="-install" set install=true
if "%2"=="-install" set install=true
if "%3"=="-install" set install=true
if "%4"=="-install" set install=true
if "%5"=="-install" set install=true
if "%6"=="-install" set install=true
if "%7"=="-install" set install=true
if "%8"=="-install" set install=true
if "%9"=="-install" set install=true

REM ARCH.SOLV
if "%debug%"=="true" echo [%date% %time%] Check which architecture is used...
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set arch=64
if "%PROCESSOR_ARCHITECTURE%"=="INTEL64" set arch=64

if "%PROCESSOR_ARCHITECTURE%"=="AMD32" set arch=32
if "%PROCESSOR_ARCHITECTURE%"=="INTEL32" set arch=32

if "%superbug%"=="true" pause >nul

:Ini2
REM Set principal variables
set runpath="%cd%"

REM Set other random variables
set steam="%ProgramFiles(x86)%\Steam\steamapps\common"

if "%debug%"=="true" echo [%date% %time%] Check CMan folder within runpath...
echo %date% - %time%: Check CMan folder within runpath...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Check CMan folder within runpath...  >>"%rundir%\log\%usernam%_session.log"

if not exist "%runpath%\%rundir%\cfg" goto Install_CMan_Runpath

if "%errorlevel%"=="0" echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%.log"
if "%errorlevel%"=="0" echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%_session.log"
if "%errorlevel%"=="0" if "%debug%"=="true" echo [%date% %time%] Done!
echo] >>"%rundir%\log\%usernam%.log"
if "%superbug%"=="true" pause >nul

REM Load principal variables after CMan check
if "%debug%"=="true" echo [%date% %time%] Load CMan variables...
echo %date% - %time%: Load CMan variables...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Load CMan variables...  >>"%rundir%\log\%usernam%_session.log"

REM autorun.dat
if not exist "%rundir%\autorun.dat" goto Install_CMan_Runpath
REM color.cfg
if not exist "%rundir%\cfg\color.cfg" goto Install_CMan_Runpath
if exist "%rundir%\cfg\color.cfg" set /p color=<"%rundir%\cfg\color.cfg"
REM wincolor.cfg
if not exist "%rundir%\cfg\wincolor.cfg" goto Install_CMan_Runpath
if exist "%rundir%\cfg\wincolor.cfg" set /p wincolor=<"%rundir%\cfg\color.cfg"
REM graph.cfg
if not exist "%rundir%\cfg\graph.cfg" goto Install_CMan_Runpath
if exist "%rundir%\cfg\graph.cfg" set /p graphmode=<"%rundir%\cfg\graph.cfg"

REM WeegeeBot
if not exist "%rundir%\cfg\weegeebot\mode.cfg" goto Install_CMan_Runpath
if exist "%rundir%\cfg\weegeebot\mode.cfg" set /p weegeemode=<"%rundir%\cfg\weegeebot\mode.cfg"

REM GMod
if not exist "%rundir%\cfg\garrysmod\host.cfg" goto Install_CMan_Runpath
if exist "%rundir%\cfg\garrysmod\host.cfg" set /p host=<"%rundir%\cfg\garrysmod\host.cfg"
if exist "%rundir%\cfg\garrysmod\rcon.cfg" set /p rcon=<"%rundir%\cfg\garrysmod\rcon.cfg"
if not exist "%rundir%\cfg\garrysmod\ip.cfg" goto Install_CMan_Runpath
if exist "%rundir%\cfg\garrysmod\map.cfg" set /p map=<"%rundir%\cfg\garrysmod\map.cfg"
if exist "%rundir%\cfg\garrysmod\console.cfg" set /p scon=<"%rundir%\cfg\garrysmod\console.cfg"
if exist "%rundir%\cfg\garrysmod\gsl.cfg" set /p gsl=<"%rundir%\cfg\garrysmod\gsl.cfg"
if exist "%rundir%\cfg\garrysmod\gamemode.cfg" set /p gamemode=<"%rundir%\cfg\garrysmod\gamemode.cfg"
if exist "%rundir%\cfg\garrysmod\game.cfg" set /p game=<"%rundir%\cfg\garrysmod\game.cfg"
if exist "%rundir%\cfg\garrysmod\maxplayers.cfg" set /p maxplayers=<"%rundir%\cfg\garrysmod\maxplayers.cfg"
if exist "%rundir%\cfg\garrysmod\ip.cfg" set /p ip=<"%rundir%\cfg\garrysmod\ip.cfg"
if exist "%rundir%\cfg\garrysmod\workshop.cfg" set /p workshop=<"%rundir%\cfg\garrysmod\workshop.cfg"

if "%errorlevel%"=="0" echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%.log"
if "%errorlevel%"=="0" echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%_session.log"
if "%errorlevel%"=="0" if "%debug%"=="true" echo [%date% %time%] Done!

:Ini3
REM Load from %AppConfig%
if "%debug%"=="true" echo [%date% %time%] Check %appdat%\CMan folder...
echo %date% - %time%: Check %appdat%\CMan folder...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Check %appdat%\CMan folder...  >>"%rundir%\log\%usernam%_session.log"

if not exist "%appdat%\%rundir%\apps" goto Install_CMan_appdat

if "%debug%"=="true" echo [%date% %time%] Done!
echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%_session.log"

REM Load variables from %appdat%
if "%debug%"=="true" echo [%date% %time%] Check %appdat%\CMan variables...
echo %date% - %time%: Check %appdat%\CMan variables...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Check %appdat%\CMan variables...  >>"%rundir%\log\%usernam%_session.log"

REM lang.cfg
if not exist "%appdat%\%rundir%\cfg\lang.cfg" goto Install_CMan_appdat
if not exist "%appdat%\%rundir%\cfg\dir.cfg" goto Install_CMan_appdat
if not exist "%appdat%\%rundir%\script\srcds\install.txt" goto Install_CMan_appdat
if exist "%appdat%\%rundir%\cfg\lang.cfg" set /p lang=<"%appdat%\%rundir%\cfg\lang.cfg"

REM host default check
if SRCDS_DEFAULT == true (
if "%lang%"=="de" echo [DE] C'Man Dedicated Server > "%rundir%\cfg\garrysmod\host.cfg"
if "%lang%"=="en" echo [EN] C'Man Dedicated Server > "%rundir%\cfg\garrysmod\host.cfg"
set /p host=<"%rundir%\cfg\garrysmod\host.cfg"
)

REM done
if "%debug%"=="true" echo [%date% %time%] Done!
echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done! [Errorlevel: %errorlevel%]  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo]
echo]  >>"%rundir%\log\%usernam%.log"

REM ____________________________Premenu Bloc__________________________
if "%direct%"=="true" goto start

:Ini4
REM Afterload parameters
if "%1"=="-nodemon" set weegeemode=nodemon
if "%2"=="-nodemon" set weegeemode=nodemon
if "%3"=="-nodemon" set weegeemode=nodemon
if "%4"=="-nodemon" set weegeemode=nodemon
if "%5"=="-nodemon" set weegeemode=nodemon
if "%6"=="-nodemon" set weegeemode=nodemon
if "%7"=="-nodemon" set weegeemode=nodemon
if "%8"=="-nodemon" set weegeemode=nodemon
if "%9"=="-nodemon" set weegeemode=nodemon

REM -----------------------

if not "%com%"=="true" if "%graphmode%"=="window" if "%debug%"=="true" pause
if not "%com%"=="true" if "%graphmode%"=="window" goto Menu_Alt
goto Menu
REM __________________________________________________________________
REM _________________________Installation Bloc________________________
REM __________________________________________________________________

:Install_CMan_Runpath
REM From Ini2.

echo %date% - %time%: Error! [Errorlevel: 1]  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Error! [Errorlevel: 1]  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Error!
echo] >>"%rundir%\log\%usernam%.log"

echo %date% - %time%: Create folders...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Create folders...  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Create folders...
REM Do said thing.

if not exist "%rundir%\cfg" md %rundir%\cfg
if not exist "%rundir%\cfg\garrysmod" md %rundir%\cfg\garrysmod
if not exist "%rundir%\cfg\weegeebot" md %rundir%\cfg\weegeebot
if not exist "%rundir%\import" md %rundir%\import
if not exist "%rundir%\import\script" md %rundir%\import\script
if not exist "%rundir%\import\exe" md %rundir%\import\exe

REM Install default config...
echo %date% - %time%: Create default config...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Create default config...  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Create default config...

REM CMan
if not exist "%rundir%\cfg\color.cfg" echo default>>"%rundir%\cfg\color.cfg"
if not exist "%rundir%\cfg\wincolor.cfg" echo default>>"%rundir%\cfg\wincolor.cfg"
if not exist "%rundir%\cfg\graph.cfg" echo console>>"%rundir%\cfg\graph.cfg"

if not exist "%rundir%\import\script\HelloWorld.txt" (
echo echo Buenos D¡as! >> "%rundir%\import\script\HelloWorld.txt"
echo start "SHED.MOV" "https://www.youtube.com/watch?v=cH-yA8U2XgI" >> "%rundir%\import\script\HelloWorld.txt"
)

if not exist "%rundir%\autorun.dat" (
echo ;[Default]>>"%rundir%\autorun.dat"
echo ;Initialize your custom command batch here after 'start'! >> "%rundir%\autorun.dat"
echo ;Regard that npm modules need to have a previous 'start' command, so instead of 'pm2 start thuglife.js', you need to enter 'start pm2 start thuglife.js'. >> "%rundir%\autorun.dat"
echo ;This is thought to prevent a batch breakdown and thus an unwanted interruption of C'Man. >> "%rundir%\autorun.dat"
echo ;_______________________________________________________ >> "%rundir%\autorun.dat"
echo start pm2 start bot.js --name="bot-EN" >> "%rundir%\autorun.dat"
)
REM WeegeeBot
if not exist "%rundir%\cfg\weegeebot\mode.cfg" echo pm2>> "%rundir%\cfg\weegeebot\mode.cfg"

REM GMod
if not exist "%rundir%\cfg\garrysmod\host.cfg" (
echo C'Man Dedicated Server > "%rundir%\cfg\garrysmod\host.cfg"
set SRCDS_DEFAULT = true
)
if not exist "%rundir%\cfg\garrysmod\map.cfg" echo gm_flatgrass>> "%rundir%\cfg\garrysmod\map.cfg"
if not exist "%rundir%\cfg\garrysmod\console.cfg" echo true>> "%rundir%\cfg\garrysmod\console.cfg"
if not exist "%rundir%\cfg\garrysmod\gsl.cfg" echo]>> "%rundir%\cfg\garrysmod\gsl.cfg"
if not exist "%rundir%\cfg\garrysmod\gamemode.cfg" echo sandbox>> "%rundir%\cfg\garrysmod\gamemode.cfg"
if not exist "%rundir%\cfg\garrysmod\game.cfg" echo GarrysMod>> "%rundir%\cfg\garrysmod\game.cfg"
if not exist "%rundir%\cfg\garrysmod\maxplayers.cfg" echo 8>> "%rundir%\cfg\garrysmod\maxplayers.cfg"
if not exist "%rundir%\cfg\garrysmod\ip.cfg" echo 0.0.0.0>> "%rundir%\cfg\garrysmod\ip.cfg"

echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Done!
goto Ini2

:rem
echo %date% - %time%: GabeN has striked.  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: GabeN has striked.  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] GabeN has striked.
title Our Lord and Ruler GabeN!
start http://www.z0r.de/7376
goto cmd

:Install_CMan_appdat
REM From Ini3.

echo %date% - %time%: Error! [Errorlevel: 1]  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Error! [Errorlevel: 1]  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Error!
echo] >>"%rundir%\log\%usernam%.log"

echo %date% - %time%: Create folders...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Create folders...  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Create folders...
REM Do said thing.

if not exist "%appdat%\%rundir%\apps" md %appdat%\%rundir%\apps
if not exist "%appdat%\%rundir%\cfg" md %appdat%\%rundir%\cfg
if not exist "%appdat%\%rundir%\import" md %appdat%\%rundir%\import
if not exist "%appdat%\%rundir%\script" md %appdat%\%rundir%\script
if not exist "%appdat%\%rundir%\script\srcds" md %appdat%\%rundir%\script\srcds

REM Install default config...
echo %date% - %time%: Create default config...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Create default config...  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" echo [%date% %time%] Create default config...

if not exist "%appdat%\%rundir%\cfg\dir.cfg" echo %cd%>>"%appdat%\%rundir%\cfg\dir.cfg"
if not exist "%appdat%\%rundir%\cfg\lang.cfg" echo en>>"%appdat%\%rundir%\cfg\lang.cfg"

REM %appdat%\%rundir%\script\srcds\install.txt
if not exist "%appdat%\%rundir%\script\srcds\install.txt" (
echo // Installation script for a GMod DD Setup if CMan.bat is in the same folder as the server is supposed to be >> "%appdat%\%rundir%\script\srcds\install.txt"
echo // For compatibility reasons, 'force_install_dir' is left out and has to be attached manually. >> "%appdat%\%rundir%\script\srcds\install.txt"
echo @ShutdownOnFailedCommand 1 >> "%appdat%\%rundir%\script\srcds\install.txt"
echo @NoPromptForPassword 1 >> "%appdat%\%rundir%\script\srcds\install.txt"
echo login anonymous >> "%appdat%\%rundir%\script\srcds\install.txt"
echo app_update 4020 >> "%appdat%\%rundir%\script\srcds\install.txt"
echo quit >> "%appdat%\%rundir%\script\srcds\install.txt"
)
REM -------------------------------
goto Ini3

REM __________________________________________________________________
REM __________________________________________________________________
REM __________________________________________________________________
REM __________________________________________________________________
:Menu
if not "%com%"=="true" if exist "%rundir%\cfg\graph.cfg" del /Q "%rundir%\cfg\graph.cfg"
if not "%com%"=="true" echo console>>"%rundir%\cfg\graph.cfg"
if not "%com%"=="true" set graphmode=console

if not "%debug%"=="true" cls
if "%debug%"=="true" echo]
if "%debug%"=="true" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if not "%debug%"=="true" echo C'Man Ver. %ver%   ³
if "%debug%"=="true" echo C'Man Ver. %ver%   ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
title C'Man %ver%
REM Choose Color
if "%color%"=="default" color 0f
if "%color%"=="snowwhite" color f0
if "%color%"=="santa" color 4e
if "%color%"=="matrix" color 0a
if "%color%"=="skyward" color 1e

if not "%lang%"=="de" echo Enter 'help' to get a list of the batch-specific commands. Start the bot regularly with 'bot'.
if "%lang%"=="de" echo Gib 'hilfe' ein, um eine Auflistung der batchspezifischen Befehle zu erhalten. Starte den Bot normal mit 'bot'.

:cmd
title C'Man %ver%
if "%color%"=="default" color 0f
if "%color%"=="santa" color 4e
if "%color%"=="matrix" color 0a
if "%color%"=="skyward" color 1e
set exec=echo]
set /p exec=¯ 

:ccheck
REM COMMAND CHECK

REM help
if "%exec%"=="hilfe" goto help
if "%exec%"=="help" goto help

REM data
if "%exec%"=="daten" goto data
if "%exec%"=="data" goto data

REM cmd on
if "%exec%"=="cmd an" goto cmdOn
if "%exec%"=="cmd on" goto cmdOn

REM cmd off
if "%exec%"=="cmd aus" goto cmdIsOff
if "%exec%"=="cmd off" goto cmdIsOff\

REM restart
if "%exec%"=="neustart" goto restart_weegee
if "%exec%"=="restart" goto restart_weegee

REM graph
if "%exec%"=="graph" goto Menu_Alt

REM cmd off
if "%exec%"=="cmd aus" goto cmdIsOff
if "%exec%"=="cmd off" goto cmdIsOff

REM language
if "%exec%"=="sprache" goto langSetup
if "%exec%"=="lang" goto langSetup

REM monit
if "%exec%"=="monit" goto monit

REM path
if "%exec%"=="pfad" goto path
if "%exec%"=="path" goto path

REM readme
if "%exec%"=="liesmich" goto readme
if "%exec%"=="readme" goto readme

REM dev-debug
if "%exec%"=="GabeN" goto rem

REM wakeyUp
if "%exec%"=="Allahu Akbar" goto stopopextended

REM cls
if "%exec%"=="cls" cls

REM color
if "%exec%"=="farbe" goto color
if "%exec%"=="color" goto color

REM credit
if "%exec%"=="ber" goto about
if "%exec%"=="about" goto about

REM nodemon 
if "%exec%"=="nodemon" goto start_weegee_nodemon

REM exe
if "%exec%"=="exe" goto exe

REM port
if "%exec%"=="port" goto port

REM reboot
if "%exec%"=="reboot" goto reboot

REM root
if "%exec%"=="root" goto root

REM start
if "%exec%"=="start" goto start

REM stop
if "%exec%"=="stop" goto stop

REM stopop
if "%exec%"=="stopop" goto stopop

REM support
if "%exec%"=="support" goto support

REM PM2
if "%exec%"=="bot" goto start_weegee

REM install
if "%exec%"=="install" goto install

REM digit
if not "%lang%"=="de" if "%exec%"=="MayTheForceBeWithYou" goto digit
if "%lang%"=="de" if "%exec%"=="M”geDieMachtMitDirSein" goto digit

REM debug
if "%exec%"=="debug"=="node" goto start_weegee_debug

REM log
if "%exec%"=="log" goto log

REM also debug
if "%exec%"=="node" goto debug

if "%debug%"=="true" %exec%
if not "%debug%"=="true" cls
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

REM Command List

:help
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if "%lang%"=="de" title Befehlsliste
if "%graphmode%"=="window" if not "%lang%"=="de" title Command List

if "%graphmode%"=="window" if "%lang%"=="de" echo Befehlsliste
if "%graphmode%"=="window" if not "%lang%"=="de" echo Command List
if "%graphmode%"=="window" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

if not "%lang%"=="de" echo ÚÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
if not "%lang%"=="de" echo ³                  COMMAND LIST                  º
if not "%lang%"=="de" echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¹
if not "%lang%"=="de" echo ³about         -  About BotBat for WeegeeBot.    º
if not "%lang%"=="de" echo ³bot           -  Initializes bot.js.            º
if not "%graphmode%"=="window" if not "%lang%"=="de" echo ³cls           -  Clears console.                º
if not "%lang%"=="de" echo ³cmd [on/off]  -  Switch among Windows CMD       º
if not "%lang%"=="de" echo ³                 and BotBat prompt. Useful in   º
if not "%lang%"=="de" echo ³                 case of command conflicts.     º
if not "%lang%"=="de" echo ³color         -  Change console color.          º
if not "%lang%"=="de" echo ³data          -  Lists all relevant variables.  º
if not "%lang%"=="de" echo ³restart       -  Restarts Weegeebot using pm2.  º
if not "%lang%"=="de" echo ³debug         -  Uses node.js instead of        º
if not "%lang%"=="de" echo ³                 default PM2.                   º
if not "%lang%"=="de" echo ³                 Useful for debug purposes.     º
if not "%lang%"=="de" echo ³exe           -  Executes script in import\exe. º
if not "%lang%"=="de" echo ³exit          -  Determines C'Man cleanly.      º
if not "%lang%"=="de" echo ³graph         -  Switches to graphical mode.    º
if not "%lang%"=="de" echo ³install       -  Opens installation menu.       º
if not "%lang%"=="de" echo ³lang          -  Change language.               º
if not "%lang%"=="de" echo ³log           -  Shows current logging session. º
if "%weegeemode%"=="pm2" if not "%lang%"=="de" echo ³monit         -  Monitores all pm2 instances.   º
if not "%lang%"=="de" echo ³node          -  See 'debug'.                   º
if not "%lang%"=="de" echo ³nodemon       -  Use nodemon.js to start bot.js,º
if not "%lang%"=="de" echo ³              -  not recommended.               º
if not "%lang%"=="de" echo ³path          -  Change server path.            º
if not "%portable%"=="true" if not "%lang%"=="de" echo ³port          -  Activates portable mode.       º
if "%portable%"=="true" if not "%lang%"=="de" echo ³port          -  Deactivates portable mode.     º
if not "%lang%"=="de" echo ³readme        -  Opens ReadMe file.             º
if not "%lang%"=="de" echo ³reboot        -  Restarts C'Man.                º
if not "%lang%"=="de" echo ³root          -  Opens server path.             º
if not "%lang%"=="de" echo ³set           -  Opens settings for C'Man.      º
if not "%lang%"=="de" echo ³start         -  Executes autorun.dat.          º
if not "%lang%"=="de" echo ³stop          -  Stops all processes and ter-   º
if not "%lang%"=="de" echo ³              -  minates C'Man.                 º
if not "%lang%"=="de" echo ³stopop        -  Like 'stop'; however, C'Man    º
if not "%lang%"=="de" echo ³              -  stays available.               º
if not "%lang%"=="de" echo ³support       -  Lists a few ways for support   º
if not "%lang%"=="de" echo ÀÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

if "%lang%"=="de" echo ÚÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
if "%lang%"=="de" echo ³                     BEFEHLSLISTE                  º
if "%lang%"=="de" echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¹
if "%lang%"=="de" echo ³bot             -  Initialisiert bot.js.           º
if not "%graphmode%"=="window" if "%lang%"=="de" echo ³cls             -  Leert Konsole.                  º
if "%lang%"=="de" echo ³cmd [an/aus]    -  Wechsle zwischen Eingabeauf-    º
if "%lang%"=="de" echo ³                   forderung und der BotBat-       º
if "%lang%"=="de" echo ³                   Prompt. Ntzlich, falls Be-     º
if "%lang%"=="de" echo ³                   Fehlskonflikte bestehen.        º
if "%lang%"=="de" echo ³daten           -  Listet alle relevanten Variab-  º
if "%lang%"=="de" echo ³                   len auf.                        º
if "%lang%"=="de" echo ³debug           -  Nutze node.js statt stan-       º
if "%lang%"=="de" echo ³                   dardlichem PM2. Ntz-           º
if "%lang%"=="de" echo ³                   lich fr Debugzwecke.           º
if "%lang%"=="de" echo ³exe             -  Fhrt Skript in import\exe aus. º
if "%lang%"=="de" echo ³exit            -  Verl„sst C'Man sauber.          º
if "%lang%"=="de" echo ³farbe           -  ndert Konsolenfarbe.           º
if "%weegeemode%"=="pm2" if "%lang%"=="de" echo ³neustart        -  Startet Weegeebot mit PM2 neu.  º
if "%lang%"=="de" echo ³graph           -  Wechselt zum grafischen Modus.  º
if "%lang%"=="de" echo ³install         -  ™ffnet Installationsmen.       º
if "%lang%"=="de" echo ³liesmich        -  ™ffnet LIESMICH-Datei.          º
if "%lang%"=="de" echo ³log             -  Zeigt aktuellen Loggingverlauf. º
if "%weegeemode%"=="pm2" if "%lang%"=="de" echo ³monit           -  Gibt einen šberblick ber alle  º
if "%weegeemode%"=="pm2" if "%lang%"=="de" echo ³                   pm2-Instanzen.                  º
if "%lang%"=="de" echo ³node            -  Siehe 'debug'.                  º
if "%lang%"=="de" echo ³nodemon         -  Nutze nodemon.js zum Start,     º
if "%lang%"=="de" echo ³                   nicht empfohlen.                º
if "%lang%"=="de" echo ³pfad            -  ndere Betriebspfad.            º
if "%portable%"=="true" if "%lang%"=="de" echo ³port            -  Deaktiviert Portablemodus.      º
if not "%portable%"=="true" if "%lang%"=="de" echo ³port            -  Aktiviert Portablemodus.        º
if "%lang%"=="de" echo ³reboot          -  Startet C'Man neu.              º
if "%lang%"=="de" echo ³root            -  ™ffnet Serverpfad.              º
if "%lang%"=="de" echo ³sprache         -  ndere Sprache.                 º
if "%lang%"=="de" echo ³start           -  Fhrt autorun.dat aus.          º
if "%lang%"=="de" echo ³stop            -  Stoppt alle Prozesse und been-  º
if "%lang%"=="de" echo ³                   det C'Man.                      º
if "%lang%"=="de" echo ³stopop          -  wie 'stop', C'Man bleibt jedoch º
if "%lang%"=="de" echo ³                   in Betrieb.                     º
if "%lang%"=="de" echo ³support         -  Listet ein paar Support-Quel-   º
if "%lang%"=="de" echo ³                   len auf.                        º
if "%lang%"=="de" echo ³ber            -  šber BotBat fr WeegeeBot.      º
if "%lang%"=="de" echo ÀÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

if "%graphmode%"=="window" echo]
if "%graphmode%"=="window" pause
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

REM ------------------------------------------------------------

:cmdIsOff
if not "%lang%"=="de" echo Windows CMD is already inferior to BotBat.
if "%lang%"=="de" echo Windows CMD ist BotBat bereits untergeordnet.
goto cmd

:cmdOff
if not "%lang%"=="de" echo Windows CMD is now inferior to BotBat.
if "%lang%"=="de" echo Windows CMD ist BotBat jetzt untergeordnet.
goto cmd

:cmdIsOn
if not "%lang%"=="de" echo BotBat is already inferior to Windows CMD.
if "%lang%"=="de" echo BotBat ist Windows CMS bereits untergeordnet.
goto cmdS

:cmdOn
echo.
if not "%lang%"=="de" echo BotBat is now inferior to the Windows CMD. Return with 'cmd off'.
if "%lang%"=="de" echo BotBat wurde zugunsten der Eingabeaufforderung untergeordnet. Kehre mit 'cmd aus' zurck.
goto cmdS

:cmdS
set /p exec=
if "%exec%"=="cmd an" goto cmdIsOn
if "%exec%"=="cmd on" goto cmdIsOn

if "%exec%"=="cmd aus" goto cmdOff
if "%exec%"=="cmd off" goto cmdOff
%exec%
goto cmdS

REM #########################################################
REM Friendly Menu based on the old CMan

:Menu_Alt
REM Checks if bot.js exists
if not exist "%rundir%\..\bot.js" set NW=1
if exist "%rundir%\..\bot.js" set NW=0

REM Checks if SRCDS.exe exists
if not exist "%rundir%\..\srcds.exe" set NC=1
if exist "%rundir%\..\srcds.exe" set NC=0
REM Changes graph mode permanently
if exist "%rundir%\cfg\graph.cfg" del /Q "%rundir%\cfg\graph.cfg"
echo window>>"%rundir%\cfg\graph.cfg"
set graphmode=window
REM Mode command!!!

if "%lang%"=="de" title C'Man %ver% (%verdate_DE%)
if not  "%lang%"=="de" title C'Man %ver% (%verdate%)
REM Color
if exist "%rundir%\cfg\wincolor.cfg" set /p wincolor=<"%rundir%\cfg\wincolor.cfg"
if "%wincolor%"=="default" color 1f
if "%wincolor%"=="negative" color d0
if "%wincolor%"=="matrix" color 2f
if "%wincolor%"=="pony" color 5f
if "%wincolor%"=="commie" color 0c
REM -------------
if not "%1"=="-sdb" cls
if not "%debug%"=="true" echo °°°°°°°°°°°°±±±±±±±±±±±±±±±±±±±±±±±²²²²²²²²²²²²º C'Man Version %Ver%   º²²²²²²²²²²²²±±±±±±±±±±±±±±±±±±±±±±±°°°°°°°°°°°°                                               ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
if "%debug%"=="true" echo ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº C'Man Version %Ver%   ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ                                               ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo                                                        2016 - 2017
echo.
set /a motd=%RANDOM% * 10/32768 +1
if "%motd%"=="1" if "%lang%"=="en" echo                                            ...kinkiest batch since Windows ME.
if "%motd%"=="1" if "%lang%"=="de" echo                                          ...schrulligste Batch seit Windows ME.
if "%motd%"=="2"                   echo                                                      White and Nerdy!
if "%motd%"=="3" if "%lang%"=="en" echo                                       Back in times when Spongebob used to be coral...
if "%motd%"=="3" if "%lang%"=="de" echo                                           Damals, als Spongebob noch korall war...
if "%motd%"=="4" if "%lang%"=="en" echo                                                  Sponsored by Billy Mays.
if "%motd%"=="4" if "%lang%"=="de" echo                                               Gesponsert von Marcell D'Avis.
if "%motd%"=="5" if "%lang%"=="en" echo                                                 Stephen Bannon likes this.
if "%motd%"=="5" if "%lang%"=="de" echo                                                  Bernd H”cke gef„llt das.
if "%motd%"=="6" if "%lang%"=="en" echo Yo dawg, I heard you like catchphrases, so we put catchphrases inside catchphrases so you can read catchphrases while U
if "%motd%"=="6" if "%lang%"=="en" echo                                                     read catchphrases!
if "%motd%"=="6" if "%lang%"=="de" echo  Ey Digga, ich hab' geh”rt, dass du Catchphrases magst, also haben wir Catchphrases in Catchphrases reingepackt, damit
if "%motd%"=="6" if "%lang%"=="de" echo                          du Catchphrases readen kannst, w„hrend du Catchphrases am readen bist!
if "%motd%"=="7" if "%lang%"=="en" echo                                      GabeN would still give this batch Steam Greenlight!
if "%motd%"=="7" if "%lang%"=="de" echo                                  GabeN wrde der Batch immer noch Steam Greenlight geben!
if "%motd%"=="8" if "%lang%"=="en" echo                                                      Made in Kekistan.
if "%motd%"=="8" if "%lang%"=="de" echo                                                  Hergestellt in Kekistan.
if "%motd%"=="9" if "%lang%"=="en" echo                                              Michael Rosen would find this noice.
if "%motd%"=="9" if "%lang%"=="de" echo                      In der Tat, Dr. Klenk hat die Wirkung von C'Man gegen Einh”rner best„tigt.
if "%motd%"=="10" if "%lang%"=="en" echo                                    [s] takes you straight to hell - to Dr. Hax's hell!
if "%motd%"=="10" if "%lang%"=="de" echo                                 [s] bringt dich sicher in die H”lle - in Dr. Hax's H”lle!
echo.
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
if "%lang%"=="de" echo [1] - Start                 º
if not "%lang%"=="de" echo [1] - Start                 º
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
REM 2
if "%lang%"=="de" echo [2] - Installation          ³
if not "%lang%"=="de" echo [2] - Install               ³
REM 3
echo [3] - Details               ³
REM 4
if "%lang%"=="de" echo [4] - CMan-Konsole          ³
if not "%lang%"=="de" echo [4] - CMan Console          ³
REM 5
if "%lang%"=="de" echo [5] - šber                  ³
if not "%lang%"=="de" echo [5] - About                 ³
REM 6
if "%lang%"=="de" echo [6] - Beenden               ³
if not "%lang%"=="de" echo [6] - Exit                  ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
REM if Weegeebot is uninstalled
if "%NW%"=="1" if "%lang%"=="de" echo [w] - Installiere Weegeebot ³
if "%NW%"=="1" if "%lang%"=="en" echo [w] - Install Weegeebot     ³
REM if Weegeebot is installed
if "%NW%"=="0" if "%lang%"=="de" echo [w] - Starte Weegeebot      ³
if "%NW%"=="0" if "%lang%"=="en" echo [w] - Start Weegeebot       ³

REM if SRCDS is uninstalled
if "%NC%"=="1" if "%lang%"=="de" echo [s] - Installiere SRCDS     ³
if "%NC%"=="1" if "%lang%"=="en" echo [s] - Install SRCDS         ³
REM if SRCDS is installed
if "%NC%"=="0" if "%lang%"=="de" echo [s] - Starte SRCDS          ³
if "%NC%"=="0" if "%lang%"=="en" echo [s] - Start SRCDS           ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%NW%"=="1" if "%lang%"=="de" echo Das ist eine Neuinstallation.
if "%NW%"=="1" if not "%lang%"=="de" echo This is a new installation.

if "%lang%"=="de" echo Parameter: %1 %2 %3 %4 %5 %6 %7 %8 %9 
if not "%lang%"=="de" echo Parameters: %1 %2 %3 %4 %5 %6 %7 %8 %9 
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%PING_START%"=="1" if not "%lang%"=="de" echo Script successfully executed!
if "%PING_START%"=="1" if "%AUTORUN_DEFAULT%"=="true" if not "%lang%"=="de" echo Please configure your %rundir%\autorun.dat file.

if "%PING_START%"=="1" if "%lang%"=="de" echo Skript erfolgreich ausgefhrt!
if "%PING_START%"=="1" if "%AUTORUN_DEFAULT%"=="true" if "%lang%"=="de" echo Bitte konfiguriere deine Skriptdatei %rundir%\autorun.dat.
set exec=-
set /p exec=

set PING_START=0
REM Start!
if "%exec%"=="1" goto start
REM install	
if "%exec%"=="2" goto install
REM Details
if "%exec%"=="3" goto set
REM Console
if "%exec%"=="4" goto Menu
REM About
if "%exec%"=="5" goto about
REM Exit
if "%exec%"=="6" goto exit
REM WeegeeBot
if "%NW%"=="0" if "%exec%"=="w" goto start_weegee
if "%NW%"=="1" if "%exec%"=="w" goto Install_Weegeebot
REM SRCDS
if "%NC%"=="0" if "%exec%"=="s" goto start_srcds
if "%NC%"=="1" if "%exec%"=="s" goto Install_SRCDS
goto ccheck
goto Menu_Alt

REM --------------------------------------------COMMANDS--------------------------------------------
REM ------------------------------------------------------------------------------------------------
:data
REM WINDOW
if "%graphmode%"=="window" if "%lang%"=="de" title Datenblatt
if "%graphmode%"=="window" if not  "%lang%"=="de" title Data sheet
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if "%lang%"=="de"     echo ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±º Datenblatt º±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
if "%graphmode%"=="window" if not "%lang%"=="de" echo ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±º Datasheet º±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
if not "%lang%"=="de" echo ([ ] = not given)
if "%lang%"=="de" echo ([ ] = nicht gegeben)
echo]
if not "%graphmode%"=="window" if "%lang%"=="de" echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹DatenblattÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
if not "%graphmode%"=="window" if not "%lang%"=="de" echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹Data heetÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo]

if "%lang%"=="de" echo Version:             %ver% (%verdate_DE%)
if not "%lang%"=="de" echo Version:               %ver% (%verdate%)
REM --
if "%lang%"=="de" echo Parameter:            %1 %2 %3 %4 %5 %6 %7 %8 %9
if not "%lang%"=="de" echo Parameters:             %1 %2 %3 %4 %5 %6 %7 %8 %9
REM --
if not "%checkdir%"==""==" " if not "%lang%"=="de" echo Server path:           %checkdir%
if not "%checkdir%"==""==" " if "%lang%"=="de" echo Serverpfad:          %checkdir%
if "%checkdir%"==""==" " iif not "%lang%"=="de" echo Server path:           [not given]
if "%checkdir%"==""==" " if "%lang%"=="de" echo Serverpfad:         [nicht gegeben]

if "%portable%"=="true" if not "%lang%"=="de" echo Portable mode:        on
if "%portable%"=="true" if "%lang%"=="de" echo Portablemodus:       an
if not "%portable%"=="true" if not "%lang%"=="de" echo Portable mode:        off
if not "%portable%"=="true" if "%lang%"=="de" echo Portablemodus:       aus
REM --
echo]
echo Weegeebot³
echo ÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="de" echo Version:             %WeegeeVer%
if not "%lang%"=="de" echo Version:               %WeegeeVer%

if not "%lang%"=="de" echo Mode:                  %weegeemode%
if "%lang%"=="de" echo Modus:               %weegeemode%
echo]
echo SRCDS³
echo ÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
REM Spiel
if not "%lang%"=="de" if defined game       ( echo Game:                  %game% )        else ( echo Game:                  [ ] )
if "%lang%"=="de"     if defined game       ( echo Spiel:               %game% )        else ( echo Spiel:               [ ] )
REM gamemode
if not "%lang%"=="de" if defined gamemode   ( echo Gamemode:              %gamemode% )    else ( echo Gamemode:              [ ] )
if "%lang%"=="de"     if defined gamemode   ( echo Spielmodus:          %gamemode% )    else ( echo Spielmodus:          [ ] )
REM -console
if not "%lang%"=="de" if defined scon       ( 
					  if "%scon%"=="true" ( echo Console mode:          on     )
					  ) else ( echo Console mode:          off )
					  )

if "%lang%"=="de"     if defined scon       ( 
					  if "%scon%"=="true" ( echo Konsolenmodus:       an       
					  ) else ( echo Konsolenmodus:       aus )
					  )
REM ip
if not "%lang%"=="de" if defined ip         ( echo IP:                    %ip% )           else ( echo IP:                    [ ] )
if "%lang%"=="de"     if defined ip         ( echo IP:                  %ip% )           else ( echo IP:                  [ ] )
REM gsl/authkey
if not "%lang%"=="de" if defined gsl        ( echo GSL token:             %gsl% )      else ( echo GSL token:             [ ] )
if "%lang%"=="de"     if defined gsl        ( echo GSL-Token:           %gsl% )      else ( echo GSL-Token:           [ ] )
REM map
if not "%lang%"=="de" if defined map        ( echo Map:                   %map% )         else ( echo Map:                   [ ] )
if "%lang%"=="de"     if defined map        ( echo Karte:               %map% )         else ( echo Karte:               [ ] )
REM maxplayers
if not "%lang%"=="de" if defined maxplayers ( echo Maximal players:       %maxplayers% )   else ( echo Maximal players:       [ ] )
if "%lang%"=="de"     if defined maxplayers ( echo Spielerh”chstgrenze: %maxplayers% )   else ( echo Spielerh”chstgrenze: [ ] )
REM workshop
if not "%lang%"=="de" if defined workshop   (echo Workshop ID:            %workshop%)      else ( echo Workshop ID:           [ ] )
if "%lang%"=="de"     if defined workshop   (echo Workshop-ID:          %workshop%)      else ( echo Workshop-ID:         [ ] )
if not "%graphmode%"=="window" echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
if "%graphmode%"=="window" pause
if "%graphmode%"=="window" goto set
goto cmd

:exe
if "%lang%"=="de" echo Gib den Namen des Scripts ein.
if "%lang%"=="de" echo Folgende Scripts sind vorhanden:

if not "%lang%"=="de" echo Enter the name of the script.
if not "%lang%"=="de" echo Following scripts are available:
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo]
dir /b /d %rundir%\import\script
echo]
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="de" echo [Gib '.' ein zum Abbrechen]
if not "%lang%"=="de" echo [Enter '.' to cancel]
echo]
set /p inp=
if "%inp%"=="." goto cmd
for /f "eol=; delims=" %%i in (%rundir%\import\script\%inp%) do (
%%i
)
if "%graphmode%"=="window" goto toolz
goto cmd

:monit
if "%graphmode%"=="window" if "%lang%"=="de" title PM2-Prozessliste
if "%graphmode%"=="window" if "%lang%"=="en" title PM2 Process List
call pm2 monit
if "%graphmode%"=="window" goto toolz
goto cmd

:digit
call pkgmgr /iu:"TelnetClient"
call telnet towel.blinkenlights.nl

if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:param
if "%graphmode%"=="window" if "%lang%"=="en " title Parameter transmission
if "%graphmode%"=="window" if "%lang%"=="de " title Parameterbergabe

if "%lang%"=="en" echo Enter the parameters that shall be transmitted:
if "%lang%"=="de" echo Gebe die zu bergebenden Parameter ein:

set /p param=
cls

if "%lang%"=="en" echo Is this correct? (Parameters will be removed after unique execution) [Y/N]:
if "%lang%"=="de" echo Ist das so richtig? (Parameter werden nach einmaliger Ausfhrung wieder entfernt) [J/N]:

echo %param%
set /p inp=
if "%lang%"=="en" if "%Eig%"=="Y" goto cmd
if "%lang%"=="de" if "%Eig%"=="J" goto cmd
if "%Eig%"=="N" goto param
goto param

:reboot
echo %date% - %time%: C'Man has been rebooted by %usernam%.  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: C'Man has been rebooted by %usernam%.  >>"%rundir%\log\%usernam%_session.log"
goto Ini

:root
start %checkdir%
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

REM -----------------------------------INSTALL-----------------------------------------

:install
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" title Installation
if "%graphmode%"=="window" echo ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±º Installation º±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
echo]
if not "%graphmode%"=="window" if not "%lang%"=="de" echo What'cha wanna get?
if not "%graphmode%"=="window" if "%lang%"=="de" echo Watt wills'te dir runterholen?
echo]
if not "%lang%"=="de" echo [0] - back
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if not "%lang%"=="de" echo [1] - Install Weegeebot by default                    ³
if not "%lang%"=="de" echo [2] - Install Weegeebot with node.js only             ³
if not "%lang%"=="de" echo [3] - Install SRCDS for Garry's Mod                   ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%lang%"=="de" echo [0] - zurck
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - Installiere Weegeebot mit Standardeinstellungen  ³
if "%lang%"=="de" echo [2] - Installiere Weegeebot ausschlieálich mit node.js ³
if "%lang%"=="de" echo [3] - Installiere SRCDS fr Garry's Mod                ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]

set /p inp=
if "%graphmode%"=="window" if "%inp%"=="0" goto Menu_Alt
if not "%graphmode%"=="window" if "%inp%"=="0" goto cmd
if "%inp%"=="1" goto Install_Weegeebot
if "%inp%"=="2" set INSTALL_NODE=true
if "%inp%"=="2" goto Install_Weegeebot
if "%inp%"=="3" goto Install_SRCDS
goto cmd

:Install_Weegeebot
REM Color
if "%graphmode%"=="window" if "%wincolor%"=="default" color 1f
if "%graphmode%"=="window" if "%wincolor%"=="negative" color d0
if "%graphmode%"=="window" if "%wincolor%"=="matrix" color 2f
if "%graphmode%"=="window" if "%wincolor%"=="pony" color 5f
if "%graphmode%"=="window" if "%wincolor%"=="commie" color 0c
cd %checkdir%
if not exist %appdat%\%rundir%\import\weegeebot\ md %appdat%\%rundir%\import\weegeebot\
if not exist %appdat%\%rundir%\import\weegeebot\bot.js goto Install_Weegeebot_Download
goto Install_Weegeebot2

:Install_Weegeebot_Download
cls
if "%graphmode%"=="window" echo Setup         ³  
if "%graphmode%"=="window" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%graphmode%"=="window" title bot.js
if "%lang%"=="de" echo Die fr das Setup notwendige Datei 'bot.js' ist nicht vorhanden. 
if "%lang%"=="de" echo Lade sie herunter und extrahiere den Inhalt in folgenden Ordner:


if not "%lang%"=="de" echo The required file 'bot.js' doesn't exist.
if not "%lang%"=="de" echo Download it and extract the content it into the following folder:
echo.
echo %appdat%\CMan\apps\weegeebot
echo]
if "%lang%"=="de" echo [0] - zurck
if not "%lang%"=="de" echo [0] - back
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
if "%lang%"=="de" echo [1] - ™ffne Link
if not "%lang%"=="de" echo [1] - Open link

if "%lang%"=="de" echo [2] - ™ffne Ordner
if not "%lang%"=="de" echo [2] - Open folder

if "%lang%"=="de" echo [3] - Fertig!
if not "%lang%"=="de" echo [3] - Ready!
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set /p Eig=
if "%Eig%"=="0" if "%graphmode%"=="window" goto install
if "%Eig%"=="0" if not "%graphmode%"=="window" goto Menu
if "%Eig%"=="1" start https://downloads.sourceforge.net/project/weegeebot/weegeebot.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fweegeebot%2Ffiles%2Fweegeebot.zip%2Fdownload%3Fuse_mirror%3Dnetcologne&ts=1501492703&use_mirror=pilotfiber
if "%Eig%"=="2" start explorer "?%appdat%\%rundir%\import\weegeebot\"
if "%Eig%"=="3" goto Install_Weegeebot

goto Install_Weegeebot_Download

:Install_Weegeebot2
title Weegeebot
if "%lang%"=="de" echo Kopiere Weegeebot...
if "%lang%"=="en" echo Copy Weegeebot...
echo.

xcopy /E /Y "%appdat%\%rundir%\import\weegeebot\*" "*"
echo.
if "%lang%"=="de" echo Fertig!
if not "%lang%"=="de" echo Done!
echo.
if not "%INSTALL_NODE%"=="true" if "%lang%"=="de" echo Installiere pm2...
if not "%INSTALL_NODE%"=="true" if not "%lang%"=="de" echo Install pm2...
if not "%INSTALL_NODE%"=="true" call npm install pm2 -g
if "%lang%"=="de" echo Installiere discord.js...
if not "%lang%"=="de" echo Install discord.js...
call npm install --save discord.js
if "%lang%"=="de" echo Fertig!
if not "%lang%"=="de" echo Done!
cd %rundir%
if "%lang%"=="de" start .\LIESMICH.html
if not "%lang%"=="de" start .\README.html

:Install_Weegeebot3
if "%graphmode%"=="window" pause
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:Install_SRCDS
@echo off
cls
REM Color
if "%wincolor%"=="default" color 1f
if "%wincolor%"=="negative" color d0
if "%wincolor%"=="matrix" color 2f
if "%wincolor%"=="pony" color 5f
if "%wincolor%"=="commie" color 0c
echo Setup         ³  
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="de" title Installation
if not "%lang%"=="de" title Setup

if "%lang%"=="de" echo Bist du dir sicher, dass du in diesem Ordner einen GMod-Server einrichten willst? [J/N]
if not "%lang%"=="de" echo Are you sure to set up a GMod server in this folder? [Y/N]

cd %runpath%
cd

set /p Eig=
if "%Eig%"=="N" if "%graphmode%"=="window" goto Menu_Alt
if "%Eig%"=="N" if not "%graphmode%"=="window" goto cmd
if "%Eig%"=="Y" goto Install_SRCDS2
if "%Eig%"=="J" goto Install_SRCDS2
goto Install_SRCDS2

:Install_SRCDS2
cls
echo Setup         ³  
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="de" echo CMan l„dt nun die erforderlichen Daten fr den Server herunter. 
if "%lang%"=="de" echo Dies kann - je nach Internetverbindung - bis zu einer Stunde in Anspruch nehmen.
if "%lang%"=="de" echo.
if "%lang%"=="de" echo Siehe hierzu diese Tabelle (Downloadgr”áe: ~3,8 GB, Durchschnittswerte):
if "%lang%"=="de" echo.
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo    LTE 250   ³ 2 Minuten 3 Sekunden   ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo    LTE 100   ³ 5 Minuten 9 Sekunden   ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo    VDSL 50   ³ 10 Minuten 19 Sekunden ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo   DSL 16.000 ³ 32 Minuten 16 Sekunden ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo   DSL 6.000  ³ 1 Stunde 25 Minuten    ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo   DSL 1.000  ³ 8 Stunden 24 Minuten   ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo    Dial-Up 56k   6 Tage 9 Stunden     ³
if "%lang%"=="de" echo      (da kommen DDR-Gefhle auf!)     ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="de" echo.
if "%lang%"=="de" echo Der Download kann jederzeit beendet und wieder fortgesetzt werden.

if not "%lang%"=="de" echo C'Man will now download the necessary data for the server.
if not "%lang%"=="de" echo This may take - depending on your internet connection - up to an hour.
if not "%lang%"=="de" echo.
if not "%lang%"=="de" echo See this table (download size: ~3,8 GB, average values):
if not "%lang%"=="de" echo.
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if not "%lang%"=="de" echo    LTE 250   ³ 2 minutes 3 seconds    ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if not "%lang%"=="de" echo    LTE 100   ³ 5 minutes 9 seconds    ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if not "%lang%"=="de" echo    VDSL 50   ³ 10 minutes 19 seconds  ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if not "%lang%"=="de" echo   DSL 16.000 ³ 32 minutes 16 seconds  ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if not "%lang%"=="de" echo   DSL 6.000  ³ 1 hour 25 minutes      ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if not "%lang%"=="de" echo   DSL 1.000  ³ 8 hours 24 minutes     ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if not "%lang%"=="de" echo    Dial-Up 56k   6 days 9 hours       ³
if not "%lang%"=="de" echo (Average internet speed in Minnesota) ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if not "%lang%"=="de" echo.
if not "%lang%"=="de" echo The download process can always be intervented and continued later.
pause >nul

:Install_SRCDS3
color 0f
if not exist steamcmd\steamcmd.exe if not exist %appdat%\%rundir%\import\steamcmd.exe goto Install_SRCDS_Download
goto Install_SRCDS4

:Install_SRCDS_Download
color 1f
cls
echo Setup         ³  
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
title SteamCMD
if "%lang%"=="de" echo Die fr das Setup notwendige Datei 'steamcmd.exe' ist nicht vorhanden. 
if "%lang%"=="de" echo Lade sie herunter und verschiebe sie in folgenden Ordner:


if not "%lang%"=="de" echo The required file 'steamcmd.exe' doesn't exist.
if not "%lang%"=="de" echo Download it and move it into the following folder:
echo.
echo %appdat%\CMan\apps
echo.
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
if "%lang%"=="de" echo [1] - ™ffne Link
if not "%lang%"=="de" echo [1] - Open link

if "%lang%"=="de" echo [2] - ™ffne Ordner
if not "%lang%"=="de" echo [2] - Open folder

if "%lang%"=="de" echo [3] - Fertig!
if not "%lang%"=="de" echo [3] - Ready!
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set /p Eig=
if "%Eig%"=="1" start https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
if "%Eig%"=="2" start %appdat%\%rundir%\import\
if "%Eig%"=="3" goto Install_SRCDS3

goto Install_SRCDS_Download

:Install_SRCDS4
title SteamCMD.exe
if not exist steamcmd\steamcmd.exe if "%lang%"=="de" echo Kopiere steamcmd.exe...
if not exist steamcmd\steamcmd.exe if "%lang%"=="en" echo Copy steamcmd.exe...
if not exist steamcmd\steamcmd.exe echo %date% - %time%: Copy steamcmd.exe...  >>"%rundir%\log\%usernam%.log"
if not exist steamcmd\steamcmd.exe echo %date% - %time%: Copy steamcmd.exe...  >>"%rundir%\log\%usernam%_session.log"
echo.
if not exist steamcmd mkdir steamcmd
if not exist steamcmd\steamcmd.exe copy %appdat%\%rundir%\import\steamcmd.exe steamcmd
echo.
if "%lang%"=="de" echo Fertig!
if "%lang%"=="en" echo Done!
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%_session.log"
echo.
if "%lang%"=="de" echo Starte steamcmd.exe...
if "%lang%"=="en" echo Start steamcmd.exe...
echo %date% - %time%: Start steamcmd.exe. For further log information, see steamcmd\logs\bootstrap_log.txt. >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start steamcmd.exe. For further log information, see steamcmd\logs\bootstrap_log.txt.  >>"%rundir%\log\%usernam%_session.log"
steamcmd\steamcmd.exe +force_install_dir %checkdir% +runscript "%appdat%\%rundir%\script\srcds\install.txt"
if "%lang%"=="de" echo Fertig!
if "%lang%"=="en" echo Done!
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%_session.log"
pause

goto cmd

:langSetup
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" title Language Setup
if "%graphmode%"=="window" if "%lang%"=="de" title Sprachsetup

if "%graphmode%"=="window" if not "%lang%"=="de" echo Language Setup
if "%graphmode%"=="window" if "%lang%"=="de" echo Sprachsetup
if "%graphmode%"=="window" echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
if not "%lang%"=="de" echo There can be only one:
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if not "%lang%"=="de" echo [de] - German   ³
if not "%lang%"=="de" echo [en] - English  ³
if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%lang%"=="de" echo Es kann nur eine(n) geben:
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [de] - Deutsch  ³
if "%lang%"=="de" echo [en] - Englisch ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
set /p inp=
if "%inp%"=="de" goto langSetup_de
if "%inp%"=="en" goto langSetup_en

:langSetup_de
set lang=de
del /Q %appdat%\%rundir%\cfg\lang.cfg
echo de>>%appdat%\%rundir%\cfg\lang.cfg
if "%graphmode%"=="window" goto cset
cls
goto Menu

:langSetup_en
set lang=en
del /Q %appdat%\%rundir%\cfg\lang.cfg
echo en>>%appdat%\%rundir%\cfg\lang.cfg
if "%graphmode%"=="window" goto cset
cls
goto Menu

:log
type %rundir%\log\%usernam%_session.log
goto cmd

:readme
if not "%lang%"=="de" start README.HTML
if "%lang%"=="de" start LIESMICH.HTML
goto cmd

:start
echo %date% - %time%: %rundir%\autorun.dat is executed by %usernam%...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: %rundir%\autorun.dat is executed by %usernam%...  >>"%rundir%\log\%usernam%_session.log"
for /f "eol=; delims=" %%i in (%rundir%\autorun.dat) do (
%%i
)
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done!  >>"%rundir%\log\%usernam%_session.log"

if "%direct%"=="true" exit

set /p AUTORUN_DEFAULTCHECK=<"%rundir%\autorun.dat"
if "%AUTORUN_DEFAULTCHECK%"==";[Default]" set AUTORUN_DEFAULT=true
if not "%graphmode%"=="window" if not "%lang%"=="de" echo Script successfully executed!
if not "%graphmode%"=="window" if "%AUTORUN_DEFAULT%"=="true" if not "%lang%"=="de" echo Please configure your %rundir%\autorun.dat file.

if not "%graphmode%"=="window" if "%lang%"=="de" echo Skript erfolgreich ausgefhrt!
if not "%graphmode%"=="window" if "%AUTORUN_DEFAULT%"=="true" if "%lang%"=="de" echo Bitte konfiguriere deine Skriptdatei %rundir%\autorun.dat.
set PING_START=1
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:start_weegee
REM Handling variables for starting here
if "%weegeemode%"=="node" goto start_weegee_debug
if "%weegeemode%"=="nodemon" goto start_weegee_nodemon
if "%weegeemode%"=="pm2" goto start_weegee_pm2

goto start_weegee_pm2


:start_weegee_nodemon
cd %checkdir%
title WeegeeBot %WeegeeVer%

if not "%lang%"=="de" (
echo %date% - %time%: Start WeegeeBot [bot.js, nodemon]...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start WeegeeBot [bot.js, nodemon]...  >>"%rundir%\log\%usernam%_session.log"
@echo on
start nodemon bot.js
@echo off
echo %date% %time%: Weegeebot has been started by %usernam% [bot.js, nodemon].  >> "%rundir%\log\%usernam%.log"
echo %date% %time%: Weegeebot has been started by %usernam% [bot.js, nodemon].  >> "%rundir%\log\%usernam%_session.log"
)
if "%lang%"=="de" (
echo %date% - %time%: Start WeegeeBot [bot-de.js, nodemon]...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start WeegeeBot [bot-de.js, nodemon]...  >>"%rundir%\log\%usernam%_session.log"
@echo on
start nodemon de\bot-de.js
@echo off
echo %date% - %time%: Weegeebot has been started by %usernam% [bot-de.js, nodemon].  >> "%rundir%\log\%usernam%.log"
echo %date% - %time%: Weegeebot has been started by %usernam% [bot-de.js, nodemon].  >> "%rundir%\log\%usernam%_session.log"
)
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:start_weegee_debug
cd %checkdir%
title WeegeeBot %WeegeeVer% -debug
if not "%lang%"=="de" (
echo %date% - %time%: Start WeegeeBot [bot.js, node]...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start WeegeeBot [bot.js, node]...  >>"%rundir%\log\%usernam%_session.log"
@echo on
start node bot.js
@echo off
echo %date% - %time%: Weegeebot has been started by %usernam% [bot.js, node].  >> "%rundir%\log\%usernam%.log"
echo %date% - %time%: Weegeebot has been started by %usernam% [bot.js, node].  >> "%rundir%\log\%usernam%_session.log"
)
if "%lang%"=="de" (
echo %date% - %time%: Start WeegeeBot [bot-de.js, node]...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start WeegeeBot [bot-de.js, node]...  >>"%rundir%\log\%usernam%_session.log"
@echo on
start node de\bot-de.js
@echo off
echo %date% - %time%: Weegeebot has been started by %usernam% [bot-de.js, node].  >> "%rundir%\log\%usernam%.log"
echo %date% - %time%: Weegeebot has been started by %usernam% [bot-de.js, node].  >> "%rundir%\log\%usernam%_session.log"
)
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:start_weegee_pm2
cd %checkdir%
title WeegeeBot %WeegeeVer%

if not "%lang%"=="de" (
echo %date% - %time%: Start WeegeeBot [bot.js, pm2]...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start WeegeeBot [bot.js, pm2]...  >>"%rundir%\log\%usernam%_session.log"
@echo on
start pm2 start bot.js --name="bot-EN"
@echo off
echo %date% - %time%: Weegeebot has been started by %usernam% [bot.js, pm2].  >> "%rundir%\log\%usernam%.log"
echo %date% - %time%: Weegeebot has been started by %usernam% [bot.js, pm2].  >> "%rundir%\log\%usernam%_session.log"
)
if "%lang%"=="de" (
echo %date% - %time%: Start WeegeeBot [bot-de.js, pm2]...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Start WeegeeBot [bot-de.js, pm2]...  >>"%rundir%\log\%usernam%_session.log"
@echo on
start pm2 start de\bot-de.js --name="bot-DE"
@echo off
echo %date% - %time%: Weegeebot has been started by %usernam% [bot-de.js, pm2].  >> "%rundir%\log\%usernam%.log"
echo %date% - %time%: Weegeebot has been started by %usernam% [bot-de.js, pm2].  >> "%rundir%\log\%usernam%_session.log"
)
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

REM Restarting Weegee
:restart_weegee
start pm2 restart all
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:start_srcds
title Source Dedicated Server [SRCDS]
cd /D %runpath%
REM Preparation
if "%scon%"=="true" ( set sconR=-console
) else (
set sconR= 
)
REM Start
start srcds.exe +hostname "%host%" +ip %ip% -usercon %sconR% -maxplayers %maxplayers% -game %game% +gamemode %gamemode% +map %map% -authkey %authkey% +host_workshop_collection %workshop% %param%
if "%lang%"=="en " echo %date% %time%: SRCDS has been started by %usernam% with normal configuration.  >> "%log%"
if "%lang%"=="de " echo %date% %time%: SRCDS wurde von %usernam% unter Normalkonfiguration gestartet.  >> "%log%"
if "%direct%"=="true" exit
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:stop
title Stop...
echo %date% - %time%: Stop all components...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Stop all components...  >>"%rundir%\log\%usernam%_session.log"
if "%weegeemode%"=="pm2" start pm2 stop all
if "%weegeemode%"=="pm2" echo %date% - %time%: Weegeebot was killed by pm2.  >>"%rundir%\log\%usernam%.log"
if "%weegeemode%"=="pm2" echo %date% - %time%: Weegeebot was killed by pm2.  >>"%rundir%\log\%usernam%_session.log"
taskkill /IM srcds.exe
taskkill /IM node.exe
taskkill /IM ts3server_win64.exe
taskkill /IM steamcmd.exe
echo %date% - %time%: Done! Exit C'Man...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done! Exit C'Man...  >>"%rundir%\log\%usernam%_session.log"
exit

:stopop
title Stopop...
echo %date% - %time%: Stop all components...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Stop all components...  >>"%rundir%\log\%usernam%_session.log"
if "%weegeemode%"=="pm2" start pm2 stop all
if "%weegeemode%"=="pm2" echo %date% - %time%: Weegeebot was killed by pm2.  >>"%rundir%\log\%usernam%.log"
if "%weegeemode%"=="pm2"echo %date% - %time%: Weegeebot was killed by pm2.  >>"%rundir%\log\%usernam%_session.log"
taskkill /IM srcds.exe
taskkill /IM node.exe
taskkill /IM ts3server_win64.exe
taskkill /IM steamcmd.exe
echo %date% - %time%: Done! >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Done! >>"%rundir%\log\%usernam%_session.log"
if "%graphmode%"=="window" goto Menu_Alt
goto cmd

:stopopextended

SET /A donttouchmeimsteril=%RANDOM% * 10 / 32768 + 1
if /I %donttouchmeimsteril% EQU 1 echo Whee >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 2 echo Don't touch me I'm steril! >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 3 echo It's OVAH 9000!!!!!!!! >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 4 echo Michael Joran rulez >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 5 echo Hitler didn't do anything wrong >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 6 echo 666 ILLUMINADI COMFIAMD >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 7 (
echo ...............................................................................,~''::::::::',::::::::::::::::::::²',>> "%rundir%\TMP"
echo ...............................................................................²::::::,-~'''îîî''''~~--~'''î'''-,:²>> "%rundir%\TMP"
echo ...............................................................................'²:::::²: : : : : : : : : : : : : ²,'>> "%rundir%\TMP"
echo ...............................................................................²:::::²: : :-~~---: : : -----: ²>> "%rundir%\TMP"
echo ..............................................................................(î''~-': : : :'îø: ',: :²: :ø-: :²>> "%rundir%\TMP"
echo ...............................................................................'''~-,²: : : : : : ~---': : : :,'>> "%rundir%\TMP"
echo ...................................................................................²,: : : : : :-~~--: : ::/>> "%rundir%\TMP"
echo ..............................................................................,-''\':\: :'~""_: : : : : _,-'>> "%rundir%\TMP"
echo ........................................................................__"-';;;;;\:''-,: : : :'~---~''/²>> "%rundir%\TMP"
echo ...............................................................__"-~'';;;;;;/;;;;;;;\: :\: : :____/: :',__>> "%rundir%\TMP"
echo ..................................................."-~~~''''î;;;;;;;;;;;;;;;;;;;;;;;;;',. .''-,:²:::::::². . ²;;;;''-"__>> "%rundir%\TMP"
echo ................................................../;;;;;;;;;;;;;;;;;;;;;;;;;;;;,;;;;;;;;;\. . .''²::::::::². .,';;;;;;;;;;''-">> "%rundir%\TMP"
echo ................................................,';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;²;;;;;;;;;;;\. . .\:::::,'. ./²;;;;;;;;;;;;;²>> "%rundir%\TMP"
echo .............................................,-'';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\;;;;;;;;;;;',: : :²îî². . .²;;;;;;;;;,';;²>> "%rundir%\TMP"
echo ..........................................."-";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;',;;;;;;;;;;;\. . ²:::². . .'',;;;;;;;;²;;/>> "%rundir%\TMP"
echo ........................................../;;;;;;;;;;;;;;;;;;;;;;;;;;²;;;;;;;;;;;;;;\;;;;;;;;;;;\. .²:::². . . ²;;;;;;;;²/>> "%rundir%\TMP"
echo ......................................../;;,-';;;;;;;;;;;;;;;;;;;;;;,';;;;;;;;;;;;;;;;;,;;;;;;;;;;². .\:/. . . .²;;;;;;;;²>> "%rundir%\TMP"
echo ......................................./;;;;;;;;;;;;;;;;;;;;;;;;;;,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;'',: ²;². . . . \;;;;;;;²>> "%rundir%\TMP"
echo ...................................."~'';;;;;;;;;;;;;;;;;;;;;,-'';;;;;;;;;;;;;;;;;;;;;;;;;;\;;;;;;;;².²;². . . . .²;;;;;;;²>> "%rundir%\TMP"
echo ................................"~'';;;;;;;;;;;;;;;;;;;;;;,-';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;',;;;;;;² ²:². . . . ²\;;;;;;;²>> "%rundir%\TMP"
echo ...............................,';;;;;;;;;;;;;;;;;;;;;;;;/;;;,-';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,;;;;;² ²:². . . .'²;;',;;;;;²>> "%rundir%\TMP"
echo ..............................²;,-';;;;;;;;;;;;;;;;;;;,-';;;,-';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,;;;;² ²:². . .,';;;;;',;;;;²_>> "%rundir%\TMP"
echo ............................../;;;;;;;;;;;;;;;;;,-'_;;;;;;,';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;²;;;;².²:². . .²;;;;;;;²;;;;²''''~-">> "%rundir%\TMP"
echo ............................/;;;;;;;;;;;;;;;;;;/î'',;;;,';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,;;² ²:². . ./;;;;;;;;²;;;²;;;;;;²-""__>> "%rundir%\TMP"
echo ........................../;;;;;;;;;;;;;;;;;,-'...²;;,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;² ²:²._,-';;;;;;;;;²;;;;²;;;;;;;;;;;'''-"_>> "%rundir%\TMP"
echo ......................../;;;;;;;;;;;;;;;;,-'....,';;,;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;².²:²::::'''~--~'''²²;;;;;²;;;;;;;;;;,-~''''~--"______>> "%rundir%\TMP"
echo ......................,';;;;;;;;;;;;;;;;,'....../;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;².²:²::::::::::::::²;;;;;',;;;;;;;;;''-,: : : : : :'''~-,:'''~~--">> "%rundir%\TMP"
echo ...................../;;;;;;;;;;;;;;;,-'......,';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;²:²:²::::::::::::::',;;;;;;²î''''~--""-~---""___"-~~'''__''~-\>> "%rundir%\TMP"
echo ..................,-';;;;;;;;;;;;;;;,'......../ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;²:²:²:::::::::::::::²;;;;;>> "%rundir%\TMP"
echo MD............./;;;;;;;;;;;;;;;;/.......,-;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;²:²:²:::::::::::::::²;;;>> "%rundir%\TMP"
)
if /I %donttouchmeimsteril% EQU 8 echo Mission failed, we're gotta do it next time. >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 9 echo https://www.youtube.com/watch?v=LkzIMTbqrjM >> "%rundir%\TMP"
if /I %donttouchmeimsteril% EQU 10 echo MissingNo. was hier >> "%rundir%\TMP"
goto stopopextended
REM ---------------------------------------------------------------------------------------------------
REM ----------------------------------------  SETTINGS  -----------------------------------------------
REM ---------------------------------------------------------------------------------------------------

:set
cls
if "%lang%"=="de" title Details
if "%lang%"=="en" title Details
echo ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±º Details º±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
echo]
REM 0
if "%lang%"=="de" echo [0] - zurck                 
if "%lang%"=="en" echo [0] - back                     
REM -
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - C'Man-Einstellungen    ³
if "%lang%"=="de" echo [2] - Servereinstellungen    ³
if "%lang%"=="de" echo [3] - Werkzeuge              ³
REM if "%lang%"=="de" echo [7] - Reset                  ³
if "%lang%"=="de" echo [4] - Weegeebot              ³
if "%lang%"=="de" echo [5] - SRCDS                  ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="en" echo [1] - C'Man settings           ³
if "%lang%"=="en" echo [2] - Server settings          ³
if "%lang%"=="en" echo [3] - Tools                    ³
REM if "%lang%"=="en" echo [7] - Reset                    ³
if "%lang%"=="en" echo [4] - Weegeebot                ³
if "%lang%"=="en" echo [5] - SRCDS                    ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ



set /p Eig=
if "%Eig%"=="0" goto Menu_Alt
if "%Eig%"=="1" goto cset
if "%Eig%"=="2" goto sset
if "%Eig%"=="3" goto toolz
REM if "%Eig%"=="3" goto Men_Var
REM if "%Eig%"=="3" goto Cpath
if "%Eig%"=="4" goto weegeeset
if "%Eig%"=="5" goto srcdsset


goto set

REM =========================== SET 1 ==========================
:cset
REM from: set
REM Color
if "%wincolor%"=="default" color 1f
if "%wincolor%"=="negative" color d0
if "%wincolor%"=="matrix" color 2f
if "%wincolor%"=="pony" color 5f
if "%wincolor%"=="commie" color 0c
REM Men
if "%lang%"=="de" title C'Man-Einstellungen
if "%lang%"=="en" title C'Man Settings
cls
if "%lang%"=="de" echo C'Man-Einstellungen
if "%lang%"=="en" echo C'Man Settings
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
REM 0
if "%lang%"=="de" echo [0] - zurck                 
if "%lang%"=="en" echo [0] - back    
REM -
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - Sprache                                 ³
if "%lang%"=="de" echo [2] - Farbe                                   ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="en" echo [1] - Language                                     ³
if "%lang%"=="en" echo [2] - Color                                        ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set exec=-
set /p exec=
if "%exec%"=="0" goto set
if "%exec%"=="1" goto langSetup
if "%exec%"=="2" goto color
goto cset

:color
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" title Color
if "%graphmode%"=="window" if "%lang%"=="de" title Farbe
if "%graphmode%"=="window" if not "%lang%"=="de" echo Color
if "%graphmode%"=="window" if "%lang%"=="de" echo Farbe
if "%graphmode%"=="window" echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
if not "%graphmode%"=="window" if not "%lang%"=="de" echo Be colormatic:
if not "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄª
if "%color%"=="default" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [1] - Classic   ³  ³
if not "%color%"=="default" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [1] - Classic   ³   ³
if "%color%"=="snowwhite" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [2] - Snow White³   ³
if not "%color%"=="snowwhite" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [2] - Snow White³  ³
if "%color%"=="matrix" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [3] - Matrix    ³  ³
if not "%color%"=="matrix" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [3] - Matrix    ³   ³
if "%color%"=="santa" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [4] - Santa     ³  ³
if not "%color%"=="santa" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [4] - Santa     ³   ³
if "%color%"=="skyward" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [5] - Skyward   ³  ³
if not "%color%"=="skyward" if not "%graphmode%"=="window" if not "%lang%"=="de" echo [5] - Skyward   ³   ³
if not "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

if not "%graphmode%"=="window" if "%lang%"=="de" echo Sei farbenfroh:
if not "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
if "%color%"=="default" if not "%graphmode%"=="window" if "%lang%"=="de" echo [1] - Klassisch       ³  ³
if not "%color%"=="default" if not "%graphmode%"=="window" if "%lang%"=="de" echo [1] - Klassisch       ³   ³
if "%color%"=="snowwhite" if not "%graphmode%"=="window" if "%lang%"=="de" echo [2] - Schneewittchen  ³  ³
if not "%color%"=="snowwhite" if not "%graphmode%"=="window" if "%lang%"=="de" echo [2] - Schneewittchen  ³   ³
if "%color%"=="matrix" if not "%graphmode%"=="window" if "%lang%"=="de" echo [3] - Matrix          ³  ³
if not "%color%"=="matrix" if not "%graphmode%"=="window" if "%lang%"=="de" echo [3] - Matrix          ³   ³
if "%color%"=="santa" if not "%graphmode%"=="window" if "%lang%"=="de" echo [4] - Weihnachten     ³  ³
if not "%color%"=="santa" if not "%graphmode%"=="window" if "%lang%"=="de" echo [4] - Weihnachten     ³   ³
if "%color%"=="skyward" if not "%graphmode%"=="window" if "%lang%"=="de" echo [5] - Himmelw„rts     ³  ³
if not "%color%"=="skyward" if not "%graphmode%"=="window" if "%lang%"=="de" echo [5] - Himmelw„rts     ³   ³
if not "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

REM EN-Window
if "%graphmode%"=="window" if not "%lang%"=="de" echo Be colormatic:
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
REM EN-unchecked
if not "%wincolor%"=="default"      if "%graphmode%"=="window" if not "%lang%"=="de" echo [1] - Default               ³   ³
if "%wincolor%"=="default"          if "%graphmode%"=="window" if not "%lang%"=="de" echo [1] - Default               ³  ³
if not "%wincolor%"=="negative"     if "%graphmode%"=="window" if not "%lang%"=="de" echo [2] - Negative              ³   ³
if "%wincolor%"=="negative"         if "%graphmode%"=="window" if not "%lang%"=="de" echo [2] - Negative              ³  ³
if not "%wincolor%"=="matrix"       if "%graphmode%"=="window" if not "%lang%"=="de" echo [3] - Matrix                ³   ³
if "%wincolor%"=="matrix"           if "%graphmode%"=="window" if not "%lang%"=="de" echo [3] - Matrix                ³  ³
if not "%wincolor%"=="pony"         if "%graphmode%"=="window" if not "%lang%"=="de" echo [4] - Pony                  ³   ³
if "%wincolor%"=="pony"             if "%graphmode%"=="window" if not "%lang%"=="de" echo [4] - Pony                  ³  ³
if not "%wincolor%"=="commie"       if "%graphmode%"=="window" if not "%lang%"=="de" echo [5] - Stalin's Payback      ³   ³
if "%wincolor%"=="commie"           if "%graphmode%"=="window" if not "%lang%"=="de" echo [5] - Stalin's Payback      ³  ³

if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

REM DE-Window
if "%graphmode%"=="window" if "%lang%"=="de" echo Sei farbenfroh:
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
REM DE-unchecked
if not "%wincolor%"=="default"      if "%graphmode%"=="window" if "%lang%"=="de" echo [1] - Standard        ³   ³
if "%wincolor%"=="default"          if "%graphmode%"=="window" if "%lang%"=="de" echo [1] - Standard        ³  ³
if not "%wincolor%"=="negative"     if "%graphmode%"=="window" if "%lang%"=="de" echo [2] - Verdreht        ³   ³
if "%wincolor%"=="negative"         if "%graphmode%"=="window" if "%lang%"=="de" echo [2] - Verdreht        ³  ³
if not "%wincolor%"=="matrix"       if "%graphmode%"=="window" if "%lang%"=="de" echo [3] - Matrix          ³   ³
if "%wincolor%"=="matrix"           if "%graphmode%"=="window" if "%lang%"=="de" echo [3] - Matrix          ³  ³
if not "%wincolor%"=="pony"         if "%graphmode%"=="window" if "%lang%"=="de" echo [4] - Pony            ³   ³
if "%wincolor%"=="pony"             if "%graphmode%"=="window" if "%lang%"=="de" echo [4] - Pony            ³  ³
if not "%wincolor%"=="commie"       if "%graphmode%"=="window" if "%lang%"=="de" echo [5] - Honeckers Rache ³   ³
if "%wincolor%"=="commie"           if "%graphmode%"=="window" if "%lang%"=="de" echo [5] - Honeckers Rache ³  ³

if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

set /p inp=

REM Console
if not "%graphmode%"=="window" if "%inp%"=="1" echo default>%rundir%\cfg\color.cfg
if not "%graphmode%"=="window" if "%inp%"=="2" echo snowwhite>%rundir%\cfg\color.cfg
if not "%graphmode%"=="window" if "%inp%"=="3" echo matrix>%rundir%\cfg\color.cfg
if not "%graphmode%"=="window" if "%inp%"=="4" echo santa>%rundir%\cfg\color.cfg
if not "%graphmode%"=="window" if "%inp%"=="5" echo skyward>%rundir%\cfg\color.cfg

REM Window
if "%graphmode%"=="window" if "%inp%"=="1" echo default>%rundir%\cfg\wincolor.cfg
if "%graphmode%"=="window" if "%inp%"=="2" echo negative>%rundir%\cfg\wincolor.cfg
if "%graphmode%"=="window" if "%inp%"=="3" echo matrix>%rundir%\cfg\wincolor.cfg
if "%graphmode%"=="window" if "%inp%"=="4" echo pony>%rundir%\cfg\wincolor.cfg
if "%graphmode%"=="window" if "%inp%"=="5" echo commie>%rundir%\cfg\wincolor.cfg

if not "%graphmode%"=="window" set /p color=<%rundir%\cfg\color.cfg
if "%graphmode%"=="window" set /p wincolor=<%rundir%\cfg\wincolor.cfg
if "%graphmode%"=="window" goto cset
cls
goto Menu

REM =============================== SET 2 ==================================
:sset
REM Men
if "%lang%"=="de" title Servereinstellungen
if "%lang%"=="en" title Server settings
cls
if "%lang%"=="de" echo Servereinstellungen
if "%lang%"=="en" echo Server settings
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
REM 0
if "%lang%"=="de" echo [0] - zurck                 
if "%lang%"=="en" echo [0] - back    
REM -
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - ndere Serverpfad                       ³
if "%lang%"=="de" echo [2] - Portablemodus                           ³
if "%lang%"=="de" echo [3] - Neueinrichtung                          ³
if "%lang%"=="de" echo [4] - ndere Betriebsvariable                 ³
if "%lang%"=="de" echo [5] - Reset                                   ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="en" echo [1] - Change server path                           ³
if "%lang%"=="en" echo [2] - Portable mode                                ³
if "%lang%"=="en" echo [3] - New establishment                            ³
if "%lang%"=="en" echo [4] - Change operating variable                    ³
if "%lang%"=="en" echo [5] - Reset                                        ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set exec=-
set /p exec=
if "%exec%"=="0" goto set
if "%exec%"=="1" goto path
if "%exec%"=="2" goto port
if "%exec%"=="3" goto resetS
goto sset
pause
:resetS
cls
if "%lang%"=="en " title Server Configuration Reset
if "%lang%"=="de " title Serverkonfigurationsreset

if "%lang%"=="en " echo Server Configuration Reset
if "%lang%"=="de " echo Serverkonfigurationsreset

if "%lang%"=="en " echo ATTENTION: Thus, the server configuration will be erased! Are you sure?[Y/N]
if "%lang%"=="de " echo WARNUNG: Dadurch wird die Serverkonfiguration entfernt! Bist du dir sicher? [J/N]

set /p Eig=

if "%lang%"=="en " if not "%Eig%"=="Y" goto Men
if "%lang%"=="de " if not "%Eig%"=="J" goto Men

cd 
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
@echo on
cd /D %pathe%
attrib -R "CMan"
del /q /s /f "CMan"
rmdir /q /s "CMan\"
@echo off
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo CMan will now be closed. Restart it to re-setup the configuration.
if "%lang%"=="de" echo CMan schlieát sich nun. Starte es erneut, um die Konfiguration wiederaufzusetzen.
pause >nul
exit


:path
REM                 WINDOW
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" echo Server path   ³  
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%graphmode%"=="window" if "%lang%"=="de" echo Serverpfad    ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

REM                 INPUT
if not "%lang%"=="de" echo Enter the new path [C'Man will be restarted after that!]:
if "%lang%"=="de" echo Gib den neuen Pfad ein [C'Man wird danach neugestartet!]:
set /p inp=

REM                 WINDOW
if "%graphmode%"=="window" if not "%lang%"=="de" Server path
if "%graphmode%"=="window" if "%lang%"=="de" Serverpfad
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" echo Server path   ³  
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%graphmode%"=="window" if "%lang%"=="de" echo Serverpfad    ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

REM                 INPUT
if not "%lang%"=="de" echo Is this correct? [Y/N]
if not "%lang%"=="de" echo (You may leave with '0'):
if "%lang%"=="de" echo Ist das richtig? [J/N]
if "%lang%"=="de" echo (Du kannst mit '0' abbrechen):
if not "%graphmode%"=="window" echo]
if "%graphmode%"=="window" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo %inp%
set /p Eig=
if not "%graphmode%"=="window" if "%Eig%"=="0" goto cmd
if "%graphmode%"=="window" if "%Eig%"=="0" goto sset
if "%Eig%"=="N" goto path

REM                 WINDOW
if "%graphmode%"=="window" if not "%lang%"=="de" title Server path
if "%graphmode%"=="window" if "%lang%"=="de" title Serverpfad
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" echo Server path   ³  
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%graphmode%"=="window" if "%lang%"=="de" echo Serverpfad    ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

REM                 INPUT
if not "%lang%"=="de" echo Should the old content be copied to the new path? [Y/N]
if "%lang%"=="de" echo Soll der alte Inhalt zum neuen Pfad kopiert werden? [J/N]

set /p Eig=
if not "%graphmode%"=="window" if "%Eig%"=="0" goto cmd
if "%graphmode%"=="window" if "%Eig%"=="0" goto sset
if "%Eig%"=="Y" set COPY=true
if "%Eig%"=="J" set COPY=true
if "%Eig%"=="N" set COPY=false

:path2
if "%graphmode%"=="window" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
REM if copy
if "%COPY%"=="true" md "%inp%"
if "%COPY%"=="true" xcopy /E "%checkdir%" "%inp%"
REM Aftercopy
echo %inp%>>%rundir%\TMP
set /p checkdir=<"%rundir%\TMP"
del /q "%rundir%\TMP"
if exist "%appdat%\%rundir%\cfg\dir.cfg" del /q "%appdat%\%rundir%\cfg\dir.cfg"
echo %checkdir%>>"%appdat%\%rundir%\cfg\dir.cfg"
echo false>"%rundir%\cfg\port.cfg"
echo %date% - %time%: Server path has been changed by %usernam% to %checkdir%...  >>"%rundir%\log\%usernam%.log"
echo %date% - %time%: Server path has been changed by %usernam% to %checkdir%...  >>"%rundir%\log\%usernam%_session.log"
if "%debug%"=="true" pause
goto Ini

:port
REM                 WINDOW
if "%graphmode%"=="window" if not "%lang%"=="de" title Portable mode
if "%graphmode%"=="window" if "%lang%"=="de" title Portablemodus
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" echo Portable mode ³  
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%graphmode%"=="window" if "%lang%"=="de" echo Portablemodus ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

REM                 CONSOLE
if not "%portable%"=="true" if not "%lang%"=="de" echo Do you want to activate the portable mode (requires reboot!)? [Y/N]
if not "%portable%"=="true" if "%lang%"=="de" echo M”chstest du den Portablemodus aktivieren (erfordert Neustart!)? [J/N]
if "%portable%"=="true" if not "%lang%"=="de" echo Do you want to deactivate the portable mode (requires reboot!)? [Y/N]
if "%portable%"=="true" if "%lang%"=="de" echo M”chstest du den Portablemodus deaktivieren (erfordert Neustart)? [J/N]

if not "%portable%"=="true" if not "%lang%"=="de" echo Regard that C'Man needs to be in the same folder as the server if in portable mode.
if not "%portable%"=="true" if "%lang%"=="de" echo Beachte, dass C'Man im Portablemodus im selben Ordner wie der Server sein muss.

if not "%portable%"=="true" if not "%lang%"=="de" echo You may return by entering '0'.
if not "%portable%"=="true" if "%lang%"=="de" echo Du kannst mit der Taste '0' abbrechen.
REM                 INPUT
set /p inp=

if not "%portable%"=="true" if "%inp%"=="J" echo true>"%rundir%\cfg\port.cfg"
if not "%portable%"=="true" if "%inp%"=="Y" echo true>"%rundir%\cfg\port.cfg"
if not "%portable%"=="true" if "%inp%"=="N" echo false>"%rundir%\cfg\port.cfg"

if "%portable%"=="true" if "%inp%"=="J" echo false>"%rundir%\cfg\port.cfg"
if "%portable%"=="true" if "%inp%"=="Y" echo false>"%rundir%\cfg\port.cfg"
if "%portable%"=="true" if "%inp%"=="N" echo true>"%rundir%\cfg\port.cfg"

if "%debug%"=="true" pause
goto Ini

REM ========================================== SET 3 ============================================
:toolz
cls
if "%lang%"=="de" title Werkzeuge
if not "%lang%"=="de" title Tools

if "%lang%"=="de" echo ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±º Werkzeuge º±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
if not "%lang%"=="de" echo ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±º Tools º±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
echo]
REM 0
if "%lang%"=="de" echo [0] - zurck                 
if "%lang%"=="en" echo [0] - back    
REM -
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - Datenblatt                              ³
if "%lang%"=="de" echo [2] - Stoppe alle Prozesse                    ³
if "%weegeemode%"=="pm2" if "%lang%"=="de" echo [3] - šberwache alle PM2-Prozesse             ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="en" echo [1] - Data sheet                                   ³
if "%lang%"=="en" echo [2] - Stop all processes                           ³
if "%weegeemode%"=="pm2" if "%lang%"=="en" echo [3] - Monit all processes                          ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set inp=_
set /p inp=

if "%inp%"=="0" goto set
if "%inp%"=="1" goto data
if "%inp%"=="2" goto stopop
if "%weegeemode%"=="pm2" if "%inp%"=="3" goto monit
goto toolz
REM ========================================== SET 4 ============================================
:weegeeset
REM Men
if "%lang%"=="de" title Weegeebot-Einstellungen
if "%lang%"=="en" title Weegeebot Settings
cls
if "%lang%"=="de" echo Weegeebot-Einstellungen
if "%lang%"=="en" echo Weegeebot Settings
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
REM 0
if "%lang%"=="de" echo [0] - zurck                 
if "%lang%"=="en" echo [0] - back    
REM -
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - Installiere Weegeebot                   ³
if "%lang%"=="de" echo [2] - Startmodus                              ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="en" echo [1] - Install Weegeebot                            ³
if "%lang%"=="en" echo [2] - Start mode                                   ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set inp=_
set /p inp=

if "%inp%"=="0" goto set
if "%inp%"=="1" goto Install_Weegeebot
if "%inp%"=="2" goto weegeemode
goto weegeeset

:weegeemode
REM                 WINDOW
if "%graphmode%"=="window" if not "%lang%"=="de" title Weegeebot mode
if "%graphmode%"=="window" if "%lang%"=="de" title Weegeebotmodus
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if "%lang%"=="de" echo Weegeebotmodus ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%graphmode%"=="window" if not "%lang%"=="de" echo Weegeebot mode ³  
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


REM                 CONSOLE

if not "%lang%"=="de" echo Choose the mode Weegeebot shall be started:
if "%lang%"=="de" echo W„hle den Modus aus, in welchem Weegeebot gestartet werden soll:
echo]

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
REM EN
if not "%weegeemode%"=="pm2"      if "%lang%"=="en" echo [1] - PM2 (default)   ³   ³
if "%weegeemode%"=="pm2"          if "%lang%"=="en" echo [1] - PM2 (default)   ³  ³
if not "%weegeemode%"=="node"     if "%lang%"=="en" echo [2] - node (failsafe) ³   ³
if "%weegeemode%"=="node"         if "%lang%"=="en" echo [2] - node (failsafe) ³  ³
if not "%weegeemode%"=="nodemon"  if "%lang%"=="en" echo [3] - nodemon         ³   ³
if "%weegeemode%"=="nodemon"      if "%lang%"=="en" echo [3] - nodemon         ³  ³

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

REM DE
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
REM EN
if not "%weegeemode%"=="pm2"      if "%lang%"=="de" echo [1] - PM2 (Standard)  ³   ³
if "%weegeemode%"=="pm2"          if "%lang%"=="de" echo [1] - PM2 (Standard)  ³  ³
if not "%weegeemode%"=="node"     if "%lang%"=="de" echo [2] - node (sicher)   ³   ³
if "%weegeemode%"=="node"         if "%lang%"=="de" echo [2] - node (sicher)   ³  ³
if not "%weegeemode%"=="nodemon"  if "%lang%"=="de" echo [3] - nodemon         ³   ³
if "%weegeemode%"=="nodemon"      if "%lang%"=="de" echo [3] - nodemon         ³  ³

if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

set /p inp=
if exist "%rundir%\cfg\weegeebot\mode.cfg" del /q "%rundir%\cfg\weegeebot\mode.cfg"
if "%inp%"=="1" echo pm2>"%rundir%\cfg\weegeebot\mode.cfg"
if "%inp%"=="1" set weegeemode=pm2
if "%inp%"=="2" echo node>"%rundir%\cfg\weegeebot\mode.cfg"
if "%inp%"=="2" set weegeemode=node
if "%inp%"=="3" echo nodemon>"%rundir%\cfg\weegeebot\mode.cfg"
if "%inp%"=="3" set weegeemode=nodemon

if "%inp%"=="1" if "%graphmode%"=="window" goto weegeeset
if "%inp%"=="2" if "%graphmode%"=="window" goto weegeeset
if "%inp%"=="3" if "%graphmode%"=="window" goto weegeeset
if "%inp%"=="1" if not "%graphmode%"=="window" goto cmd
if "%inp%"=="2" if not "%graphmode%"=="window" goto cmd
if "%inp%"=="3" if not "%graphmode%"=="window" goto cmd
goto weegeemode

REM ========================================== SET 5 ============================================
:srcdsset
REM Men
if "%lang%"=="de" title SRCDS-Einstellungen
if "%lang%"=="en" title SRCDS Settings
cls
if "%lang%"=="de" echo SRCDS-Einstellungen
if "%lang%"=="en" echo SRCDS Settings
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
REM 0
if "%lang%"=="de" echo [0] - zurck                 
if "%lang%"=="en" echo [0] - back    
REM -
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo [1] - ndere Betriebsvariable                 ³
if "%lang%"=="de" echo [2] - Installiere SRCDS fr Garry's Mod       ³
if "%lang%"=="de" echo [3] - Richte SRCDS fr Garry's Mod ein        ³
if "%lang%"=="de" echo [4] - Update SRCDS fr Garry's Mod            ³
if "%lang%"=="de" echo [5] - Verwerte GMod-AddOn                     ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="en" echo [1] - Change operating variable                    ³
if "%lang%"=="en" echo [2] - Install SRCDS for Garry's Mod                ³
if "%lang%"=="en" echo [3] - Configure SRCDS for Garry's Mod              ³
if "%lang%"=="en" echo [4] - Update SRCDS for Garry's Mod                 ³
if "%lang%"=="en" echo [5] - Utilize Add-on                               ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set inp=_
set /p inp=

if "%inp%"=="0" goto set
if "%inp%"=="1" goto Var_SRCDS
if "%inp%"=="2" goto Install_SRCDS
if "%inp%"=="3" goto Setup_SRCDS
if "%inp%"=="4" goto Update_SRCDS
if "%inp%"=="5" goto Addon_SRCDS
goto srcdsset

:Var_SRCDS
cls
if "%lang%"=="en" title Operating variables
if "%lang%"=="de" title Betriebsvariablen

if "%lang%"=="en" echo Operating variables
if "%lang%"=="de" echo Betriebsvariablen
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
if "%lang%"=="en" echo [0] - back
if "%lang%"=="de" echo [0] - zurck
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿

if "%lang%"=="en" echo [1] - Host name     ³
if "%lang%"=="de" echo [1] - Hostname      ³

if "%lang%"=="en" echo [2] - GSL token     ³
if "%lang%"=="de" echo [2] - GSL-Token     ³

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

if "%lang%"=="en" echo [3] - Console mode  ³
if "%lang%"=="de" echo [3] - Konsolenmodus ³

if "%lang%"=="en" echo [4] - Gamemode      ³
if "%lang%"=="de" echo [4] - Spielmodus    ³

if "%lang%"=="en" echo [5] - IP            ³
if "%lang%"=="de" echo [5] - IP            ³

if "%lang%"=="en" echo [6] - Map           ³
if "%lang%"=="de" echo [6] - Karte         ³       

if "%lang%"=="en" echo [7] - Max. players  ³
if "%lang%"=="de" echo [7] - Max. Spieler  ³

if "%lang%"=="en" echo [8] - Workshop      ³
if "%lang%"=="de" echo [8] - Workshop      ³

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

set inp=_
set /p inp=

if "%inp%"=="0" goto srcdsset

if "%inp%"=="1" goto Var_SRCDS_svname

if "%inp%"=="2" goto Var_SRCDS_gsl
if "%inp%"=="3" goto Var_SRCDS_scon
if "%inp%"=="4" goto Var_SRCDS_gamemode
if "%inp%"=="5" goto Var_SRCDS_ip
if "%inp%"=="6" goto Var_SRCDS_map
if "%inp%"=="7" goto Var_SRCDS_maxplayers
if "%inp%"=="8" goto Var_SRCDS_workshop
goto Var_SRCDS

REM ================================== Var_SRCDS ===================================
:Var_SRCDS_svname
cls
if "%lang%"=="en" title Host name
if "%lang%"=="de" title Hostname

if "%lang%"=="en" echo Host Name ³
if "%lang%"=="de" echo Hostname  ³
echo ÄÄÄÄÄÄÄÄÄÄÙ
if defined host if "%lang%"=="en" echo Current host name:
if defined host if "%lang%"=="de" echo Derzeitiger Servername: 
if defined host echo %host%
if defined host echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new server name:
if "%lang%"=="de" echo Gib den neuen Servernamen ein:
set /p host=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %host%>"%rundir%\cfg\garrysmod\host.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS


:Var_SRCDS_gsl
cls
if "%lang%"=="en" title GSL Token
if "%lang%"=="de" title GSL-Token

if "%lang%"=="en" echo Game Server Login Token ³
if "%lang%"=="de" echo Game Server Login-Token ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if defined gsl if "%lang%"=="en" echo Current GSL token:
if defined gsl if "%lang%"=="de" echo Derzeitiger GSL-Token: 
if defined gsl echo %gsl%
if defined gsl echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new Game Server Login token:
if "%lang%"=="de" echo Gib den neuen GSL-Token ein:

set /p gsl=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %gsl%>"%rundir%\cfg\garrysmod\gsl.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS

:Var_SRCDS_scon
cls
if "%lang%"=="en" title Console mode
if "%lang%"=="de" title Konsolenmodus

if "%lang%"=="en" echo Console mode  ³
if "%lang%"=="de" echo Konsolenmodus ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
if "%lang%"=="en" echo Set console mode:
if "%lang%"=="de" echo Setze Konsolenmodus:

if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
if "%scon%"=="true"     if "%lang%"=="en" echo [1] - On ³  ³
if not "%scon%"=="true" if "%lang%"=="en" echo [1] - On ³   ³

if "%scon%"=="true"     if "%lang%"=="en" echo [2] - Off³   ³
if not "%scon%"=="true" if "%lang%"=="en" echo [2] - Off³  ³
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÂÄÄÄ¿
if "%scon%"=="true"     if "%lang%"=="de" echo [1] - An ³  ³
if not "%scon%"=="true" if "%lang%"=="de" echo [1] - An ³   ³

if "%scon%"=="true"     if "%lang%"=="de" echo [2] - Aus³   ³
if not "%scon%"=="true"  if "%lang%"=="de" echo [2] - Aus³  ³
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÁÄÄÄÙ

set inp=_
set /p inp=

if "%debug%"=="true" @echo on
if "%inp%"=="1" set scon=true
if "%inp%"=="2" set scon=false

echo %scon%>"%runpath%\%rundir%\cfg\garrysmod\console.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause >nul
goto Var_SRCDS

:Var_SRCDS_gamemode
cls
if "%lang%"=="en" title Gamemode
if "%lang%"=="de" title Spielmodus

if "%lang%"=="en" echo Gamemode   ³
if "%lang%"=="de" echo Spielmodus ³
echo ÄÄÄÄÄÄÄÄÄÄÄÙ
if defined gamemode if "%lang%"=="en" echo Current game mode:
if defined gamemode if "%lang%"=="de" echo Derzeitiger Spielmodus: 
if defined gamemode echo %gamemode%
if defined gamemode echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new game mode:
if "%lang%"=="de" echo Gib den neuen Spielmodus ein:

set /p gamemode=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %gamemode%>"%rundir%\cfg\garrysmod\gamemode.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS


:Var_SRCDS_ip
cls
if "%lang%"=="en" title IP
if "%lang%"=="de" title IP

if "%lang%"=="en" echo IP ³
if "%lang%"=="de" echo IP ³
echo ÄÄÄÙ

if defined ip if "%lang%"=="en" echo Current IP: %ip%
if defined ip if "%lang%"=="de" echo Derzeitige IP: %ip%
if defined ip echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new IP:
if "%lang%"=="de" echo Gib die neue IP ein:

set /p ip=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %ip%>"%rundir%\cfg\garrysmod\ip.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS

:Var_SRCDS_map
cls
if "%lang%"=="en" title Map
if "%lang%"=="de" title Karte

if "%lang%"=="en" echo Map   ³
if "%lang%"=="de" echo Karte ³
echo ÄÄÄÄÄÄÙ

if defined map if "%lang%"=="en" echo Current map: %map%
if defined map if "%lang%"=="de" echo Derzeitige Karte: %map%
if defined map echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new map:
if "%lang%"=="de" echo Gib die neue Karte ein:

set /p map=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %map%>"%rundir%\cfg\garrysmod\map.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS

:Var_SRCDS_maxplayers
cls
if "%lang%"=="en" title Maximum players
if "%lang%"=="de" title Spielerh”chstzahl

if "%lang%"=="en" echo Maximum players   ³
if "%lang%"=="de" echo Spielerh”chstzahl ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if defined maxplayers if "%lang%"=="en" echo Current value: %maxplayers%
if defined maxplayers if "%lang%"=="de" echo Derzeitiger Wert: %maxplayers%
if defined maxplayers echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new value:
if "%lang%"=="de" echo Gib den neuen Wert ein:

set /p maxplayers=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %maxplayers%>"%rundir%\cfg\garrysmod\maxplayers.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS

:Var_SRCDS_workshop
cls
if "%lang%"=="en" title Workshop ID
if "%lang%"=="de" title Workshop-ID

if "%lang%"=="en" echo Workshop ID ³
if "%lang%"=="de" echo Workshop-ID ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÙ

if defined workshop if "%lang%"=="en" echo Current ID: %workshop%
if defined workshop if "%lang%"=="de" echo Derzeitige ID: %workshop%
if defined workshop echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo Enter the new ID:
if "%lang%"=="de" echo Gib die neue ID ein:

set /p workshop=
if "%debug%"=="true" @echo on
cd /D %runpath%
echo %workshop%>"%rundir%\cfg\garrysmod\workshop.cfg"
if "%debug%"=="true" @echo off
if "%debug%"=="true" pause
goto Var_SRCDS
REM ================================================================================

:Setup_SRCDS
REM                 WINDOW
if "%graphmode%"=="window" if not "%lang%"=="de" title Setup
if "%graphmode%"=="window" if "%lang%"=="de" title Setup
if "%graphmode%"=="window" cls
if "%graphmode%"=="window" if not "%lang%"=="de" echo Setup         ³  
if "%graphmode%"=="window" if not "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

if "%graphmode%"=="window" if "%lang%"=="de" echo Setup         ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="de" echo Gib bitte deinen GSL-Token ein.
if "%lang%"=="de" echo Dieser ist notwendig, um sich gegenber Steam zu verifizieren.

if "%lang%"=="en" echo Please enter your GSL token.
if "%lang%"=="en" echo This is necesarry to verify the server for Steam.
set /p inp=
echo %inp%>"%rundir%\cfg\garrysmod\gsl.cfg"
del /q gamemode.cfg
echo %gamemode% >> "%rundir%\cfg\garrysmod\gamemode.cfg"
del /q console.cfg
echo %scon% >> "%rundir%\cfg\garrysmod\console.cfg"
del /q map.cfg
echo %map% >> "%rundir%\cfg\garrysmod\map.cfg"
del /q game.cfg
echo %game% >> "%rundir%\cfg\garrysmod\game.cfg"
del /q maxplayers.cfg
echo %maxplayers% >> "%rundir%\cfg\garrysmod\maxplayers.cfg"
del /q ip.cfg
echo %ip% >> "%rundir%\cfg\garrysmod\ip.cfg"
cls
if "%graphmode%"=="window" if "%lang%"=="de" echo Setup         ³  
if "%graphmode%"=="window" if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="de" echo Gib deine Kollektionsnummer ein.
if "%lang%"=="de" echo L„uft dein Server als Vanillaserver (also ohne Kollektion), lass das Feld leer.

if not "%lang%"=="de" echo Enter your collection number.
if not "%lang%"=="de" echo If your server runs as a vanilla server, keep the field empty.
set /p workshop=
echo %workshop% > "%rundir%\cfg\garrysmod\workshop.cfg"
if "%debug%"=="true" pause
cls
if "%lang%"=="de" echo Erfolg - Viel Spaá mit dem neuen GMod-Server! 
if "%lang%"=="de" echo Weitere Einstellungen k”nnen gegebenenfalls sp„ter ge„ndert werden.

if not "%lang%"=="de" echo Great, Success - have a lot of fun with your new GMod server!
if not "%lang%"=="de" echo Further settings can be changed later.
echo.
pause
goto Ini

:Addon_SRCDS
cls
if "%lang%"=="en" title Add-on Menu
if "%lang%"=="de" title AddOn-Men

if "%lang%"=="en" echo Add-on Menu
if "%lang%"=="de" echo AddOn-Men
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo]
if "%lang%"=="en" echo [0] - back
if "%lang%"=="de" echo [0] - zurck
REM ---
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
REM 1
REM if "%lang%"=="en" echo [1] - Extract Add-on ³
REM if "%lang%"=="de" echo [1] - Entpacke AddOn ³
REM 1
if "%lang%"=="en" echo [1] - Upload Add-on  ³
if "%lang%"=="de" echo [1] - Lade AddOn hoch³
REM ---
if "%lang%"=="en" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%lang%"=="de" echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
REM .
set /p Eig=
if "%Eig%"=="0" goto srcdsset
REM if "%Eig%"=="1" goto ExtractAddon_SRCDS
if "%Eig%"=="1" goto UploadAddon_SRCDS
goto Addon_SRCDS

:ExtractAddon_SRCDS
cls
if "%lang%"=="en" title Extraction Setup
if "%lang%"=="de" title Entpackungssetup

if "%lang%"=="en" echo Unpacking Setup
if "%lang%"=="de" echo Entpackungssetup
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

if "%lang%"=="en" echo IMPORTANT: The GMad Extractor must be available in the apps folder!
if "%lang%"=="de" echo WICHTIG: Der GMad Extractor muss im apps-Ordner vorhanden sein!

if "%lang%"=="en" echo Work through the steps below if this is not the case.
if "%lang%"=="de" echo Arbeite die unteren Schritte ab, falls das nicht der Fall ist.
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="en" echo [0] - back
if "%lang%"=="de" echo [0] - zurck
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

if "%lang%"=="en" echo [1] - Open download link
if "%lang%"=="de" echo [1] - ™ffne Downloadlink

if "%lang%"=="en" echo [2] - Open apps folder
if "%lang%"=="de" echo [2] - ™ffne apps-Ordner

if "%lang%"=="en" echo [3] - Open apps folder
if "%lang%"=="de" echo [3] - ™ffne apps-Ordner

set /p Eig=
if "%Eig%"=="0" goto Addon_SRCDS
if "%Eig%"=="1" start http://www.moddb.com/mods/garrys-mod/downloads/gmad-easy-addon-extractor
if "%Eig%"=="2" start "%appdata%\CMan\apps\"

goto addonE
:UploadAddon_SRCDS
cls
if "%lang%"=="en" title Upload Setup
if "%lang%"=="de" title Hochladesetup

if "%lang%"=="en" echo Upload Setup  ³
if "%lang%"=="de" echo Hochladesetup ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="en" echo Enter the path of the folder where the addon data has been saved:
if "%lang%"=="de" echo Gib den Pfad des Ordners ein, in dem die AddOn-Daten gespeichert sind:
set /p fold=
cls
if "%lang%"=="en" echo Upload Setup  ³
if "%lang%"=="de" echo Hochladesetup ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="en" echo Now enter the output path of the .gma file:
if "%lang%"=="de" echo Gib nun den Ausgabepfad der .gma-Datei ein:
set /p out=
cls
if "%lang%"=="en" echo Upload Setup  ³
if "%lang%"=="de" echo Hochladesetup ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="en" echo Enter the name of the .gma file that shall be created:
if "%lang%"=="de" echo Gib den Namen der zu erstellenden .gma-Datei ein:
set /p datn=
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
%steam%\GarrysMod\bin\gmad.exe create -folder "%fold%" -out "%out%\%datn%"
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
REM Color
if "%wincolor%"=="default" color 1f
if "%wincolor%"=="negative" color d0
if "%wincolor%"=="matrix" color 2f
if "%wincolor%"=="pony" color 5f
if "%wincolor%"=="commie" color 0c
pause
cls

if "%lang%"=="en" echo Upload Setup  ³
if "%lang%"=="de" echo Hochladesetup ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="en" echo Enter the path of the folder where the icon is saved:
if "%lang%"=="de" echo Gib den Pfad des Ordners ein, in dem das Icon gespeichert ist:
set /p out2=
cls
if "%lang%"=="en" echo Upload Setup  ³
if "%lang%"=="de" echo Hochladesetup ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="en" echo Now enter the name of the icon (jpg format, 512x512!):
if "%lang%"=="de" echo Gib nun den Namen des Icons ein (jpg-Format, 512x512!):
set /p datn2=
cls

if "%lang%"=="en" echo Upload Setup  ³
if "%lang%"=="de" echo Hochladesetup ³
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo]
if "%lang%"=="en" echo The Addon will now be published! Do you want to continue? [Y/N]
if "%lang%"=="de" echo Das AddOn wird nun ver”ffentlicht! M”chtest du fortfahren? [J/N]
set /p Eig=
if "%lang%"=="en" if not "%Eig%"=="Y" goto srcdsset
if "%lang%"=="de" if not "%Eig%"=="J" goto srcdsset
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
%steam%\GarrysMod\bin\gmpublish.exe create -addon "%out%\%datn%" -icon "%out2%\%datn2%"
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
REM Color
if "%wincolor%"=="default" color 1f
if "%wincolor%"=="negative" color d0
if "%wincolor%"=="matrix" color 2f
if "%wincolor%"=="pony" color 5f
if "%wincolor%"=="commie" color 0c
pause
goto srcdsset

REM ---------------------------------------------------------------------------------------------------
REM ----------------------------------------- OTHERS --------------------------------------------------
REM ---------------------------------------------------------------------------------------------------

:about
cls
color 4e
echo C'Man Version %ver% [Ieniça]                                                                           

echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ                                                                   °°°°°°°°°°°°°°°°°°°°°°°°°°°
if not "%lang%"=="de" echo Credits                                                                              ÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍ
if "%lang%"=="de" echo Danksagung                                                                           ÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍ
echo                                                                                        º                         º
echo ÄÄÄÄÄÄÄÄÄÄ                                                                             º                         º
if not "%lang%"=="de" echo  Developers                                                                          º     °°°°°°°°°°°°°°°     º
if "%lang%"=="de" echo  Entwickler                                                                          º     °°°°°°°°°°°°°°      º
echo ÄÄÄÄÄÄÄÄÄÄ                                                                             º     °±±±±±±±±±±±°°°     º
echo Fniux           -   Till Diegeler                                                      º    °±±°°°°°°°°°°°°      º
echo JamesTheDemSoc  -   James Hyun                                                         º    °±±°                 º
echo HoubkneghteS    -   Adam Simons                                                        º    °±±°       ÛÛÛ  ÛÛÛ  º
echo Retro           -   Lucas Sundermann                                                   º    °±±°        ² ²² ²   º
echo Nekhar          -   Kazou Takashiro                                                    º    °±±°        ² ²² ²   º
echo                                                                                        º    °±±°        ±    ±   º
echo                                                                                        º    °±±°        °    °   º
if not "%lang%"=="de" echo Special thanks to:                                                                     º    °±±°                 º
if "%lang%"=="de" echo Besonderen Dank an:                                                                    º    °±±°                 º
echo                                                                                        º    °±±°°°°°°°°°°°°      º
echo                                                                                        º    °°±±±±±±±±±±±°°°     º
echo Bramblewhisker                                                                         º     °°°°°°°°°°°°°°      º
echo Leaf                                                                                   º                         º
echo ÄÄÄÄÄÄÄÄÄÄ                                                                             º                         º
if not "%lang%"=="de" echo This batch is published under Unlicense and hence Public Domain.                     ÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍ
if "%lang%"=="de" echo Diese Batch wird unter Unlicense und damit Public Domain ver”ffentlicht.             ÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍ
echo ÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ°                                              °°°°°°°°°°°°°°°°°°°°°°°°°°°
echo C'Man     ³ 1. Feb 2016 - 26. Aug 2017. °                                              
echo Weegeebot ³ 2017.                       °
echo ÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ°
echo]
echo Made in Germany.
pause
if "%graphmode%"=="window" goto Menu_Alt
cls
goto cmd

:support
echo.
echo Support
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="de" echo Sourceforge-Projektseite:
if not "%lang%"=="de" echo Sourceforge Project Page:
echo https://sourceforge.net/projects/weegeebot/
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="de" echo Discord-Server:
if not "%lang%"=="de" echo Discord Server:
echo https://discord.gg/xfpDKsf
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
if "%lang%"=="de" echo ...oder spende ber Patreon!  
if not "%lang%"=="de" echo ...or donate via Patreon!  
echo https://www.patreon.com/Weegeebot
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
goto cmd

:exit
exit