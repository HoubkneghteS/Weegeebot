const Discord = require("discord.js"),
	bot = new Discord.Client({
		disabledEvents: [
			"RESUMED", "GUILD_SYNC", "GUILD_UPDATE", "GUILD_MEMBER_REMOVE", "GUILD_MEMBER_UPDATE", "GUILD_MEMBERS_CHUNK", "GUILD_ROLE_CREATE", "GUILD_ROLE_DELETE", "GUILD_ROLE_UPDATE", "GUILD_BAN_ADD", "GUILD_BAN_REMOVE", "CHANNEL_CREATE", "CHANNEL_DELETE", "CHANNEL_UPDATE", "CHANNEL_PINS_UPDATE", "MESSAGE_DELETE", "MESSAGE_UPDATE", "MESSAGE_DELETE_BULK", "MESSAGE_REACTION_ADD", "MESSAGE_REACTION_REMOVE", "MESSAGE_REACTION_REMOVE_ALL", "USER_UPDATE", "USER_NOTE_UPDATE", "USER_SETTINGS_UPDATE", "USER_GUILD_SETTINGS_UPDATE", "PRESENCE_UPDATE", "VOICE_STATE_UPDATE", "TYPING_START", "VOICE_SERVER_UPDATE", "RELATIONSHIP_ADD", "RELATIONSHIP_REMOVE"
		]
	}),
	request = require("snekfetch"), //allows usage of other APIs
	fs = require("fs"), //file system
	data = require("./data.json"), //general data
	config = JSON.parse(fs.readFileSync("./config.json", "utf8")); //server settings data Daenk U adam

//arrays for random commands
const weegee = ["http://images2.fanpop.com/image/photos/12400000/weegee-stares-at-stewie-weegee-stare-12424998-640-478.jpg",
	"http://i0.kym-cdn.com/photos/images/original/000/039/362/Demotivational__Weegee_by_LinkMasterXP.jpg",
	"Weegeeboard:\nhttps://www.novacorp-online.net/blog/wp-content/uploads/2014/06/Weegee-Board-small.png",
	"http://www.mypokecard.com/en/Gallery/my/galery/scQa4DXB4BGK.jpg",
	"https://media.discordapp.net/attachments/296153783812096000/367126085273387029/IMG_1946.PNG",
	"https://www.youtube.com/watch?v=F2cFBtBAFbI",
	"http://img2.wikia.nocookie.net/__cb20130810041157/unmario/images/thumb/f/f3/Keep-calm-and-obey-weegee-2.png/500px-Keep-calm-and-obey-weegee-2.png",
	"http://images2.wikia.nocookie.net/__cb20121224035460/thefakegees/images/3/35/Weegeelution.png",
	"https://cdn.discordapp.com/attachments/296153783812096000/370020109911195651/IMG_1930.PNG",
	"http://orig10.deviantart.net/cdc5/f/2009/214/2/4/weegee_vs__squeegee_by_smawzyuw2.png",
	"http://orig15.deviantart.net/e348/f/2008/211/f/8/nazi_weegee_by_mehku.jpg",
	"http://img4.wikia.nocookie.net/__cb20130103160805/thefakegees/images/e/eb/Patreegee.png",
	"http://oi49.tinypic.com/33pcvo5.jpg",
	"https://cdn.discordapp.com/attachments/296153783812096000/367131219772833792/IMG_1952.PNG",
	"https://www.youtube.com/watch?v=RINuSPjnb-I&t=2s",
	"https://cdn.discordapp.com/attachments/296153783812096000/370022478988181508/IMG_1944.PNG",
	"http://img3.wikia.nocookie.net/__cb20090504232944/unmario/images/7/7f/Malleo.png",
	"http://vignette2.wikia.nocookie.net/the-great-malleo/images/b/bd/Weegee_VS_%22That_Guy_Who_Moves_His_Head%22/revision/latest/scale-to-width/330?cb=20141103212947",
	"https://vignette2.wikia.nocookie.net/thefakegees/images/b/bb/Alot_of_weegees.gif/revision/latest?cb=20140414042852",
	"https://vignette3.wikia.nocookie.net/thefakegees/images/a/af/Seagee.png/revision/latest?cb=20110508013355",
	"https://vignette2.wikia.nocookie.net/thefakegees/images/5/52/Osama_Bin_Weegee.png/revision/latest?cb=20120529190722",
	"http://i2.kym-cdn.com/photos/images/facebook/000/029/110/WEEGEE_by_hotdiggedydemon.jpg",
	"https://vignette3.wikia.nocookie.net/thefakegees/images/b/b6/Fortran.png/revision/latest?cb=20120620231241",
	"https://vignette1.wikia.nocookie.net/thefakegees/images/b/b1/Teenage_Weegee1.png/revision/latest?cb=20140209175219",
	"https://youtu.be/qpIfWOmaYLs",
	"https://youtu.be/jL4gkkklsN0",
	"https://www.youtube.com/watch?v=rZXkZv1z5-U",
	"https://youtu.be/15nNY7uofNw",
	"https://www.youtube.com/watch?v=JEXFwho46VM",
	"https://www.youtube.com/watch?v=NqsPZ4s6UIY",
	"https://www.youtube.com/watch?v=oy_htO1oyJc",
	"https://www.youtube.com/watch?v=StrQ1hKcT7o",
	"https://www.youtube.com/watch?v=A_6zEe3ss80",
	"https://www.youtube.com/watch?v=cpNMjpvxe9s",
	"https://www.youtube.com/watch?v=3MnrAw8Icfs",
	"https://www.youtube.com/watch?v=zQ2hOgmbOik",
	"https://www.youtube.com/watch?v=Sl6VHDSd570",
	"https://vignette3.wikia.nocookie.net/thefakegees/images/0/06/Papa_Weegee1.png/revision/latest?cb=20131204012924",
	"https://i.ytimg.com/vi/5Wk4gVuNMng/maxresdefault.jpg",
	"http://orig04.deviantart.net/9b0b/f/2009/196/e/a/weegee_and_vegeta_by_auragiratina.png",
	"https://cdn.discordapp.com/attachments/298993914126270464/358419983270936576/IMG_1732.JPG"],
	nuke = ["https://upload.wikimedia.org/wikipedia/commons/c/c7/Explosions.jpg",
		"https://upload.wikimedia.org/wikipedia/commons/3/31/NTS_-_BEEF_-_WATUSI.jpg",
		"http://dailyreckoning.com/dr-content/uploads/2013/11/Nuke-650x360.jpg",
		"https://i.ytimg.com/vi/6JKUf8GrX3w/maxresdefault.jpg",
		"https://i.ytimg.com/vi/fNRACDfCYZk/maxresdefault.jpg"],
	boobs = ["https://i.imgur.com/FNIQSVc.jpg?1",
		"https://i.imgur.com/5vAhNye.jpg?1",
		"https://i.imgur.com/3nSy4NI.jpg",
		"https://i.imgur.com/DlzGBBe.jpg",
		"https://i.imgur.com/ssYJXSn.gifv",
		"https://i.imgur.com/QlSx8DQ.jpg",
		"https://i.redd.it/6u4xybqxvdxz.jpg",
		"https://i.imgur.com/sIQh19X.jpg",
		"https://i.imgur.com/F2nIY1K.gifv",
		"https://i.imgur.com/cPLJgoT.jpg",
		"https://i.imgur.com/tBM5hJW.png",
		"http://i.imgur.com/EA3Nzlm.jpg",
		"https://i.imgur.com/wRKrNRv.jpg",
		"https://i.imgur.com/TpZMatc.jpg",
		"https://i.imgur.com/HTV6192.jpg",
		"https://i.imgur.com/mnkXSzA.jpg",
		"https://i.redd.it/bwcz3pztamxz.jpg",
		"https://i.imgur.com/na6ss0K.jpg",
		"https://i.imgur.com/k495Tso.jpg",
		"https://i.redd.it/8hjwyohojlxz.png"],
	pengu = ["http://2.bp.blogspot.com/-v-nHXmn-FHw/TgGvoz9_OpI/AAAAAAAADpw/tqwEQdhsrGE/s1600/cute-penguin1.jpg",
		"http://images5.fanpop.com/image/photos/26400000/PENGUINS-OF-FACE-MEMES-penguins-of-madagascar-26462995-500-281.png",
		"http://www.natureart.cz/images/gallery/01-2009-5825.jpg",
		"http://www.desktopwallpaperhd.net/wallpapers/14/0/landscapes-background-penguin-animal-143248.jpg",
		"http://searchengineland.com/figz/wp-content/seloads/2014/08/penguin-walking-ss-1920-800x450.jpg",
		"http://pre05.deviantart.net/b305/th/pre/f/2013/094/4/1/emperor_penguin_by_laogephoto-d60e2v4.jpg",
		"https://upload.wikimedia.org/wikipedia/commons/e/ee/Gorfou_sauteur_-_Rockhopper_Penguin.jpg",
		"http://www.jnb-birds.com/Antarctica/2007-01-01/KingPenguin_F.jpg",
		"http://orig01.deviantart.net/f380/f/2015/220/1/b/profile_picture_by_aesthetic_pengu-d94vo11.jpg",
		"https://i.pinimg.com/736x/20/ef/ec/20efecf559c3bc0328b1a33581252168.jpg",
		"http://images2.fanpop.com/images/photos/4800000/Empror-Chick-penguins-4836448-1024-768.jpg",
		"http://wildography.co.uk/wp-content/uploads/2012/11/penguin-chicks-in-snow-hill-island-antartica-by-robert-harding.jpg",
		"http://tierbildergalerie.com/data/media/96/lustig_pinguin.jpg",
		"http://www.tierbildergalerie.com/data/media/96/witzige_pinguin.jpg",
		"http://1.bp.blogspot.com/-b-lDZrTyrAU/Tv293VXBRjI/AAAAAAAAEFA/THo6V_1Vwlg/s1600/Emperor-Penguin-05.jpg"],
	flag = ["\n⚪⚪🔵⚪⚪⚪⚪⚪\n🔵🔵🔵🔵🔵🔵🔵🔵\n⚪⚪🔵⚪⚪⚪⚪⚪\n⚪⚪🔵⚪⚪⚪⚪⚪", //finland
		"🔵🔵🔵🔴🔴🔴🔴🔴🔴\n🔵🔵🔵⚪⚪⚪⚪⚪⚪\n🔵🔵🔵🔴🔴🔴🔴🔴🔴\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n🔴🔴🔴🔴🔴🔴🔴🔴🔴\n⚪⚪⚪⚪⚪⚪⚪⚪⚪", //usa
		"🔵🔵🔵⚪⚪⚪🔴🔴🔴\n🔵🔵🔵⚪⚪⚪🔴🔴🔴\n🔵🔵🔵⚪⚪⚪🔴🔴🔴\n🔵🔵🔵⚪⚪⚪🔴🔴🔴\n🔵🔵🔵⚪⚪⚪🔴🔴🔴\n🔵🔵🔵⚪⚪⚪🔴🔴🔴", //france
		"⚫⚫⚫⚫⚫⚫⚫⚫⚫\n⚫⚫⚫⚫⚫⚫⚫⚫⚫\n🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔶🔶🔶🔶🔶🔶🔶🔶🔶\n🔶🔶🔶🔶🔶🔶🔶🔶🔶", //germany
		"⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴\n⚫⚫⚫🔶🔶🔶🔴🔴🔴", //belgium
		"💚💚💚💚💚💚💚💚💚💚\n💚💚💚⚪⚪⚪⚪💚💚💚\n💚💚💚⚪💚⚪⚪💚💚💚\n💚💚💚⚪💚⚪⚪💚💚💚\n💚💚💚⚪💚⚪⚪💚💚💚\n💚💚💚⚪💚⚪⚪💚💚💚\n💚💚💚⚪💚💚⚪💚💚💚\n💚💚💚⚪⚪⚪⚪💚💚💚\n💚💚💚💚💚💚💚💚💚💚", //weegee
		"🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n⚪⚪⚫⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚫⚫⚫⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚫⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵", //lowlandia
		"🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵", //netherlands
		"⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚪⚪⚪⚪⚪⚪⚪⚪\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴", //russia
		"🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴⭐🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴⭐🔴🔴⭐🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴⭐🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴⭐🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴", //china
		"🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴⚪⚪🔴🔴🔴\n🔴🔴🔴⚪⚪🔴🔴🔴\n🔴⚪⚪⚪⚪⚪⚪🔴\n🔴⚪⚪⚪⚪⚪⚪🔴\n🔴🔴🔴⚪⚪🔴🔴🔴\n🔴🔴🔴⚪⚪🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴", //switzerland
		"🔴⚪⚪⚪🔴\n🔴⚪🍁⚪🔴\n🔴⚪⚪⚪🔴", //canada
		"🔵🔵🔵🔶🔶🔶🔴🔴🔴\n🔵🔵🔵🔶🔶🔶🔴🔴🔴\n🔵🔵🔵🔶🔶🔶🔴🔴🔴\n🔵🔵🔵🔶🔶🔶🔴🔴🔴\n🔵🔵🔵🔶🔶🔶🔴🔴🔴\n🔵🔵🔵🔶🔶🔶🔴🔴🔴", //romania
		"🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n🔴🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴🔴", //austria
		"🔴🔴⚪🔴🔴🔴🔴🔴\n🔴🔴⚪🔴🔴🔴🔴🔴\n⚪⚪⚪⚪⚪⚪⚪⚪\n🔴🔴⚪🔴🔴🔴🔴🔴\n🔴🔴⚪🔴🔴🔴🔴🔴", //denmark
		"🔵🔵🔶🔵🔵🔵🔵🔵\n🔵🔵🔶🔵🔵🔵🔵🔵\n🔶🔶🔶🔶🔶🔶🔶🔶\n🔵🔵🔶🔵🔵🔵🔵🔵\n🔵🔵🔶🔵🔵🔵🔵🔵", //sweden
		"⚪⚪⚪⚪⚪⚪\n⚪⚪⚪⚪⚪⚪\n🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴", //poland
		"⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚪🔴🔴⚪⚪⚪\n⚪⚪🔴🔴🔴🔴⚪⚪\n⚪⚪🔴🔴🔴🔴⚪⚪\n⚪⚪⚪🔴🔴⚪⚪⚪\n⚪⚪⚪⚪⚪⚪⚪⚪", //japan
		"🔴🔴🔴🔴🔴🔴🔴🔴\n🔴🔴🔴🔴🔴🔴🔴🔴\n⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚪⚪⚪⚪⚪⚪\n💚💚💚💚💚💚💚💚\n💚💚💚💚💚💚💚💚", //hungary
		"🔵🔵🔵🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵🔵🔵🔵\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚪⚪⚪⚪⚪⚪⚪⚪⚪\n⚫⚫⚫⚫⚫⚫⚫⚫⚫\n⚫⚫⚫⚫⚫⚫⚫⚫⚫", //estonia
		"🔵🔵🔵🔵🔵🔵\n🔵🔵🔵🔵🔵🔵\n🔶🔶🔶🔶🔶🔶\n🔶🔶🔶🔶🔶🔶", //ukraine
		"🔴🔴🔴🔴🔴🔴\n🔶🔶🔶🔶🔶🔶\n🔶🔶🔶🔶🔶🔶\n🔴🔴🔴🔴🔴🔴", //spain
		"⚪⚪⚪🔴⚪⚪⚪\n⚪⚪⚪🔴⚪⚪⚪\n🔴🔴🔴🔴🔴🔴🔴\n⚪⚪⚪🔴⚪⚪⚪\n⚪⚪⚪🔴⚪⚪⚪", //england
		"💚💚💚⚪⚪⚪🔴🔴🔴\n💚💚💚⚪⚪⚪🔴🔴🔴\n💚💚💚⚪⚪⚪🔴🔴🔴\n💚💚💚⚪⚪⚪🔴🔴🔴\n💚💚💚⚪⚪⚪🔴🔴🔴\n💚💚💚⚪⚪⚪🔴🔴🔴" //italy
	],
	ass = ["https://i.imgur.com/sX6Raen.jpg",
		"http://i.imgur.com/5Za9QY5.jpg",
		"https://i.redd.it/2w1g207j39yz.jpg",
		"https://i.imgur.com/hONKsBo.jpg?1",
		"https://i.imgur.com/MhBEHfX.gifv",
		"https://i.imgur.com/bcSLnA6.jpg",
		"https://i.redd.it/0yb9ybwdg6yz.jpg",
		"https://i.redd.it/r8ergoj748yz.jpg",
		"https://i.imgur.com/NGdPRs0.jpg",
		"https://i.imgur.com/86l7z4a.jpg",
		"https://i.imgur.com/n3ZQ9Hb.jpg",
		"https://i.imgur.com/XZ8L7wZ.jpg",
		"https://i.imgur.com/F8MESwo.jpg",
		"https://i.imgur.com/pAiezRD.jpg",
		"https://i.redd.it/4yu37h9h24yz.jpg",
		"http://i.imgur.com/cDxp9n1.jpg",
		"https://imgur.com/FOPuJ1a",
		"http://i.imgur.com/0SWRNrw.jpg?1",
		"http://i.imgur.com/u72N1zt.jpg",
		"http://i.imgur.com/ZmeFH5G.jpg"],
	cancer = [
		"https://coubsecure-s.akamaihd.net/get/b87/p/coub/simple/cw_timeline_pic/abe14ab8ffd/818c9b73ece81a8a5b194/med_1470851871_image.jpg",
		"https://new3.fjcdn.com/pictures/Furry_2a6dc4_5456948.jpg",
		"https://new3.fjcdn.com/pictures/Furry_a38706_5518614.jpg",
		"https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/13187990_1716864618575897_1185520412_n.jpg?ig_cache_key=MTI1MzczMTI2NDY5MTE5NjY3Mw%3D%3D.2",
		"https://new2.fjcdn.com/comments/It+probably+is+a+troll+but+i+have+indeed+met+_e118aa3a49f433cd8839c1349834bc00.png",
		"http://cdn5.upsocl.com/wp-content/uploads/2016/10/furry-convention-getty-640x480.jpg",
		"https://pbs.twimg.com/profile_images/602673856373858304/SUPqxZv9.jpg",
		"https://pre11.deviantart.net/2ae8/th/pre/f/2016/153/2/0/sjw_by_neetsfagging322297-da4py3b.png",
		"https://absoluterights.com/wp-content/uploads/2016/11/sjwicon1.jpg",
		"http://faithandheritage.com/wp-content/uploads/2017/03/SJW-interview-CAFAB-CAMAB-gynocracy-snowflake-transgenderism.jpg",
		"https://i.redd.it/gsh93b0zsdwy.jpg",
		"https://i0.wp.com/sarkymarky.com/wp-content/uploads/2016/04/vlcsnap-00002.jpg?resize=1280%2C738&ssl=1",
		"http://www.returnofkings.com/wp-content/uploads/2015/02/Lincoln-sjw.png",
		"https://memes4.fjcdn.com/pictures/Short+brony+cringe+comp_b8e68e_6207245.jpg",
		"https://2static.fjcdn.com/pictures/Gc_3652aa_6127211.jpg",
		"https://i.ytimg.com/vi/zS5dcuTGNdU/maxresdefault.jpg",
		"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq_Qr7DInGeu1dTfanyuhic1qh-prV5ngn9QvHY7DXxEP2bpAscg",
		"https://i.ytimg.com/vi/Q1clkxtpHMU/mqdefault.jpg",
		"https://www.youtube.com/watch?v=hRZlHb2sXS8",
		"https://www.youtube.com/watch?v=d2rsb86ZWOQ",
		"https://www.youtube.com/watch?v=zLVkh4jNrLI",
		"https://www.youtube.com/watch?v=AlKDYjNNkPE",
		"https://www.youtube.com/watch?v=yqiejTXxTEA",
		"https://www.youtube.com/watch?v=rtqDu60Hp9Y",
		"https://www.youtube.com/watch?v=tAtug_LVsmM",
		"https://www.youtube.com/watch?v=pBk51dxMeK8",
		"https://podricing.pw/uploads/images/scaled_full_86738a341e10285f86ca.png",
		"https://www.youtube.com/watch?v=pI7pAsvqPAk",
		"https://derpicdn.net/img/2016/11/6/1290044/large.png",
		"https://www.youtube.com/watch?v=Uuynhei-1r8",
		"https://i.ytimg.com/vi/rk-XEY5lcrY/hqdefault.jpg",
		"http://i.imgur.com/1a2FWA1.jpg",
		"https://static.fjcdn.com/pictures/Cringe_71879c_5480899.jpg",
		"https://www.youtube.com/watch?v=jh5BkbPew10",
		"https://i.ytimg.com/vi/HeuhiHPigF4/hqdefault.jpg",
		"https://img.ifcdn.com/images/1bf0ff8c2e9bfa001672543ee75e442f96b68535b8c08866943ef55ffa653c42_1.jpg",
		"http://media.japanpowered.com/images/desu-meme.jpg",
		"https://i.pinimg.com/736x/85/49/9f/85499f071ff46849df2ec5cc668af2a8--google-search-weeaboo-cringe.jpg",
		"https://i.ytimg.com/vi/5QvgLlFyeok/hqdefault.jpg"],
	ascii = [
		"\n░█████░░░░░█████░" +
		"\n█░░░░░█░░░█░░░░░█" +
		"\n░░███░░░░░░░███░░█" +
		"\n░█░░░█░░░░░█░░░██" +
		"\n█░░░███░░░█░░░███" +
		"\n█░░████░░░█░░████" +
		"\n█░░░███░░░█░░░███" +
		"\n░█░░░█░░░░░█████" +
		"\n░░███░░░░░█░░░░░██" +
		"\n░░░░░░░░░░░░░░░░░█ █" +
		"\n░░██░░░░██░░░░░░░░███" +
		"\n░░░████████░░░░░░░███" +
		"\n░░░░████████░░░░░███" +
		"\n░░░░░░████████████" +
		"\n░░░░░░░░░░░░░░░█" +
		"\n░░░░░░░░░░░░░░█" +
		"\n██░░░░░░░░░░███" +
		"\n█░░░░░░░░░░█" +
		"\n█░░░░░░░░█" +
		"\n█░░░░░░█",
		"\n                #" +
		"\n               # #" +
		"\n              #   #" +
		"\n             #     #" +
		"\n  #############################" +
		"\n   #       #    X    #       #" +
		"\n    #     #   X       #     #" +
		"\n     #   #  X       X  #   #" +
		"\n      # #     X   X   X # #" +
		"\n       #X       X       X#" +
		"\n      # # X   X   X     # #" +
		"\n     #   #  X       X  #   #" +
		"\n    #     #       X   #     #" +
		"\n   #       #    X    #       #" +
		"\n  #############################" +
		"\n             #     #" +
		"\n              #   #" +
		"\n               # #" +
		"\n                #",
		"\n░░░░░░░░░░▀▀▀██████▄▄▄░░░░░░░░░░" +
		"\n░░░░░░░░░░░░░░░░░▀▀▀████▄░░░░░░░" +
		"\n░░░░░░░░░░▄███████▀░░░▀███▄░░░░░" +
		"\n░░░░░░░░▄███████▀░░░░░░░▀███▄░░░" +
		"\n░░░░░░▄████████░░░░░░░░░░░███▄░░" +
		"\n░░░░░██████████▄░░░░░░░░░░░███▌░" +
		"\n░░░░░▀█████▀░▀███▄░░░░░░░░░▐███░" +
		"\n░░░░░░░▀█▀░░░░░▀███▄░░░░░░░▐███░" +
		"\n░░░░░░░░░░░░░░░░░▀███▄░░░░░███▌░" +
		"\n░░░░▄██▄░░░░░░░░░░░▀███▄░░▐███░░" +
		"\n░░▄██████▄░░░░░░░░░░░▀███▄███░░░" +
		"\n░█████▀▀████▄▄░░░░░░░░▄█████░░░░" +
		"\n░████▀░░░▀▀█████▄▄▄▄█████████▄░░" +
		"\n░░▀▀░░░░░░░░░▀▀██████▀▀░░░▀▀██░░",
		"\n.___. " +
		"\n{o,o} " +
		"\n/)__) " +
		'\n--"-"',
		"\n        ▄▄▄▄▄▄▄▄" +
		"\n     ▄█▀▀░░░░░░▀▀█▄" +
		"\n   ▄█▀▄██▄░░░░░░░░▀█▄" +
		"\n  █▀░▀░░▄▀░░░░▄▀▀▀▀░▀█" +
		"\n █▀░░░░███░░░░▄█▄░░░░▀█" +
		"\n █░░░░░░▀░░░░░▀█▀░░░░░█" +
		"\n █░░░░░░░░░░░░░░░░░░░░█" +
		"\n █░░██▄░░▀▀▀▀▄▄░░░░░░░█" +
		"\n ▀█░█░█░░░▄▄▄▄▄░░░░░░█▀" +
		"\n  ▀█▀░▀▀▀▀░▄▄▄▀░░░░▄█▀" +
		"\n   █░░░░░░▀█░░░░░▄█▀" +
		"\n   █▄░░░░░▀█▄▄▄█▀▀" +
		"\n    ▀▀▀▀▀▀▀",
		"\n      █▐▓▓░████▄▄▄█▀▄▓▓▓▌█" +
		"\n    ▄█▌▀▄▓▓▄▄▄▄▀▀▀▓▓▓▓▓▌█" +
		"\n   ▄█▀▀▄▓█▓▓▓▓▓▓▓▓▓▓▓▀░▓▌█" +
		"\n  █▀▄▓▓▓███▓▓▓███▓▓▓▄░░▄▓▐█▌" +
		"\n █▌▓▓▓▀▀▓▓▓▓███▓▓▓▓▓▓▄▀▓▓▐█" +
		"\n▐█▐██▐░▄▓▓▓▓▓▀▄░▀▓▓▓▓▓▓▓▌█▌" +
		"\n█▌███▓▓▓▓▓▓▓▓▐░░▄▓▓█▓▓▓▄▀▐█" +
		"\n█▐█▓▀░░▀▓▓▓▓▓▓▓▓▓███▓▓▓▓▐█" +
		"\n▌▓▄▌▀░▀░▐▀█▄▓▓██████▓▓▓▌█▌" +
		"\n▌▓▓▓▄▄▀▀▓▓▓▀▓▓▓▓▓▓▓▓█▓█▓█▓▓▌" +
		"\n█▐▓▓▓▓▓▓▄▄▄▓▓▓▓▓▓█▓█▓█▓█▓▓▓",
		"\n   |\      _,,,---,,_" +
		"\n   /,`.-'`'    -.  ;-;;,_" +
		"\n  |,4-  ) )-,_..;\ (  `'-'" +
		"\n :---''(_/--'  `-'\_)  fL",
		"\n  ______________________" +
		"\n /\\                     \\" +
		"\n/  \\    _________________\\" +
		"\n\\   \\   \\                /" +
		"\n \\   \\   \\__________    /" +
		"\n  \\   \\   \\    /   /   /" +
		"\n   \\   \\   \\  /   /   /" +
		"\n    \\   \\   \\/   /   /" +
		"\n     \\   \\  /   /   /" +
		"\n      \\   \\/   /   /" +
		"\n       \\      /   /" +
		"\n        \\    /   /" +
		"\n         \\  /   /" +
		"\n          \\/___/",
		"\n__̴ı̴̴̡̡̡ ̡͌l̡̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴̡ ̡̡͡|̲̲̲͡͡͡ ̲▫̲͡ ̲̲̲͡͡π̲̲͡͡ ̲̲͡▫̲̲͡͡ ̲|̡̡̡ ̡ ̴̡ı̴̡̡ ̡͌l̡̡̡̡.___",
		"\n       /\\" +
		"\n      /  \\" +
		"\n     /,--.\\" +
		"\n    /< () >\\" +
		"\n   /  `--'  \\" +
		"\n  /          \\" +
		"\n /   WEEGEE   \\" +
		"\n/______________\\",
		"\n   %%% %%%%%%%            |#|" +
		"\n   %%%% %%%%%%%%%%%        |#|####" +
		"\n  %%%%% %         %%%       |#|=#####" +
		"\n %%%%% %   @    @   %%      | | ==####" +
		"\n%%%%%% % (_  ()  )  %%     | |    ===##" +
		"\n%%  %%% %  \_    | %%      | |       =##" +
		"\n%    %%%% %  u^uuu %%     | |         ==#" +
		"\n     %%%% %%%%%%%%%      | |           V",
		"\n    (_)" +
		"\n  <--|-->" +
		"\n _   |   _" +
		"\n`\\__/ \\__/`" +
		"\n  `-. .-'" +
		"\n     '",
		"\n$$$$$$$$$$$$$$$$$$$$$$$$$" +
		"\n$$$$$'`$$$$$$$$$$$$$'`$$$" +
		"\n$$$$$$  $$$$$$$$$$$  $$$$" +
		"\n$$$$$$$  '$/ `/ `$' .$$$$" +
		"\n$$$$$$$$. i  i  /! .$$$$$" +
		"\n$$$$$$$$$.--'--'   $$$$$$" +
		"\n$$^^$$$$$'        J$$$$$$" +
		"\n$$$   ~''   `.   .$$$$$$$" +
		"\n$$$$$e,      ;  .$$$$$$$$" +
		"\n$$$$$$$$$$$.'   $$$$$$$$$" +
		"\n$$$$$$$$$$$$.    $$$$$$$$",
		"(^0^) WOOT WOOT",
		"\n _______                _______      <>_<>" +
		"\n(_______) |_|_|_|_|_|_|| [] [] | .---|''`|--\\" +
		"\n`-oo---oo-'`-oo-----oo-'`-o---o-'`o'O-OO-OO-O'o''",
		"(-_-)",
		"\n                    ######" +
		"\n                  #########" +
		"\n                 ###########" +
		"\n                 ###▓▓##▓▓###" +
		"\n                 ##▓▓▓#▓▓▓▓##" +
		"\n   #####       ####▓▓▓#▓▓▓###      #####" +
		"\n  #########   ######▓###▓################" +
		"\n  #######################################" +
		"\n  ##############▓##▓▓#▓##▓▓▓#############" +
		"\n   #####################################" +
		"\n    ###################################" +
		"\n       ###########################" +
		"\n          #######################" +
		"\n           ######################" +
		"\n           ######################" +
		"\n           #######################" +
		"\n          #########################" +
		"\n         ###########################" +
		"\n         ############################" +
		"\n         #############################" +
		"\n         #############################" +
		"\n          #####     ####    #########",
		"\n....................../´¯/)" +
		"\n....................,/¯../ " +
		"\n.................../..../ " +
		"\n............./´¯/'...'/´¯¯`·¸ " +
		"\n........../'/.../..../......./¨¯\\ " +
		"\n........('(...´...´.... ¯~/'...') " +
		"\n.........\\.................'...../ " +
		"\n..........''...\\.......... _.·´ " +
		"\n............\\..............( " +
		"\n..............\\.............\\...",
		"\n        _.od8888888bo._" +
		"\n      .dP''   @#@   ''Yb." +
		"\n    .d''      #@#      ''b." +
		"\n   d''        @#@        ''b" +
		"\n  d'          #@#          'b" +
		"\n dP           @#@           Yb" +
		"\n 8l          oDWBo          l8" +
		"\n Yb        o@#@B@#@o        dP" +
		"\n  YI     o@#* #P# *#@o     IP" +
		"\n   YI  o@#*   @#@   *#@o  IP" +
		"\n    '9@#*     #@#     *#@P'" +
		"\n      '8b     @#@     d8'" +
		"\n         'Y888888888P'",
		"\n⣿⣿⣿⣿⣿⣿⡷⣯⢿⣿⣷⣻⢯⣿⡽⣻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠸⣿⣿⣆⠹⣿⣿⢾⣟⣯⣿⣿⣿⣿⣿⣿⣽⣻⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌" +
		"\n⣿⣿⣿⣿⣿⣿⣻⣽⡿⣿⣎⠙⣿⣞⣷⡌⢻⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⡄⠹⣿⣿⡆⠻⣿⣟⣯⡿⣽⡿⣿⣿⣿⣿⣽⡷⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣟⣷⣿⣿⣿⡀⠹⣟⣾⣟⣆⠹⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢠⡘⣿⣿⡄⠉⢿⣿⣽⡷⣿⣻⣿⣿⣿⣿⡝⣷⣯⢿⣿⣿⣿⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣯⢿⣾⢿⣿⡄⢄⠘⢿⣞⡿⣧⡈⢷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣧⠘⣿⣷⠈⣦⠙⢿⣽⣷⣻⣽⣿⣿⣿⣿⣌⢿⣯⢿⣿⣿⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣟⣯⣿⢿⣿⡆⢸⡷⡈⢻⡽⣷⡷⡄⠻⣽⣿⣿⡿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣏⢰⣯⢷⠈⣿⡆⢹⢷⡌⠻⡾⢋⣱⣯⣿⣿⣿⣿⡆⢻⡿⣿⣿⣿⣿⡟⣿" +
		"\n⣿⣿⣿⣿⣿⣿⡎⣿⢾⡿⣿⡆⢸⣽⢻⣄⠹⣷⣟⣿⣄⠹⣟⣿⣿⣟⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⢸⣯⣟⣧⠘⣷⠈⡯⠛⢀⡐⢾⣟⣷⣻⣿⣿⣿⡿⡌⢿⣻⣿⣿⣿⣿⡌" +
		"\n⣿⣿⣿⣿⣿⣿⣧⢸⡿⣟⣿⡇⢸⣯⣟⣮⢧⡈⢿⣞⡿⣦⠘⠏⣹⣿⣽⢿⣿⣿⣿⣿⣯⣿⣿⣿⡇⢸⣿⣿⣾⡆⠹⢀⣠⣾⣟⣷⡈⢿⣞⣯⢿⣿⣿⣿⢷⠘⣯⣿⣿⣿⣿⣷" +
		"\n⣿⣿⣿⣿⣿⣿⣿⡈⣿⢿⣽⡇⠘⠛⠛⠛⠓⠓⠈⠛⠛⠟⠇⢀⢿⣻⣿⣯⢿⣿⣿⣿⣷⢿⣿⣿⠁⣾⣿⣿⣿⣧⡄⠇⣹⣿⣾⣯⣿⡄⠻⣽⣯⢿⣻⣿⣿⡇⢹⣾⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣿⡇⢹⣿⡽⡇⢸⣿⣿⣿⣿⣿⣞⣆⠰⣶⣶⡄⢀⢻⡿⣯⣿⡽⣿⣿⣿⢯⣟⡿⢀⣿⣿⣿⣿⣿⣧⠐⣸⣿⣿⣷⣿⣿⣆⠹⣯⣿⣻⣿⣿⣿⢀⣿⢿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣿⣿⠘⣯⡿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣧⡈⢿⣳⠘⡄⠻⣿⢾⣽⣟⡿⣿⢯⣿⡇⢸⣿⣿⣿⣿⣿⣿⡀⢾⣿⣿⣿⣿⣿⣿⣆⠹⣾⣷⣻⣿⡿⡇⢸⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣿⣿⡇⢹⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠻⡇⢹⣆⠹⣟⣾⣽⣻⣟⣿⣽⠁⣾⣿⣿⣿⣿⣿⣿⣇⣿⣿⠿⠛⠛⠉⠙⠋ ⠁⢘⣯⣿⣿⣧⠘⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣿⣿⣿⡈⣿⡃⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⠌⣿⣆⠘⣿⣞⡿⣞⡿⡞⢠⣿⣿⣿⣿⣿⡿⠛⠉⠁⢀⣀⣠⣤⣤⣶⣶⣶⡆⢻⣽⣞⡿⣷⠈⣿⣻⣿⣿" +
		"\n⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠘⠁⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠛⠛⢿⣄⢻⣿⣧⠘⢯⣟⡿⣽⠁⣾⣿⣿⣿⣿⣿⡃  ⠘⠛⠿⢿⣻⣟⣯⣽⣻⣵⡀⢿⣯⣟⣿⢀⣿⣽⣿⣿" +
		"\n⣿⣿⣿⣟⣿⣿⣿⣿⣶⣶⡆⢀⣿⣾⣿⣾⣷⣿⣶⠿⠚⠉ ⢀⣤⣿⣷⣿⣿⣷⡈⢿⣻⢃⣼⣿⣿⣿⣿⣻⣿⣿⣿⡶⣦⣤⣄⣀ ⠉⠛⠛⠷⣯⣳⠈⣾⡽⣾⢀⣿⢾⣿⣿" +
		"\n⣿⢿⣿⣿⣻⣿⣿⣿⣿⣿⡿⠐⣿⣿⣿⣿⠿⠋⠁  ⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣌⣥⣾⡿⣿⣿⣷⣿⣿⢿⣷⣿⣿⣟⣾⣽⣳⢯⣟⣶⣦⣤⡾⣟⣦⠘⣿⢾⡁⢺⣿⣿⣿" +
		"\n⣿⣻⣿⣿⡷⣿⣿⣿⣿⣿⡗⣦⠸⡿⠋⠁  ⣠⣴⢿⣿⣽⣻⢽⣾⣟⣷⣿⣟⣿⣿⣿⣳⠿⣵⣧⣼⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣽⣳⣯⣿⣿⣿⣽⢀⢷⣻⠄⠘⣯⣿⣿" +
		"\n⣿⢷⣻⣿⣿⣷⣻⣿⣿⣿⡷⠛⣁⢀⣀⣤⣶⣿⣛⡿⣿⣮⣽⡻⣿⣮⣽⣻⢯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢀⢸⣿⢀⡆⣿⣿⣿" +
		"\n⠸⣟⣯⣿⣿⣷⢿⣽⣿⣿⣷⣿⣷⣆⠹⣿⣶⣯⠿⣿⣶⣟⣻⢿⣷⣽⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣯⣟⢀⡇⢼⣿⣿" +
		"\n⣇⠹⣟⣾⣻⣿⣿⢾⡽⣿⣿⣿⣿⣿⣆⢹⣶⣿⣻⣷⣯⣟⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢀⡿⡇⢸⡇⢸⣿⡇" +
		"\n⣿⣆⠹⣷⡻⣽⣿⣯⢿⣽⣻⣿⣿⣿⣿⣆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⠇⣼⡇⢸⡿⢠" +
		"\n⡙⠾⣆⠹⣿⣦⠛⣿⢯⣷⢿⡽⣿⣿⣿⣿⣆⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠎⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⢀⣿⣾⣣⡿⡇⢸⢃⣾" +
		"\n⣿⣷⡌⢦⠙⣿⣿⣌⠻⣽⢯⣿⣽⣻⣿⣿⣿⣧⠩⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢰⢣⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⢀⢀⢿⣞⣷⢿⡇⠉⣼⣿" +
		"\n⣿⣽⣆⠹⣧⠘⣿⣿⡷⣌⠙⢷⣯⡷⣟⣿⣿⣿⣷⡀⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣈⠃⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢀⣴⡧⢀⠸⣿⡽⣿⢀⣾⣿⣿" +
		"\n⢻⣽⣿⡄⢻⣷⡈⢿⣿⣿⢧⢀⠙⢿⣻⡾⣽⣻⣿⣿⣄⠌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⢁⣰⣾⣟⡿⢀⡄⢿⣟⣿⢀⣿⣿⣿" +
		"\n⡄⢿⣿⣷⢀⠹⣟⣆⠻⣿⣿⣆⢀⣀⠉⠻⣿⡽⣯⣿⣿⣷⣈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢀⣠⠘⣯⣷⣿⡟⢀⢆⠸⣿⡟⢸⣿⣿⣿" +
		"\n⣷⡈⢿⣿⣇⢱⡘⢿⣷⣬⣙⠿⣧⠘⣆⢀⠈⠻⣷⣟⣾⢿⣿⣆⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⡞⢡⣿⢀⣿⣿⣿⠇⡄⢸⡄⢻⡇⣼⣿⣿⣿" +
		"\n⣿⣷⡈⢿⣿⡆⢣⡀⠙⢾⣟⣿⣿⣷⡈⠂⠘⣦⡈⠿⣯⣿⢾⣿⣆⠙⠻⠿⠿⠿⠿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢋⣠⣾⡟⢠⣿⣿⢀⣿⣿⡟⢠⣿⢈⣧⠘⢠⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣄⠻⣿⡄⢳⡄⢆⡙⠾⣽⣿⣿⣆⡀⢹⡷⣄⠙⢿⣿⡾⣿⣆⢀⡀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣀⣠⣴⡿⣯⠏⣠⣿⣿⡏⢸⣿⡿⢁⣿⣿⢀⣿⠆⢸⣿⣿⣿⣿" +
		"\n⣿⣿⣿⣿⣦⡙⣿⣆⢻⡌⢿⣶⢤⣉⣙⣿⣷⡀⠙⠽⠷⠄⠹⣿⣟⣿⣆⢙⣋⣤⣤⣤⣄⣀⢀⢀⢀⢀⣾⣿⣟⡷⣯⡿⢃⣼⣿⣿⣿⠇⣼⡟⣡⣿⣿⣿⢀⡿⢠⠈⣿⣿⣿⡟" +
		"\n⣿⣿⣿⣿⣿⣷⣮⣿⣿⣿⡌⠁⢤⣤⣤⣤⣬⣭⣴⣶⣶⣶⣆⠈⢻⣿⣿⣆⢻⣿⣿⣿⣿⣿⣿⣷⣶⣤⣌⣉⡘⠛⠻⠶⣿⣿⣿⣿⡟⣰⣫⣴⣿⣿⣿⣿⠄⣷⣿⠆⢻",
		"\n   ⢀⣀⣀⣀" +
		"\n⠀⠀⠀⠰⡿⠿⠛⠛⠻⠿⣷" +
		"\n⠀⠀⠀⠀⠀⠀⣀⣄⡀⠀⠀⠀⠀⢀⣀⣀⣤⣄⣀⡀" +
		"\n⠀⠀⠀⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⠛⠛⣿⣿⣿⡛⠿⠷" +
		"\n⠀⠀⠀⠀⠀⠘⠿⠿⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⠇" +
		"\n⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁" +
		"\n" +
		"\n⠀⠀⠀⠀⣿⣷⣄⠀⢶⣶⣷⣶⣶⣤⣀" +
		"\n⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠈⠙⠻⠗" +
		"\n⠀⠀⠀⣰⣿⣿⣿⠀⠀⠀⠀⢀⣀⣠⣤⣴⣶⡄" +
		"\n⠀⣠⣾⣿⣿⣿⣥⣶⣶⣿⣿⣿⣿⣿⠿⠿⠛⠃" +
		"\n⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄" +
		"\n⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁" +
		"\n⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁" +
		"\n⠀⠀⠛⢿⣿⣿⣿⣿⣿⣿⡿⠟",
		"\n░░░░░░▄▄▄░░██▄░░░" +
		"\n░░░░░▐▀█▀▌░▐░░▀█▄░░░" +
		"\n░░░░░▐█▄█▌░▌░░░░▀█▄░░" +
		"\n░░░░░░▀▄█▄▀░▄▄▄▄▄▀▀░░" +
		"\n░░░░▄▄▄██▀▀▀▀░░░░░░░" +
		"\n░░░█▀▄▄▄█░▀▀░░" +
		"\n░░░█░▄▄▄▐▌▀▀▀░" +
		"\n░░░▐░░▄▄░█░▀▀ ░░" +
		"\n░░░░▌░▄░▀█▀░▀ ░░" +
		"\n░▄░░▐░░▄▄▐▌▄▄░░░" +
		"\n░░▀▄█▄░▀███▀█░▄░" +
		"\n░░░░▀▀▀▀█▄▀▄▀▐▄░░" +
		"\n░░░░░░▐▀░▀░▀░▐▌░░" +
		"\n░░░░░░█░░░░░░░░█░░",
		"\n║\\" +
		"\n║▒\\" +
		"\n║▒▒\\" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n║░▒║" +
		"\n▓▓▓▓" +
		"\n[█▓]" +
		"\n[█▓]" +
		"\n[█▓]" +
		"\n[█▓]"];

//Randomizer -- returns random value in an array
function rdm(array) {
	return array[Math.floor(Math.random() * (array.length))];
}

//Error handlers
bot.on("error", (e) => console.error(e));
bot.on("warn", (e) => console.warn(e));

//True or False -- gives two options
function tf(option1, option2) {
	let reply = (Math.random() >= 0.5)
		? option1 //option 1
		: option2; //option 2
	return reply;
}

//text converter -- takes two arrays and converts text from the first into the second
class TextConverter {
	//both arguments must be arrays
	constructor(startText, endText) {
		this.startText = startText;
		this.endText = endText;
	}
	//convert text
	c(text) {
		var l = this.startText.length;
		for (var i = 0; i < l; i++) {
			text = text.replace(this.startText[i], this.endText[i]); //replaces text
		}
		return text;
	}
	//deconvert text
	undo(text) {
		var l = this.startText.length;
		for (var i = l - 1; i >= 0; i--) {
			text = text.replace(this.endText[i], this.startText[i]); //replaces text
		}
		return text;
	}
}

//btext -- converts to b emoji
const btext = new TextConverter([/b/gi], ["🅱"]);

//vapor -- converts text to vaporwave
const vapor = new TextConverter(
	[/a/gi, /b/gi, /c/gi, /d/gi, /e/gi, /f/gi, /g/gi, /h/gi, /i/gi, /j/gi, /k/gi, /l/gi, /m/gi, /n/gi, /o/gi, /p/gi, /q/gi, /r/gi, /s/gi, /t/gi, /u/gi, /v/gi, /w/gi, /x/gi, /y/gi, /z/gi, /1/g, /2/g, /3/g, /4/g, /5/g, /6/g, /7/g, /8/g, /9/g, /0/g],
	["ａ", "ｂ", "ｃ", "ｄ", "ｅ", "ｆ", "ｇ", "ｈ", "ｉ", "ｊ", "ｋ", "ｌ", "ｍ", "ｎ", "ｏ", "ｐ", "ｑ", "ｒ", "ｓ", "ｔ", "ｕ", "ｖ", "ｗ", "ｘ", "ｙ", "ｚ", "１", "２", "３", "４", "５", "６", "７", "８", "９", "０"]);

//bubble -- converts text to bubbled text
const bubble = new TextConverter(
	[/a/gi, /b/gi, /c/gi, /d/gi, /e/gi, /f/gi, /g/gi, /h/gi, /i/gi, /j/gi, /k/gi, /l/gi, /m/gi, /n/gi, /o/gi, /p/gi, /q/gi, /r/gi, /s/gi, /t/gi, /u/gi, /v/gi, /w/gi, /x/gi, /y/gi, /z/gi],
	["ⓐ", "ⓑ", "ⓒ", "ⓓ", "ⓔ", "ⓕ", "ⓖ", "ⓗ", "ⓘ", "ⓙ", "ⓚ", "ⓛ", "ⓜ", "ⓝ", "ⓞ", "ⓟ", "ⓠ", "ⓡ", "ⓢ", "ⓣ", "ⓤ", "ⓥ", "ⓦ", "ⓧ", "ⓨ", "ⓩ"]);

//fraktur -- converts text to fraktur
const fraktur = new TextConverter(
	[/ä/g, /ö/g, /ü/g, /ß/g, /Ä/g, /Ö/g, /Ü/g, /ẞ/g, /a/g, /b/g, /c/g, /d/g, /e/g, /f/g, /g/g, /h/g, /i/g, /j/g, /k/g, /l/g, /m/g, /n/g, /o/g, /p/g, /q/g, /r/g, /s/g, /t/g, /u/g, /v/g, /w/g, /x/g, /y/g, /z/g, /A/g, /B/g, /C/g, /D/g, /E/g, /F/g, /G/g, /H/g, /I/g, /J/g, /K/g, /L/g, /M/g, /N/g, /O/g, /P/g, /Q/g, /R/g, /S/g, /T/g, /U/g, /V/g, /W/g, /X/g, /Y/g, /Z/g],
	["ae", "oe", "ue", "ss", "Ae", "Oe", "Ue", "SS", "𝔞", "𝔟", "𝔠", "𝔡", "𝔢", "𝔣", "𝔤", "𝔥", "𝔦", "𝔧", "𝔨", "𝔩", "𝔪", "𝔫", "𝔬", "𝔭", "𝔮", "𝔯", "𝔰", "𝔱", "𝔲", "𝔳", "𝔴", "𝔵", "𝔶", "𝔷", "𝔄", "𝔅", "ℭ", "𝔇", "𝔈", "𝔉", "𝔊", "ℌ", "ℑ", "𝔍", "𝔎", "𝔏", "𝔐", "𝔑", "𝔒", "𝔓", "𝔔", "ℜ", "𝔖", "𝔗", "𝔘", "𝔙", "𝔚", "𝔛", "𝔜", "ℨ"]);

//add -- merges arguments into one
function add(start, msg) {
	return msg.content.split(" ").slice(start).join(" ")
		.replace(/@everyone/g, "@\u200Beveryone")
		.replace(/@here/g, "@\u200Bhere");
}

//Login processes -- Things to do when a login is successful
bot.on('ready', () => {
	console.log(`Login was successful m8\nServercount: ${bot.guilds.size}\nServerlist: ${bot.guilds.array()}`); //login message
	bot.user.setActivity(`${data.pre}help | ${bot.guilds.array().length} Servers Weegeefied`, { type: "WATCHING" }); //status message

	//logs servercount -- not necessary for standard use
	request.post(`https://discordbots.org/api/bots/${bot.user.id}/stats`)
		.set('Authorization', data.botlist[0])
		.send({ server_count: bot.guilds.size })
		.catch(err => console.error("error logging to discordbots.org"));
	request.post(`https://bots.discord.pw/api/bots/${bot.user.id}/stats`)
		.set('Authorization', data.botlist[1])
		.send({ server_count: bot.guilds.size })
		.catch(err => console.error("error logging to bots.discord.pw"));
});

//guild add response -- logs guild being joined
bot.on("guildCreate", guild => {
	var date = new Date(); //current date
	console.log(`Bot joined ${guild.name} [${date}]`);
});

//guild delete response -- logs guild being left
bot.on("guildDelete", guild => {
	var date = new Date(); //current date
	console.log(`Bot left ${guild.name} [${date}]`);
});

//welcome data -- sends welcome messages for users
bot.on("guildMemberAdd", member => {
	var welcomeGuild = member.guild;
	if (!config.welcome[welcomeGuild.id]) return;

	var date = new Date(), //current date
		serverLang = config.lang[welcomeGuild.id] || "en"; //server lang

	if (serverLang == "en") {
		r = require("./en.json"); //uses replies from en.json
	} else if (serverLang == "de") {
		r = require("./de.json"); //nutzt Antworten von de.json
	}

	//sends welcome message
	welcomeGuild.channels.get(config.welcome[welcomeGuild.id]).send(`${r.welcome} **${welcomeGuild.name}**, ${member.user}!`)
		.then(console.log(`${member.user.username} joined ${member.guild.name} [${date}] [${serverLang}]`)) //logbook
		.catch(console.error);
});

//Login -- Logs code into Weegeebot (please no touchy)
bot.login(data.key);

//Message Response -- Responds to messages and sets commands or variables
bot.on('message', msg => {

	if (msg.content == data.reset) process.exit(1)	//restart system
		.then(console.log(`Bot restarted by ${msg.author.username}`));

	if (msg.author.bot || msg.channel.type == "dm") return; //ignores every message without a prefix and messages sent from bots

	var arg = msg.content.split(" "), //creates argument values; i.e. arg[1], arg[2], etc.
		date = new Date(), //current date
		serverLang = config.lang[msg.guild.id] || "en",
		serverPrefix = config.pre[msg.guild.id] || data.pre, //server prefix
		com = arg[0].toLowerCase().slice(serverPrefix.length); //command value

	if (!msg.content.startsWith(serverPrefix)) return;

	//-------ENGLISH-BOT--------
	if (serverLang == "en") {
		var r = require("./en.json"); //uses responses from en.json
		//help (probably the most important command there is)
		if (com == "help") {
			msg.author.send(`*Greetings, ${msg.author.username}. I am Weegeebot, your helpful Discord Bot. Here are my commands:*`);
			//fun
			msg.author.send("```ini\nFun = General commands" +
				"\nascii                  # posts random ascii art" +
				"\nlenny                  # adds a nice lenny ( ͡° ͜ʖ ͡°)" +
				"\nroast                  # roasts you as bad as never before seen" +
				"\npengu                  # posts a cute pengu! 🐧" +
				"\ncoin                   # flips a *totally* fair coin" +
				"\nweegee                 # posts a random Weegee meme" +
				"\ncancer                 # infects the channel with toxic, cringy pictures and videos" +
				"\nnuke [place]           # throws a real bomb at the given place!" +
				"\nscp [number]           # posts an SCP entry! (001-4000)" +
				"\ndice [number]          # rolls a fair 6-sided-die (or with more sides if you wish)" +
				"\nask [question]         # asks a yes/no question" +
				"\navatar [@user]         # posts the avatar of that user, or yourself if no user is mentioned" +
				"\nfraktur [text]         # makes your text into 𝔣𝔯𝔞𝔨𝔱𝔲𝔯" +
				"\nbtext [message]        # changes all instances of 'b' to the 🅱 emote" +
				"\neflag [country]        # displays the flag of a country with emojis" +
				"\nvapor [message]        # makes your text into a ｖａｐｏｒｔｅｘｔ" +
				"\nbattle [army1] [army2] # simulates a battle between two armies```");
			//admin help
			msg.author.send("```ini\nAdmin = You need the correct role to use them" +
				"\nwelcome                # decides a channel where the welcome messages shall be posted" +
				"\nlang  [de/en]          # sets the language, currently only for German or English" +
				"\nclear [number]         # deletes messages" +
				"\nprefix [prefix]        # changes the bot prefix" +
				"\nwarn  [@user] [reason] # warns that user, sending both you and them a message" +
				"\nban   [@user] [reason] # unleashes a banhammer upon that user, sending both you and them a message" +
				"\nkick  [@user] [reason] # kicks the mentoned user, but he can return```");
			//nsfw
			msg.author.send("```ini\nNSFW = You must be in a 'NSFW' channel to use them" +
				"\necchi  # posts an ecchi picture from Gelbooru" +
				"\nass    # results in a ass pic" +
				"\nboobs  # posts a random boobs picture```");
			//utility help
			msg.author.send("```ini\nUtility = The very useful commands, without which you cannot live" +
				"\ninfo          # displays infos about the bot" +
				"\nsupport          # links to ways to get Weegeebot Support" +
				"\ntest             # tests whether the bot is active" +
				"\ndate             # posts the date and time" +
				"\ninvite           # gets you the bot invite link" +
				"\ndonate           # posts a link to the Patreon page" +
				"\nserver           # posts the serverinfo of the current server" +
				"\nwhois [@user]    # fetches infos for the mentioned user" +
				"\ndefine [word]    # searches up the definition of a word using The Urban Dictonary" +
				"\nsay [message]    # gets Weegeebot to say something" +
				"\npoll [question]  # creates a poll with two options (Yes or No)" +
				"\ncalc [operation] # calculates using numbers and operations 🔢```" +
				"\nNow pick a command, or else you will die! https://discord.gg/HudQcWh");
			msg.channel.send("The list of commands was sent to you privately via DMs! ✅");
		}
	}

	//-------DEUTSCHER-BOT------
	else if (serverLang == "de") {
		var r = require("./de.json"); //nutzt Antworten von de.json
		//hilfe (wohl der wichtigste Befehl)
		if (com == "help" || com == "hilfe") {
			msg.author.send(`*Hallo, ${msg.author.username}. Ich bin Herr Weegee, dein treuer Discordbot. Ich habe folgende Befehle:*`);
			//Hilfe für die Spaßbefehle
			msg.author.send("```ini\nSpassbefehle = Die allgemeinen Befehle" +
				"\nascii                   # postet ein zufälliges ASCII-Bild" +
				"\nmünze                   # wirft eine *total* faire Münze" +
				"\npengu                   # postet einen süßen Penguin! 🐧" +
				"\nlenny                   # ergibt einen coolen Lenny ( ͡° ͜ʖ ͡°)" +
				"\nspott                   # drischt dir die Kalauer um die Ohren, dass die Fetzen nur so fliegen" +
				"\npeinlichkeit            # infiziert den Kanal mit peinlichen Bildern/Videos" +
				"\nweegee                  # postet ein zufälliges Weegee-Mem" +
				"\nscp [Nummer]            # postet einen SCP-Eintrag! (001-4000)" +
				"\nfrage [Frage]           # fragt mich eine Satzfrage" +
				"\neflagge [Land]          # postet eine Nationalflagge aus Emojis" +
				"\nfraktur [Text]          # verwandelt deinen Text in 𝔣𝔯𝔞𝔨𝔱𝔲𝔯" +
				"\nwürfel  [Seiten]        # lässt einen fairen 6-seitigen Würfel rollen. (kann auch mit mehr Seiten verwendet werden)" +
				"\natomisiere [Ort]        # wirft eine echte Atombombe auf den gegebenen Ort" +
				"\nvapor [Nachricht]       # macht deine Nachricht zum ｖａｐｏｒｔｅｘｔ" +
				"\nbtext [Nachricht]       # macht aus allen Bs ein 🅱" +
				"\navatar [@Nutzer]        # postet das Profilbild des erwähnten Benutzers, oder deines, wenn niemand erwähnt wird" +
				"\nkampf [Armee1] [Armee2] # simuliert einen Kampf zwischen 2 Armeen```");
			//Adminhilfe
			msg.author.send("```ini\nAdminbefehle = Man braucht Admin-Berechtigungen, um sie zu verwenden" +
				"\nwillkommen         # legt einen Kanal fest, wo die Willkommens-Nachrichten gepostet werden sollen" +
				"\nsprache [de/en]        # wechselt die Sprache zwischen Deutsch und Englisch" +
				"\nlösche [Nummer]        # löscht Nachrichten" +
				"\nprefix [Präfix]        # ändert das Bot-Präfix" +
				"\nwarn [@Nutzer] [Grund] # warnt den erwähnten Benutzer, indem dir und ihm eine PN geschickt wird" +
				"\nbann [@Nutzer] [Grund] # bannt den Benutzer, und schickt ihm und dir eine Nachricht" +
				"\nkick [@Nutzer] [Grund] # kickt den Benutzer; er kann aber sofort zurückkommen```");
			//NSFW-Hilfe
			msg.author.send("```ini\nNSFW-Befehle = Man muss in einem 'NSFW'-Kanal sein, um sie zu verwenden" +
				"\necchi  # postet ein Ecchi-Bild von Gelbooru" +
				"\narsch  # ergibt ein Bild mit dem weiblichen Arsch" +
				"\ntitten # postet ein Bild mit Titten!```");
			//Utility-Hilfe
			msg.author.send("```ini\nUtility-Befehle = die ach so nützlichen Befehle, ohne sie kann man einfach nicht leben!" +
				"\ninfo            # ergibt die Botinfos" +
				"\nsupport            # zeigt dir Weegeebots Server und Projektseite an" +
				"\ntest               # testet, ob Weegeebot aktiv ist oder nicht" +
				"\ndatum              # ergibt das aktuelle Datum und die aktuelle Uhrzeit" +
				"\nspende             # postet einen Link zur Patreon-Seite" +
				"\neinladung          # zeigt dir den Bot-Einladungslink an" +
				"\nserver             # postet Informationen für den aktuellen Server" +
				"\nsag [Nachricht]    # zwingt Weegee, deine Nachricht zu sagen" +
				"\numfrage [Frage]    # erzeugt eine Umfrage mit zwei Optionen (Ja oder Nein)" +
				"\nwerist [@Nutzer]   # ergibt Infos für den erwähnten Benutzer" +
				"\ndefiniere [Wort]   # findet die Definition deines Wortes mit der Sprachnudel" +
				"\nrechne [Operation] # rechnet mit Zahlen und Operationen 🔢```" +
				"\nWähle jetzt einen Befehl aus, sonst wirst du sterben! https://discord.gg/HudQcWh");
			msg.channel.send("Die Befehlsliste wurde privat durch eine PN geschickt! ✅");
		}
	}

	//all the commands
	switch (com) {
		//test (to see if bot is online)
		case "test":
			msg.channel.send(r.test + rdm(r.quote));
			break;
		//scp command
		case "scp":
			if (arg.length != 2 || arg[1] > 4000 || arg[1] < 0 || arg[1].length < 3) {
				msg.channel.send(r.scpError);
			} else msg.channel.send(r.scp + arg[1]);
			break;
		//support (links to Weegeebot server)
		case "support":
			msg.channel.send(`${r.server}\n${r.project}`);
			break;
		//ASCII
		case "ascii":
			msg.channel.send("```fix\n" + rdm(ascii) + "```");
			break;
		//pengu
		case "pengu":
			msg.channel.send(rdm(pengu));
			break;
		//Weegee
		case "weegee":
			msg.channel.send(rdm(weegee));
			break;
		//invite (posts invite link)
		case r.invite:
			msg.channel.send("https://discordapp.com/oauth2/authorize?client_id=239261914918682624&scope=bot&permissions=0");
			break;
		//Patreon
		case r.donate:
			msg.channel.send("Patreon: https://www.patreon.com/Weegeebot");
			break;
		//calc - currently pretty basic
		case r.calc:
			if (arg[1] != 'ln' && arg.length != 4 || arg[1] == r.help) {
				msg.channel.send(r.calcHelp[0] +
					"```" +
					"\nx + y - " + r.calcHelp[1] +
					"\nx - y - " + r.calcHelp[2] +
					"\nx * y - " + r.calcHelp[3] +
					"\nx / y - " + r.calcHelp[4] +
					"\nx ^ y - " + r.calcHelp[5] +
					"\nx root y - " + r.calcHelp[6] +
					"\nln x - " + r.calcHelp[7] +
					"```\n" +
					r.calcHelp[8]); //help command
			} else {
				if (arg[1] == 'ln') {
					var a = parseFloat(arg[2]);
					msg.channel.send(rdm(r.quote) + `\nln ${a} = ${parseFloat(Math.log(a))}`); //Log
				} else {
					var a = parseFloat(arg[1]);
					var b = parseFloat(arg[3]);
					//Operator plucker
					switch (arg[2]) {
						case "+":
							msg.channel.send(rdm(r.quote) + `\n${a} + ${b} = ${a + b}`); //Addition
							break;
						case "-":
							msg.channel.send(rdm(r.quote) + `\n${a} - ${b} = ${a - b}`); //Subtraction
							break;
						case "*":
							msg.channel.send(rdm(r.quote) + `\n${a} * ${b} = ${a * b}`); //Multiplication
							break;
						case "/":
							msg.channel.send(rdm(r.quote) + `\n${a} / ${b} = ${a / b}`); //Division
							break;
						case "^":
							msg.channel.send(rdm(r.quote) + `\n${a} ^ ${b} = ${a ** b}`); //Power
							break;
						case "root":
							if (a == 2) msg.channel.send(rdm(r.quote) + `\n√${b} = ${b ** (1 / a)}`); //square Root
							else msg.channel.send(rdm(r.quote) + `\n${a} √ ${b} = ${b ** (1 / a)}`);
							break;
					}
				}
			}
			break;
		//eflag (flags from emojis)
		case r.emoji:
			//sets flag number if user has a particular country in mind
			if (arg.length != 1) {
				switch (arg[1].toLowerCase()) {
					case r.finland: msg.channel.send(flag[0]);
						break;
					case r.usa: msg.channel.send(flag[1]);
						break;
					case r.france: msg.channel.send(flag[2]);
						break;
					case r.germany: msg.channel.send(flag[3]);
						break;
					case r.belgium: msg.channel.send(flag[4]);
						break;
					case r.weegee: msg.channel.send(flag[5]);
						break;
					case r.lowlandia: msg.channel.send(flag[6]);
						break;
					case r.netherlands: msg.channel.send(flag[7]);
						break;
					case r.russia: msg.channel.send(flag[8]);
						break;
					case r.china: msg.channel.send(flag[9]);
						break;
					case r.switzerland: msg.channel.send(flag[10]);
						break;
					case r.canada: msg.channel.send(flag[11]);
						break;
					case r.romania: msg.channel.send(flag[12]);
						break;
					case r.austria: msg.channel.send(flag[13]);
						break;
					case r.denmark: msg.channel.send(flag[14]);
						break;
					case r.sweden: msg.channel.send(flag[15]);
						break;
					case r.poland: msg.channel.send(flag[16]);
						break;
					case r.japan: msg.channel.send(flag[17]);
						break;
					case r.hungary: msg.channel.send(flag[18]);
						break;
					case r.estonia: msg.channel.send(flag[19]);
						break;
					case r.ukraine: msg.channel.send(flag[20]);
						break;
					case r.spain: msg.channel.send(flag[21]);
						break;
					case r.england: msg.channel.send(flag[22]);
						break;
					case r.italy: msg.channel.send(flag[23]);
						break;
					default:
						msg.channel.send(r.emojiHelp);
						msg.channel.send(rdm(flag));
				}
			} else msg.channel.send(rdm(flag));
			break;
		//define
		case r.define:
			var query = msg.content.split(" ").slice(1).join("+");
			msg.channel.send(r.dictionary + query);
			break;
		//battle (simulated battles between two armies)
		case r.battle:
			if (arg.length != 3) msg.channel.send(r.battleError);
			else if (arg[1] <= 0 || arg[2] <= 0) msg.channel.send(r.battleError1); //if any army lacks soldiers
			else {
				var str1 = parseInt(arg[1]) ** 2, //strength of army 1
					str2 = parseInt(arg[2]) ** 2; //strength of army 2

				if (Math.floor(Math.random() * (str1 + str2)) <= parseInt(str1)) msg.channel.send(r.victory1);
				else msg.channel.send(r.victory2);
			}
			break;
		//cancer
		case r.cancer:
			msg.channel.send(rdm(cancer));
			break;
		//ecchi (anime titties)
		case "ecchi":
			if (msg.channel.nsfw) {
				request.get("https://gelbooru.com/index.php?page=dapi&s=post&q=index&json=1&limit=100&tags=boobs%20ass")
					.then(r => msg.channel.send(r.body[Math.floor(Math.random() * 100)].file_url));
			} else {
				msg.channel.send(r.nsfw);
			}
			break;
		//ass
		case r.ass:
			if (msg.channel.nsfw) {
				msg.channel.send(rdm(ass));
			} else {
				msg.channel.send(r.nsfw);
			}
			break;
		//boobs (titties!!!)
		case r.boobs:
			if (msg.channel.nsfw) {
				msg.channel.send(rdm(boobs));
			} else {
				msg.channel.send(r.nsfw);
			}
			break;
		//date (current date & time)
		case r.date:
			msg.channel.send(r.date1 + date);
			break;
		//whois (results in user infos)
		case r.whois:
			var whoIsUser = msg.mentions.users.first() || msg.author;
			var nickname = msg.guild.member(whoIsUser).nickname || r.none;
			msg.channel.send("```md" +
				`\n${r.whoisEntry} ${whoIsUser.username}:` +
				"\n---------------" +
				`\n< ${r.username} > \n ${whoIsUser.tag}` +
				`\n< ${r.nickname} > \n ${nickname}` +
				`\n< ${r.bot} 🤖> \n ${whoIsUser.bot}` +
				`\n< ${r.status} > \n ${whoIsUser.presence.status}` +
				`\n< ${r.joindate} 📅> \n ${whoIsUser.createdAt}` +
				`\n< ${r.userID} > \n ${whoIsUser.id}` +
				"```");
			break;
		//serverinfo (results in server infos)
		case r.serverinfo:
			msg.channel.send("```md" +
				`\n${r.serverEntry} ${msg.guild.name}:` +
				"\n---------------" +
				`\n< ${r.membercount} 🗣> \n ${msg.guild.memberCount}` +
				`\n< ${r.serverage} 📅> \n ${msg.guild.createdAt}` +
				`\n< ${r.owner} > \n ${msg.guild.owner.user.tag}` +
				`\n< ${r.region} 🗺️> \n ${msg.guild.region}` +
				`\n< ${r.lang} 🗺> \n ${serverLang}` +
				`\n< ${r.serverID} > \n ${msg.guild.id}` +
				"```");
			break;
		//botinfo (shows bot infos)
		case "info":
			msg.channel.send("```md" +
				"\nWeegeebot" +
				"\n---------------" +
				`\n< ${r.botinfo[0]} 📝> \n ${r.botinfo[1]}` +
				`\n< ${r.botinfo[2]} > \n HoubkneghteS, Fniux, JamesTheDemSoc` +
				`\n< ${r.botinfo[3]} > \n Bramble, Leaf, Retro, Kazuo` +
				`\n< ${r.botinfo[4]} > \n ${bot.guilds.size} ${r.botinfo[5]}` +
				`\n< ${r.botinfo[6]} ⏲> \n ${Math.floor(bot.ping)} ms` +
				"```");
			break;
		//nuke (finally well developed !!1!111!)
		case r.nuke:
			//allows nuking of users
			if (msg.mentions.users.first() != null) {
				msg.channel.send(tf(
					msg.mentions.users.first().username + r.userNuke[0] + rdm(nuke),
					msg.mentions.users.first().username + r.userNuke[1]
				));
				//nothing
			} else if (arg.length < 2) msg.channel.send(r.nukeError);
			else {
				switch (add(1, msg).toLowerCase()) {
					//nuke help command
					case r.help:
						msg.channel.send(r.nukeHelp);
						break;
					case "@\u200Beveryone":
					case "@\u200Bhere":
					case r.all:
						msg.channel.send(r.nukeEveryone);
						msg.channel.send("http://d8st7idcnjoas.cloudfront.net/galfull/JC-450.jpg");
						break;
					case r.usa:
						msg.channel.send(r.nukeUSA);
						msg.channel.send("http://www.slate.com/content/dam/slate/articles/news_and_politics/politics/2016/12/161229_POL_Sad-Trump.jpg.CROP.promo-xlarge2.jpg");
						break;
					case r.russia:
						msg.channel.send(r.nukeRussia);
						msg.channel.send("http://www.cubanet.org/wp-content/uploads/2015/06/putin-sad.jpg");
						break;
					case r.germany:
						msg.channel.send(r.nukeGermany);
						msg.channel.send("http://www.newstatesman.com/sites/default/files/styles/nodeimage/public/blogs_2015/06/gettyimages-145479927.jpg?itok=RzDLUzhK");
						break;
					case "cafe weegee":
						msg.channel.send(r.nukeCafe);
						msg.channel.send("https://cdn.discordapp.com/attachments/383327572206944256/383327716146937867/Cafe_Weegee.png");
						break;
					case "weegee":
					case "weegeebot":
						msg.channel.send(r.nukeWeegee);
						break;
					case r.me:
						msg.channel.send(r.nukeMe);
						break;
					default:
						msg.channel.send(add(1, msg) + r.nuking);
						msg.channel.send(rdm(nuke));
				}
			}
			break;
		//roast (über-funny jokes)
		case r.roast1:
			msg.channel.send(rdm(r.roast));
			break;
		//avatar
		case r.avatar:
			if (!msg.mentions.users.first() && arg.length > 1) { //checks if no user is mentioned
				msg.channel.send(r.avatarError);
			} else {
				var userAvatar = msg.mentions.users.first() || msg.author;
				var url = userAvatar.avatarURL.split("?");
				msg.channel.send(url[0]);
			}
			break;
		//ask
		case r.ask:
			if (arg.length < 2) msg.channel.send(r.askError);
			else msg.channel.send(tf(r.y, r.n));
			break;
		//coinflip (same infrastructure as the &ask command, just different name and response)
		case r.coin:
			msg.channel.send(tf(r.heads, r.tails));
			break;
		//dice
		case r.dice:
			var maxSides = arg[1] || 6; //default value is 6
			var dice = Math.floor(Math.random() * (maxSides)) + 1; //generates dice value
			if (maxSides < 0) {
				if (dice > maxSides) msg.channel.send(`${r.diceBad} ${dice}! 🎲`);
				else msg.channel.send(`${r.diceGood} ${dice}! 🎲`);
			} else {
				if (dice < maxSides) msg.channel.send(`${r.diceBad} ${dice}! 🎲`);
				else msg.channel.send(`${r.diceGood} ${dice}! 🎲`);
			}
			break;
		//lenny ( ͡° ͜ʖ ͡°)
		case "lenny":
			msg.delete();
			msg.channel.send("( ͡° ͜ʖ ͡°)");
			break;
		//lennygang ( ͡° ͜ʖ ͡°)
		case "lennygang":
			msg.delete();
			msg.channel.send("( ͡° ͜ʖ ͡°( ͡° ͜ʖ ͡°( ͡° ͜ʖ ͡°) ͡° ͜ʖ ͡°) ͡° ͜ʖ ͡°)");
			break;
		//b command
		case "btext":
			if (arg.length < 2) msg.channel.send(btext.c(r.msgError));
			else {
				msg.delete();
				msg.channel.send(btext.c(add(1, msg)));
			}
			break;
		//fraktur!!
		case "fraktur":
			if (arg.length < 2) msg.channel.send(fraktur.c(r.msgError));
			else {
				msg.delete();
				msg.channel.send(fraktur.c(add(1, msg)));
			}
			break;
		//vapor
		case "vapor":
			if (arg.length < 2) msg.channel.send(vapor.c(r.msgError));
			else {
				msg.delete();
				msg.channel.send(vapor.c(add(1, msg)));
			}
			break;
		//bubble
		case r.bubble:
			if (arg.length < 2) msg.channel.send(bubble.c(r.msgError));
			else {
				msg.delete();
				msg.channel.send(bubble.c(add(1, msg)));
			}
			break;
		//say (says what you say)
		case r.say:
			if (arg.length < 2) msg.channel.send(r.msgError);
			else {
				msg.delete();
				msg.channel.send(add(1, msg));
			}
			break;
		//poll (democracy fuck yeah!)
		case r.poll:
			if (arg.length < 2) msg.channel.send(r.msgError);
			else {
				msg.delete();
				msg.channel.send(`${r.poll1}: ${add(1, msg)}`).then((m) => {
					m.react("👍");
					m.react("👎");
				});
			}
			break;

		//-------------ADMIN-COMMANDS--------------

		//clear (deletes set amt. of messages)
		case r.clear:
			if (msg.member.hasPermission("MANAGE_MESSAGES")) {
				if (arg[1] > 100) msg.channel.send(r.clearError);
				else {
					var msgs = parseInt(arg[1]) || 2; //determines msgs with default of 2

					msg.delete();
					msg.channel.fetchMessages({ limit: msgs }).then(messages => msg.channel.bulkDelete(messages)) //deletes messages
						.then(msg.channel.send(`${msgs}${r.clear1}`));
				}
			} else msg.channel.send(r.perm);
			break;
		//banhammer!
		case r.ban:
			if (msg.member.hasPermission("BAN_MEMBERS")) {
				if (arg.length < 2 || msg.guild.member(msg.mentions.users.first()) == null) msg.channel.send(r.banError);
				else {
					msg.mentions.users.first().send(r.ban1 + msg.author.username + r.reason + add(2, msg)); //messages bannee
					msg.author.send(r.ban2 + msg.mentions.users.first() + r.reason + add(2, msg)); //messages banner
					msg.guild.member(msg.mentions.users.first()).ban();
				}
			} else msg.channel.send(r.perm);
			break;
		//kick (kicks user from server with no restriction to return)
		case r.kick:
			if (msg.member.hasPermission("KICK_MEMBERS")) {
				if (arg.length < 2 || msg.guild.member(msg.mentions.users.first()) == null) msg.channel.send(r.kickError);
				else {
					msg.mentions.users.first().send(r.kick1 + msg.author.username + r.reason + add(2, msg)); //messages kickee
					msg.author.send(r.kick2 + msg.mentions.users.first() + r.reason + add(2, msg)); //messages kicker
					msg.guild.member(msg.mentions.users.first()).kick();
				}
			} else msg.channel.send(r.perm);
			break;
		//warn (warns users, sending message both to warnee and warner)
		case r.warn:
			if (msg.member.hasPermission("KICK_MEMBERS")) {
				if (arg.length < 2 || msg.guild.member(msg.mentions.users.first()) == null) msg.channel.send(r.warnError);
				else {
					msg.mentions.users.first().send(r.warn1 + msg.author.username + r.reason + add(2, msg)); //messages warnee
					msg.author.send(r.warn2 + msg.mentions.users.first() + r.reason + add(2, msg)); //messages warner
				}
			} else msg.channel.send(r.perm);
			break;
		//lang (sets language)
		case "lang":
		case "sprache":
			if (msg.member.hasPermission("ADMINISTRATOR")) {
				if (!arg[1]) return; //ignores messages without an argument
				switch (arg[1].toLowerCase()) {
					case "de":
						config.lang[msg.guild.id] = "de";
						msg.channel.send("Weegeebot spricht jetzt Deutsch!");
						break;
					case "en":
						config.lang[msg.guild.id] = "en";
						msg.channel.send("Weegeebot now speaks English!");
						break;
					default:
						msg.channel.send("``en`` (English), ``de`` (Deutsch)");
				}
				//saves lang data
				fs.writeFile("./config.json", JSON.stringify(config), (err) => {
					if (err) console.error(err)
				});
			} else msg.channel.send(r.perm);
			break;
		case "prefix":
			if (msg.member.hasPermission("ADMINISTRATOR")) {
				if (!arg[1] || arg[1].length > 3) msg.channel.send(r.preError);
				else {
					var newPre = arg[1].replace(/"/g, "\"");
					config.pre[msg.guild.id] = newPre;
					msg.channel.send(r.preChange + newPre + "``");

					//saves prefix data
					fs.writeFile("./config.json", JSON.stringify(config), (err) => {
						if (err) console.error(err)
					});
				}
			} else msg.channel.send(r.perm);
			break;
		case r.welcomeName:
			if (msg.member.hasPermission("ADMINISTRATOR")) {
				if (!welcome[msg.guild.id]) {
					config.welcome[msg.guild.id] = msg.channel.id;
					msg.channel.send(r.welcomeSet);
				} else {
					delete welcome[msg.guild.id];
					msg.channel.send(r.welcomeReset);
				}
				//saves welcome data
				fs.writeFile("./config.json", JSON.stringify(config), (err) => {
					if (err) console.error(err)
				});
			} else msg.channel.send(r.perm);
			break;
	}
	console.log(`${com} - ${msg.author.username} [${date}] [${serverLang}]`); //logs commands
});