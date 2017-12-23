const Discord = require("discord.js"),
	bot = new Discord.Client({
		disabledEvents: [
			"RESUMED", "GUILD_SYNC", "GUILD_UPDATE", "GUILD_MEMBER_REMOVE", "GUILD_MEMBER_UPDATE", "GUILD_MEMBERS_CHUNK", "GUILD_ROLE_CREATE", "GUILD_ROLE_DELETE", "GUILD_ROLE_UPDATE", "GUILD_BAN_ADD", "GUILD_BAN_REMOVE", "CHANNEL_CREATE", "CHANNEL_DELETE", "CHANNEL_UPDATE", "CHANNEL_PINS_UPDATE", "MESSAGE_DELETE", "MESSAGE_UPDATE", "MESSAGE_DELETE_BULK", "MESSAGE_REACTION_ADD", "MESSAGE_REACTION_REMOVE", "MESSAGE_REACTION_REMOVE_ALL", "USER_UPDATE", "USER_NOTE_UPDATE", "USER_SETTINGS_UPDATE", "USER_GUILD_SETTINGS_UPDATE", "PRESENCE_UPDATE", "VOICE_STATE_UPDATE", "TYPING_START", "VOICE_SERVER_UPDATE", "RELATIONSHIP_ADD", "RELATIONSHIP_REMOVE"
		]
	}),
	request = require("snekfetch"),
	data = require("../data.json"), //general data
	fs = require("fs"); //file system

	var arg, com; //variables that are used for messages

//error handlers
bot.on("debug", (e) => console.debug(e));
bot.on("error", (e) => console.error(e));
bot.on("warn", (e) => console.warn(e));

bot.on('ready', () => {
	console.log(`Login was successful m8\nServercount: ${bot.guilds.size}\nServerlist: ${bot.guilds.array()}`); //login message
});

bot.login(data.key);

bot.on('message', msg => {
	
	if(!msg.content.startsWith("b&")) return;
	if(msg.author.id != 208152598807576576 && msg.author.id != 233618555722137604 && msg.author.id != 126516587258707969) return; //ignores non devs
	
	arg = msg.content.split(" "); //creates argument values; i.e. arg[1], arg[2], etc.
	com = arg[0].toLowerCase().slice(2); //command value
	
	switch(com) {
	
	case "help":
		msg.channel.send("**Commands:** ``b&serverlist``, ``b&eval``, ``b&leave``, ``b&invite``");
		break;
	case "serverlist":
		var i;
		for(i in bot.guilds.array()) {
			var serverId = (!bot.guilds.array()[i]) ? "undefined" : bot.guilds.array()[i].id;
			msg.channel.send("``["+i+"] "+bot.guilds.array()[i] + " - " + serverId + "``");
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
		bot.guilds.get(arg[1]).channels.array()[1].createInvite()
			.then(invite => msg.channel.send(invite.url));
		break;
}});