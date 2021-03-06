# Weegeebot
Weegeebot is a custom and open-source Discordbot meant to offer many commands that suit a wide variety of servers and users. 

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

## Other Stuff:

Using and operating this bot requires a minimal but functioning knowledge in Javascript, Discord APIs, Nodemon, and Node.js. For any forms of support, see this Discord Server. We are a small collaboration and have other priorities in life though, so a response may not always be the quickest possible thing to come, sadly.

Most of these commands you may find to be completely useless, as they are either personal use cases, or inside jokes. In this case, you may want to build your own commands to replace the ones which have no use to you. This requires an above-par level of Javascript skills.

In other words: this is not your typical plug-and-play Discord bot. It requires maintenence, basic skills, and tweaks to run well for whatever you wish to use it for, but it is a good alternative to starting with a brand new bot, and instead starting with some groundwork already built.

## Instructions:

To use this program, you will need Node.js. Once you get that, type "npm install --save discord.js". Once you get these two things, run the batch file `Cman.bat`. But first there is one thing you need to do. If you don't already have a bot account set up, set one up here: https://discordapp.com/developers/applications/me. After that, create a JSON file with the name data.json in the bot folder and include your bot's real infos (only name and password are needed). Two other jsons with language and prefix data should be created called `lang.json` and `pre.json` Example:

**Data.json:**
```json
{
	"pre":"&",
	"key":"your bot's key",
	"reset":"a password you can message to your bot to make it reset at any time"
}
```
**config.json:**
```json
{}
```
Modifying the code for your own use will also be important. Here are a few simple changes you can add. To add a simple command, the following code should be added (replace "command name" with the thing that people will type to reach your command, and replace "command text" with the bot's response"):

```js
case "command name":
	msg.channel.send("response");
	break;
 ```
A slightly more complex command would be one with two options of response for the bot, to add it, here is the template:
```js
case "command name":
	msg.channel.send(tf(
		"option1",
		"option2"));
	break;
```
## CMan

CMan has been created to significantally facilitate the management of Weegeebot during the steps before it's going to be started. It's quite easy to use and requires only to not be run in a read-only folder; the 'help' command summarizes all available commands. You don't even need to save it in the same folder as Weegeebot any may conveniently start it from any position on your computer - however, regard that you need to manually change the path before that.

``autorun.dat``

As one of the most important inventions, CMan delivers a powerful tool to liberately configure the start-up process by the file autorun.dat, available in the CMan folder. It follows an example:
```powershell
start pm2 start bot.js --name="bot"
```
C'Man now processes two commands at once: In the first line, the English `bot.js` would be started with the internal name "bot".

### Parameters

Parameters allow C'Man to quickly change its behavior before it has been started. Basically, the principle of a C'Man parameter follow the pattern -parameter, with a dash preceeding the name.

An example for a line that starts C'Man with parameters:

`cman.bat -debug -de -port`

This example would start CMan with German language settings and start it in debug and portable mode. Below, you can see the list of available parameters in C'Man:

| Parameter |	Meaning/Impact                                                     |
|-----------|----------------------------------------------------------------------|
|-de 	      |Starts C'Man and Weegeebot with German settings.                    |
|-en 	      |Starts C'Man and Weegeebot with English settings, default language. |
|-debug       |Displays directly the loading steps and decreases some program-internal restrictions to deliver a first hint where an issue may lie.|
|-direct      |Skips the menu and executes autorun.dat directly.|
|-nodemon     |Default application mode, starts Weegeebot over nodemon.js.|
|-port 	      |Avoids loading from the `%appdata%` cache and saves all data only in the local CMan instance. Necessary if multiple users need access to C'Man, for example on Dropbox or an FTP server. Note that in this case, C'Man can only started inside the same folder as Weegeebot is.|

Another way to apply parameters is by using shortcuts. They allow to attach parameters for the application and are a handy way to manage different modes for Weegeebot.

A further support for dedicated Garry's Mod servers is designated, just like a load of other features in the future.
