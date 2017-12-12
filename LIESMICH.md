# Weegeebot
Weegeebot ist ein vorwiegend für kleine Server vorgesehener quelloffener Discord-Bot, der durch gemeinsame Zusammenarbeit entstanden ist. Die Befehle sind benutzerdefiniert und der Bot ist komplett offen für Veränderung von den Nutzern.

**Sonstiges:**

    Das Verwenden und Betreiben dieses Bots erfordert ein minimales, aber vorhandenes Wissen über Javascript, die Discord API, Nodemon und Node.js. Brauchst du weiterführende Unterstützung oder Beratung? Siehe hierfür diesen Discord-Server. Beachte jedoch, dass wir nur eine kleine Gruppe sind und andere Prioritäten im Leben haben, weshalb wir nicht immer schnellstmöglich reagieren können und es auch ein Stück weit respektvoll ist, zunächst anderweitig nach Lösungen für ein Problem zu suchen.

    Die meisten dieser Befehle können völlig nutzlos sein, da sie entweder persönliche Gebrauchsfülle oder Witze sind. In diesem Fall kannst du deine eigenen Befehle erstellen, um diejenigen zu ersetzen, die dir nutzlos erscheinen. Dies erfordert schon fortgeschrittenere Javascript-Fähigkeiten.

    Mit anderen Worten: Das ist nicht dein typischer "Plug-and-Play"-Discordbot. Es erfordert Wartung, Grundkenntnisse und „Stichigkeit“, um gut zu laufen, zu welchem Zwecke du den auch benötigst, aber es ist eine gute Alternative, mit einem brandneuen Bot zu beginnen und stattdessen mit einigen Grundlagen zu beginnen, die bereits vorgegeben wurden.

**Anleitung:**

Zum Verwenden dieses Programms benötigt man Node.js. Erst dann kannst du "npm install --save discord.js" und "npm install -g nodemon" in die Eingabeaufforderung tippen, um discord.js und nodemon als automatische Installation zu erhalten. Stelle anschließend sicher, dass der Ordner "node_modules" innerhalb deines Bot-Ordners zu finden ist. Nodemon ist eine kleine Anwendung von @rem, die erlaubt, dass sich dein Code nach Updates neustartet. Nachdem du beides hast, führe bot.bat aus. Aber davor gibt es noch eine Sache, die du erledigen musst: Wenn du noch kein Bot-Konto hast, erstelle es hier. Danach musst du eine JSON-Datei mit dem Namen daten.json im Ordner weegeebot\de erstellen, und dazu die Daten deines Bots (nur Passwort und Name sind erforderlich) hinzufügen. Beispiel:
```
    {
    "passwort" : "Bot-Passwort",
    "name" : "Bot-Name"
    }
```
Eigene Veränderungen des Codes zum eigenen Gebrauch sind sehr einfach. Hier sind ein paar Beispielvariationen. Um einen einfachen Befehl zu hinzufügen, muss Folgendes hinzugefügt werden (ersetze "befehlsname" mit dem echten Befehlsnamen, und ersetze "befehlsantwort" mit der echten Befehlsantwort"):
```
    case "befehlsname":
        msg.channel.send("befehlsantwort");
        console.log(cmdLog("befehlsname", msg));
        break;
```
Ein komplizierterer Befehl ist einer mit zwei Antwort-Optionen. Das gelingt so:
```
  case "befehlsname":
    msg.channel.send(tf("option1","option2"));
    console.log("befehlsname");
    break;
```

**BotBat-Einstellungen:**

BotBat wurde gemacht, um das Betreiben und dynamische Konfigurieren Weegeebots vor dem Start von node.js zu erleichtern. Das Programm ist ganz einfach zu benutzen; einzige Voraussetzung ist, dass das Programm in keinem schreibgeschützten Ordner gestartet wird. In diesem Beispiel sind ein paar Parameter für Weegeebot - diese Datei enthält die Einstellungen für BotBat:

`    bot.bat -de -node `

Dieses Beispiel startet bot.bat auf Deutsch und vermeidet das Menü, um Weegeebot mit nodemon.js zu starten. Die folgende Tabelle zeigt dir all die verfügbaren BotBat-Einstellungen:
-Param 	Bedeutung/Wirkung
-de 	

Startet BotBat auf Deutsch.
Hinweis: Spracheinstellungen werden nicht gespeichert.
-en 	

Startet BotBat auf Englisch. Das ist die Standardsprache.
-node 	

Überspringt das Menü, um Weegeebot direkt mit node.js statt nodemon.js zu starten.
Nützlich, wenn etwas gedebuggt werden muss.
-nodemon 	

Standardanwendungsmodus: startet Weegeebot mit nodemon.js und überspringt das Menü.

Ein anderer Weg zur Parameterübergabe sind Verknüpfungen. Sie erlauben dir, die Weegeebot-Einstellungen zu benutzen, um verschiedene Weegeebot-Modi zu verwenden und verwalten.
