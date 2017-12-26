@echo off
title Weegeebot %DATE%
if exist "%~dp0\settings\lang.cfg" set /p lang=<"%~dp0\settings\lang.cfg"
if not exist "%~dp0\settings\lang.cfg" (
   md "%~dp0\settings"
   echo en>"%~dp0\settings\lang.cfg"
)
color 1e

REM Commands
:init
   cls

   echo ==[Weegeebot BETA]==
   if "%lang%"=="en" echo Type 'help' for a list of commands:
   if "%lang%"=="de" echo Gib 'hilfe' ein für eine Befehlsliste:

REM Commands
:cmd

   set /p exec= "> "
   if "%lang%"=="en" (
      if "%exec%"=="start" goto start
      if "%exec%"=="restart" goto restart
      if "%exec%"=="tool" goto tool
      if "%exec%"=="install" goto install
      if "%exec%"=="help" goto help
      if "%exec%"=="de" goto deutsch
   )
   if "%lang%"=="de" (
      if "%exec%"=="start" goto start
      if "%exec%"=="neustart" goto restart
      if "%exec%"=="tool" goto tool
      if "%exec%"=="install" goto install
      if "%exec%"=="hilfe" goto help
      if "%exec%"=="en" goto english
   )
   goto cmd

REM Normal bot
:start

   start pm2 start %~dp0\bot.js --name="Weegeebot"
   if "%lang%"=="en" echo Script started!
   if "%lang%"=="de" echo Skript erfolgreich ausgeführt!
   goto cmd

REM Restart
:restart

   start pm2 restart all
   if "%lang%"=="en" echo Script restarted!
   if "%lang%"=="de" echo Skript wurde neugestartet!
   goto cmd

REM Tool bot
:tool

   start node %~dp0tools\BOT-DEV.js -debug
   echo Tool bot started!

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
      echo -------------------
      echo start   - starts the bot
      echo restart - restarts the bot
      echo install - installs discord.js
      echo tool    - starts tool bot
      echo de      - changes language
      echo to German
   )
   if "%lang%"=="de" (
      echo Befehlsliste
      echo -------------------
      echo start    - startet den Bot
      echo neustart - startet den Bot neu
      echo install  - installiert discord.js
      echo tool     - startet den Tool-Bot
      echo en       - stellt Sprache auf
      echo Englisch um
   )

   goto cmd

REM German language
:deutsch

   set lang=de

   echo de>"%~dp0\settings\lang.cfg"

   goto init

REM English language
:english

   set lang=en
   echo en>"%~dp0\settings\lang.cfg"

   goto init