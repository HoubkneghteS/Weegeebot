const Discord = require("discord.js"),
	bot = new Discord.Client({ disabledEvents:[
		"TYPING_START",
		"GUILD_SYNC"
	] }),
	request = require("snekfetch"),
	data = require("../data.json"), //general data
	fs = require("fs"); //file system

	var arg, com; //variables that are used for messages

bot.on("debug", (e) => console.debug(e));

bot.on('ready', () => {
	console.log('Login was successful m8' + '\nServercount:' + bot.guilds.size + '\nServerlist: ' + bot.guilds.array()); //login message
});

bot.login(data.key);

bot.on('message', msg => {
	
	if(!msg.content.startsWith("b&")) return;
	if(msg.author.id != 208152598807576576 && msg.author.id != 233618555722137604) return; //ignores non devs
	
	arg = msg.content.split(" "); //creates argument values; i.e. arg[1], arg[2], etc.
	com = arg[0].toLowerCase().slice(2); //command value
	
	switch(com) {
	
	case "help":
		msg.channel.send("**Commands:** ``b&serverlist``, ``b&eval``, ``b&leave``, ``b&invite``");
		break;
	case "serverlist":
		var length = bot.guilds.size - 1;
		for(var i = 0; i <= length; i++) {
			var ida = (!bot.guilds.array()[i]) ? "undefined" : bot.guilds.array()[i].id
			msg.channel.send("``["+i+"] "+bot.guilds.array()[i] + " - " + ida + "``");
		}
		break;
	case "eval":
		msg.channel.send(eval(msg.content.split(" ").slice(1).join(" ")));
		break;
	case "leave":
		msg.channel.send(bot.guilds.get(arg[1]).name + " was removed from the serverlist");
		bot.guilds.get(arg[1]).leave();
		break;
	case "invite":
		bot.guilds.get(arg[1]).channels.array()[1].createInvite().then(invite => msg.channel.send(invite.url));
		break;
}});