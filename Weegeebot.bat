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
   if "%lang%"=="de" echo Gib 'hilfe' ein fr eine Befehlsliste:

REM Commands
:cmd

   set /p exec= "> "
   if "%lang%"=="en" (
      if "%exec%"=="start" goto start
      if "%exec%"=="restart" goto restart
      if "%exec%"=="tool" goto tool
      if "%exec%"=="install" goto install
      if "%exec%"=="help" goto help
      if "%exec%"=="lang" goto lang
   )
   if "%lang%"=="de" (
      if "%exec%"=="start" goto start
      if "%exec%"=="neustart" goto restart
      if "%exec%"=="tool" goto tool
      if "%exec%"=="install" goto install
      if "%exec%"=="hilfe" goto help
      if "%exec%"=="sprache" goto lang
   )
   goto cmd

REM Normal bot
:start

   start pm2 start %~dp0\bot.js --name="Weegeebot"
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

   start node %~dp0tools\BOT-DEV.js -debug
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
   )
   if "%lang%"=="de" (
      echo Befehlsliste
      echo _______________________
      echo ³ start    - startet den Bot
      echo ³ neustart - startet den Bot neu
      echo ³ install  - installiert discord.js
      echo ³ tool     - startet den Tool-Bot
      echo ³ sprache  - „ndert Sprache
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