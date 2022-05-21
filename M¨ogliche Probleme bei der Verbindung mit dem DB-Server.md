
M¨ogliche Probleme bei der Verbindung mit dem
DB-Server
Im folgenden erl¨autern wir kurz die wichtigsten und h¨aufigsten Probleme, die
bei der Verbindung mit dem DB-Server auftreten k¨onnen. Bitte konsultieren
Sie bei Problemen zuerst diese Liste!
1 Fehlende Verbindung mit dem Uninetz:
Unser Server ist nur innerhalb der Uni (oder via VPN) erreichbar. Versuchen
Sie von auserhalb der Uni auf den Server zuzugreifen, kann diese Fehlermeldung
erscheinen (In der Regel erst nach einer Wartezeit von einigen Sekunden bis
Minuten)
psql: could not connect to server: Operation timed out
Is the server running on host "faulus.inf.unibe.ch"
(130.92.64.55) and accepting
TCP/IP connections on port 5432?
Wie beheben?
Begeben Sie Sich an die Uni und nutzen Sie dort das Uninetz oder richten Sie
eine VPN-Verbindung ein. Falls das Problem weiter auftritt, kann es sein, dass
die VPN-Verbindung unterbrochen wurde und erneut hergestellt werden muss
(Siehe Wegleitung VPN-Verbindung).
2 Falsches Passwort:
Nun ja, das kann jedem mal passieren und erzeugt folgende Fehlermeldung:
psql: FATAL: password authentication failed for user "lehmann"
FATAL: password authentication failed for user "lehmann"
Wie beheben?
Geben Sie das Passwort nochmals ein. Am besten machen Sie copypaste aus dem
zugesendeten Mail. Achtung: entgegen anderer Eingabefelder von Passw¨ortern
werden Sie hier nicht sehen, ob Sie eine Taste gedr¨uckt haben oder nicht. Das
kann verwirren und umso mehr lohnt sich das copypaste-Verfahren!
Falls das Problem so nicht behoben werden kann, kontaktieren Sie uns. Gelegentlich kann es vorkommen, dass die Passwort¨ubermittlung nicht korrekt funktioniert hat.
1
3 Falscher Datenbankname:
Es kann vorkommen, dass man sich bei der Eingabe des Datenbanknamens vertippt. Dann kommt nach der Eingabe des Passwortes folgende Fehlermeldung:
$ psql -h faulus.inf.unibe.ch -U lehmann -W sf19_lehman_blaigrunt
Password for user lehmann:
psql: FATAL: database "sf19_lehman_blaigrunt" does not exist
Wie beheben?
Nochmals genau lesen, welchen Namen man eingegeben hat und dann nochmals
eingeben. Falls man sich je schon erfolgreich in die entsprechende Datenbank
eingeloggt hat, kann man ¨uber die Pfeiltaste den alten Befehl auch einfach
wieder hervorholen.
4 Der Pfad/Befehl psql wird nicht erkannt:
Aus Erfahrung wissen wir, dass es insbesondere bei Mac sein kann, dass trotz
Vorhandensein einer aktuellen psql-Version der angegebene Pfad nicht funktioniert und folgendes geschieht:
$ psql -h faulus.inf.unibe.ch -U lehmann -W fs18_lehmann_playground
$ bash: psql: command not found
Wie beheben?
Das beheben Sie dadurch, dass Sie den ganzen Pfad angeben. Konkret gehen
Sie wie folgt vor: Finden Sie zuerst den Pfad mittels
$ find / -name psql
Das kann einen Moment dauern und liefert Ihnen eine ziemlich lange Liste die
so ¨ahnlich aussieht:
find: /usr/sbin/authserver: Permission denied
find: /.Spotlight-V100: Permission denied
...
find: /Users/Guest/Documents: Permission denied
find: /Users/Guest/Downloads: Permission denied
/Applications/Postgres.app/Contents/Versions/9.5/bin/psql
/Applications/Postgres.app/Contents/Versions/9.6/bin/psql
/Applications/pgAdmin3.app/Contents/SharedSupport/psql
find: /dev/fd/3: Not a directory
find: /dev/fd/4: Not a directory
Entscheidend sind die Eintr¨age unter “/Applications/postgres.app/...”. Verwenden Sie nun die ganze Zeile statt nur “psql’:
$ /Applications/Postgres.app/Contents/Versions/9.6/bin/psql -h
faulus.inf.unibe.ch -U lehmann -W fs18_lehmann_playground
Beachten Sie bitte, dass diese Pfade nicht bei allen Computern gleich sein
m¨ussen und Sie daher ihren individuellen Pfad wie angegeben herausfinden
m¨ussen.
2
Mit dieser Zeile, bzw. allf¨alligen Anpassungen im hinteren Teil, werden Sie nun
sicher eine Verbindung aufbauen k¨onnen. Wenn es Ihnen zu m¨uhsam ist, immer
den ganzen Pfad anzugeben, k¨onnen Sie unter postgresapp.com nachlesen, wie
man diesen Schritt umgehen kann. Beachten Sie aber auch, dass Sie mit den
Pfeiltasten jeweils rasch alte Eingaben wieder hervorholen k¨onnen und Sie daher
die Befehlszeile vermutlich sowieso nur einmal selbst schreiben m¨ussen.
5 Zugriff ohne Zugriffsrechte:
Wenn Sie beispielsweise versuchen, auf die Datenbank Ihrer Ubungspartnerin ¨
oder Ihres Ubungspartners zu kommen, dann fehlen Ihnen die entsprechenden ¨
Rechte und folgende Fehlermeldung erscheint:
FATAL: permission denied for database "fs18_user_playground"
DETAIL: User does not have CONNECT privilege.
Wie beheben?
Da gibt es nichts zu beheben. Die Datenbanken sind individuell. Tauschen Sie
die sql-Skripte aus, wenn Sie beide Datenbanken gleich haben wollen. Ansonsten
arbeiten Sie auf Ihrer pers¨onlichen Datenbank (Ausnahme: Ubungsserie 7). ¨
6 Der Server ist ¨uberlastet:
Wenn sehr viele Studierende parallel auf den Server zugreifen, kann es vorkommen, dass der Server ¨uberlastet wird. Dann sind keine weiteren Zugriffe mehr
m¨oglich. Es erscheint eine Fehlermeldung mit ungef¨ahr folgendem Inhalt:
psql: FATAL: remaining connection slots are reserved for
non-replication superuser connections
Wie beheben?
In diesem Fall ist es am besten, einen Moment zu warten. Tritt das Problem
w¨ahrend l¨angerer Zeit (einigen Stunden) auf, kontaktieren Sie uns bitte per Mail
oder ¨uber das Forum auf Ilias.
3
