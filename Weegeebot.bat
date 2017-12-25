@echo off
echo ==[Weegeebot]==
title Weegeebot %DATE%
color 1e

REM Commands
:cmd

   set /p exec=
   if "%exec%"=="start" goto start
   if "%exec%"=="restart" goto restart
   if "%exec%"=="tool" goto tool
   if "%exec%"=="install" goto install

   goto cmd

REM Normal bot
:start

   start pm2 start %~dp0\bot.js --name="Weegeebot"
   echo Script started!
   goto cmd

REM Restart
:restart

   start pm2 restart all
   echo Scripts restarted!
   goto cmd

REM Tool bot
:tool

   start node %~dp0tools\BOT-DEV.js
   echo Tool bot started!

   goto cmd

REM Installing
:install

   start npm install discord.js
   echo Installing Discord.js

   goto cmd