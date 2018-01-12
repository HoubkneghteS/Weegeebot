@echo off
title C'Man %DATE%
if exist "%~dp0\settings\lang.cfg" set /p lang=<"%~dp0\settings\lang.cfg"
if not exist "%~dp0\settings\lang.cfg" (
   md "%~dp0\settings"
   echo en>"%~dp0\settings\lang.cfg"
)

if exist "%~dp0\settings\start.cfg" set /p start=<"%~dp0\settings\start.cfg"
if not exist "%~dp0\settings\start.cfg" (
   echo pm2>"%~dp0\settings\start.cfg"
)

REM Commands
:init

   cls
   color 1e

   echo C'Man BETA
   echo _______________________
   if "%lang%"=="en" echo Type 'help' for a list of commands, and 'start' to start the bot:
   if "%lang%"=="de" echo Gib 'hilfe' ein fr eine Befehlsliste, und 'start' um den Bot zu starten:

REM Commands
:cmd

   set /p exec= "> "

   if "%lang%"=="en" (
      if "%exec%"=="restart" goto restart
      if "%exec%"=="help" goto help
      if "%exec%"=="lang" goto lang
      if "%exec%"=="mode" goto mode
      if "%exec%"=="credits" goto credits
   )
   if "%lang%"=="de" (
      if "%exec%"=="neustart" goto restart
      if "%exec%"=="hilfe" goto help
      if "%exec%"=="sprache" goto lang
      if "%exec%"=="modus" goto mode
      if "%exec%"=="danksagung" goto credits
   )

   if "%exec%"=="start" goto start
   if "%exec%"=="bot" goto start
   if "%exec%"=="tool" goto tool
   if "%exec%"=="install" goto install

   goto cmd

REM Normal bot
:start

   if "%start%"=="pm2" start pm2 start %~dp0\bot.js --name="bot"
   if "%start%"=="pm2" start forever start %~dp0\bot.js
   if "%start%"=="node" start node bot
   if "%start%"=="nodemon" start nodemon bot
   if "%lang%"=="en" echo Script started!
   if "%lang%"=="de" echo Skript erfolgreich ausgefhrt!
   goto cmd

REM Restart
:restart

   start pm2 restart all
   if "%lang%"=="en" echo Script restarted!
   if "%lang%"=="de" echo Skript wurde neugestartet!
   goto cmd

REM Tool bot
:tool

   start nodemon %~dp0tools\BOT-DEV.js
   if "%lang%"=="en" echo Tool-Bot started!
   if "%lang%"=="de" echo Tool-Bot erfolgreich ausgefhrt!

   goto cmd

REM Installing
:install

   start npm install discord.js
   if "%lang%"=="en" echo Installing Discord.js
   if "%lang%"=="de" echo Installiere Discord.js

   goto cmd

REM Help
:help

   if "%lang%"=="en" (
      echo Command list
      echo _______________________
      echo ³ start   - starts the bot
      echo ³ restart - restarts the bot
      echo ³ install - installs discord.js
      echo ³ tool    - starts tool bot
      echo ³ lang    - changes language
      echo ³ mode    - changes start mode
      echo ³ credits - displays credits
   )
   if "%lang%"=="de" (
      echo Befehlsliste
      echo _______________________
      echo ³ start      - startet den Bot
      echo ³ neustart   - startet den Bot neu
      echo ³ install    - installiert discord.js
      echo ³ tool       - startet den Tool-Bot
      echo ³ sprache    - „ndert Sprache
      echo ³ modus      - „ndert Startmodus
      echo ³ danksagung - zeigt Danksagung an
   )

   goto cmd

REM List of languages
:lang

   cls

   if "%lang%"=="en" echo Language List:
   if "%lang%"=="de" echo Sprachliste:
   echo _______________________
   echo [en] - English
   echo [de] - Deutsch

   set /p inp=
   if "%inp%"=="en" goto enLang
   if "%inp%"=="de" goto deLang

REM English language
:enLang

   set lang=en
   echo en>"%~dp0\settings\lang.cfg"

   goto init

REM German language
:deLang
   
   set lang=de
   echo de>"%~dp0\settings\lang.cfg"

   goto init

REM Startmode
:mode

   cls

   if "%lang%"=="en" echo Startup Modes:
   if "%lang%"=="de" echo Ausfhrungsmodi:
   echo _______________________
   echo [pm2]     - PM2
   echo [node]    - Node.js
   echo [nodemon] - Nodemon
   echo [forever] - Forever

   set /p inp=
   if "%inp%"=="pm2" goto pm2
   if "%inp%"=="node" goto node
   if "%inp%"=="nodemon" goto nodemon
   if "%inp%"=="forever" goto forever

REM Pm2
:pm2

   set start=pm2
   echo pm2>"%~dp0\settings\start.cfg"

   goto init

REM forever start mode
:forever

   set start=forever
   echo forever>"%~dp0\settings\start.cfg"

   goto init

REM Node.js
:node

   set start=node
   echo node>"%~dp0\settings\start.cfg"

   goto init

REM Nodemon
:nodemon

   set start=nodemon
   echo nodemon>"%~dp0\settings\start.cfg"

   goto init

REM Credits
:credits
   
   cls
   color 4b

   echo Weegeebot (2017 - )
   if "%lang%"=="en" echo Developers:
   if "%lang%"=="de" echo Entwickler:
   echo _______________________
   echo HoubkneghteS   - Adam Simons
   echo Fniux          - Till Diegeler
   echo JamesTheDemSoc - James Hyun
   echo _______________________

   pause
   goto init