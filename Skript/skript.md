
Inhaltsverzeichnis
1. Installation 3
1.1. Arbeiten via Terminal . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.1.1. psql auf Windows . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.1.2. psql auf Mac OSX . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.1.3. psql auf Linux . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3
1.1.4. Verbindungsaufbau . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.2. pgAdmin III - Einleitung . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.2.1. Windows . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.2.2. Mac OSX . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.2.3. Linux . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
2. pgAdmin III 5
2.1. Icons . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
2.2. Ausführen von SQL Abfragen . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
3. SQL Skripts 6
3.1. Aufbau . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
3.2. Dateibezeichnungen . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
4. Exkurs: Auswertungspläne 6
4.1. Grafischer Auswertungsplan . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 6
4.2. Beispiel: Joinreihenfolge 1 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
4.3. Beispiel: Joinreihenfolge 2 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
4.4. Beispiel: Index . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 8
4.5. Arten von Joins . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
4.6. Beispiel: VaterSohn . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
4.6.1. Union . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
4.6.2. Rekursiv . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 10
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 2/10
In diesem Manual wird erläutert, wie die SQL Skripte zu benützen sind, welche im Rahmen
der Vorlesung Datenbanken zur Verfügung gestellt werden. Es wurden die meisten Beispiele aus
dem Kapitel vier im Skript, Die relationale Algebra, in SQL Statements übersetzt, um Ihnen die
Verbindung dieser beiden Gebiete zu verdeutlichen und den Einstieg in SQL zu erleichtern.
Ebenfalls wird erklärt, wie unter den verschiedenen Betriebssystemen die nötige Software installiert
wird, um die Ressourcen auch nutzen zu können.
Zusätzlich enthält dieses Dokument noch einen Exkurs betreffend Auswertungsplänen, welcher
Aufschluss üeber die Art und Weise bieten soll, wie SQL Abfragen abgehandelt werden und was
im Hintergrund eigentlich passiert.
1. Installation
Es gibt verschiedene Möglichkeiten wie mit einer Datenbank gearbeitet werden kann. Im Folgenden wird
sowohl kurz auf das Arbeiten via Eingabeaufforderung eingegangen, als auch ein bisschen detaillierter auf das
Programm pgAdmin III.
1.1. Arbeiten via Terminal
Es ist möglich sämtliche Operationen und Manipulationen in einer Eingabeaufforderung durchzuführen. Da
dies technisch anspruchsvoller ist und im Allgemeinen einige Vorkenntnisse über Betriebssysteme und Shells
benötigt, wird hier nur auf die Grundinstallation eingegangen. Für spezifische Probleme oder Befehle wird der
Umgang mit eingängigen Unix-Kommandos wie man psql u.ä. vorausgesetzt.
1.1.1. psql auf Windows
Per Cygwin ist es möglich, wichtige Unix-Tools auf Windows laufen zu lassen.
1. Cygwin setupx86 oder x86_64 von http://www.cygwin.com/ herunterladen und im Setup zum PackageAuswahlfenster durchklicken.
2. Folgende Packages auswählen:
• Database → postgresql
• Database → postgresql-client
3. Installation abschliessen.
4. In das Installationsverzeichnis von cygwin gehen.
5. Cygwin.bat ausführen.
6. Jetzt befindet man sich in einer Bash-ähnlichen Shell und kann psql benützen.
1.1.2. psql auf Mac OSX
Nach dem Download via http://postgresapp.com/ und der Verschiebung in den Applikationsordner sollte
der Befehl psql im Terminal funktionieren.
1.1.3. psql auf Linux
Nach der Installation des Pakets postgresql sollte der Befehl psql im Terminal funktionieren.
sudo apt-get install postgresql
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 3/10
1.1.4. Verbindungsaufbau
Allgemein funktioniert das Verbinden mit der zur Verfügung gestellten Datenbank danach mit allen Systemen
via
psql -U USERNAME -h HOST -W DATENBANKNAME
1.2. pgAdmin III - Einleitung1
Für diejenigen, die es technisch ein bisschen einfacher mögen gibt es pgAdmin. pgAdmin ist eine Open Source
Administrations- und Entwicklungsplattform für PostgreSQL, die fortgeschrittenste Open Source Datenbank.
pgAdmin zeichnet sich Funktionsreichtum aus und erfreut sich deshalb grösster Beliebtheit. Die Software
erfüllt vom Schreiben simpler Abfragen bis hin zur Entwicklung komplexer Datenbanken alle Anforderungen.
Zusätzlich vereinfacht die grafische Benutzeroberfläche die Administration um ein Vielfaches.
1.2.1. Windows
1. Navigieren Sie in Ihrem Browser zur Webseite http://www.pgadmin.org/download/windows.php
2. Wählen Sie die aktuellste Version aus indem sie auf den entsprechenden Link klicken.
3. Laden Sie die .zip-Datei runter durch einen Klick auf den entsprechenden Link.
4. Entpacken Sie die .zip-Datei.
5. Starten Sie die Installation mit einem Doppelklick auf die .msi-Datei
6. Folgen Sie den Anweisungen auf dem Bildschirm
1.2.2. Mac OSX
1. Navigieren Sie in Ihrem Browser zur Webseite http://www.pgadmin.org/download/macosx.php
2. Wählen Sie die aktuellste Version aus indem sie auf den entsprechenden Link klicken.
3. Laden Sie die .dmg-Datei runter durch einen Klick auf den entsprechenden Link.
4. Binden Sie das Disk Image durch Doppelklick auf die .dmg-Datei ein.
5. Verschieben Sie das pgAdmin Paket an eine beliebige Stelle.
1.2.3. Linux
pgAdmin ist standardmässig auf den meisten Linux Distributionen wie RedHat, Fedora, Debian und Ubuntu
vorinstalliert. Nebenbemerkung: Es stehen Tarball Archive zur Verfügung die den Source Code enthalten. Das
Kompilieren erfordert jedoch fundierte technische Kenntnisse und wird im Rahmen dieses Manuals nicht weiter
erklärt.
1Freie Übersetzung von www.pgadmin.org
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 4/10
2. pgAdmin III
2.1. Icons
Überblick über die Bedeutung und Funktion der vorhandenen Symbole der grafischen Benutzeroberfläche.
Abbildung 1: Icons von pgAdmin III
1. Hier kann eine neue Serververbindung erstellt werden. Tragen Sie dazu im erscheinenden Fenster die
erhaltenen Zugangsdaten zur Datenbank ein und bestätigen Sie anschliessend mit Ok
2. Aktualisiert das ausgewählte Objekt. Bei hinzufügen einer neuen Tabelle muss anschliessend das Objekt
Tables aktualisiert werden, damit die Tabelle im Object Browser angezeigt wird.
3. Öffnet ein Fenster mit den Eigenschaften des ausgewählten Objekts.
4. Erzeugt ein neues Objekt gleichen Types wie das ausgewählte Objekt.
5. Löscht das ausgewählte Objekt. Achtung: Es gibt keine Funktion zum Rückgängig machen. Wenn ein
Objekt gelöscht wurde, muss es komplett neu erstellt werden.
6. Öffnet ein Fenster zum Ausführen beliebiger SQL Abfragen. Detailiertere Beschreibung, siehe Abschnitt
2.2.
7. Zeigt die Daten eines ausgewählten Objektes an.
8. Wie 7, nur mit zusätzlicher Filteroption.
9. Guru Hint - zeigt hilfreiche Informationen zum ausgewählten Objekt an.
10. Öffnet die PostgreSQL Dokumentation.
Nebenbemerkung: Die zwei unerwähnen Symbole werden im Rahmen der Vorlesung Datenbanken kaum von
Nutzen sein und wurden deshalb ausgelassen.
2.2. Ausführen von SQL Abfragen
Durch einen Klick auf das entsprechende Symbol (siehe Abb. 1 (6)) öffnet sich ein Fenster. Im SQL Editor
lassen sich Abfragen ausformulieren, welche anschliessend ausgeführt werden können. Bei den Symbolen des
Query Fensters handelt es sich grösstenteils um Standardsymbole, welche aus anderen Programmen schon
bekannt sein sollten. Jede in sich abgeschlossene SQL Abfrage (Query) wird mit einem Strichpunkt bzw.
Semikolon (;) abgeschlossen. Im SQL Editor können mehrere Queries eingetragen werden. In pgAdmin III ist
es möglich bei einer einzelnen Abfrage das Semikolon wegzulassen. Um jedoch Fehler in anderen Programmen
vorzubeugen sollte der Strichpunkt am Ende zur Gewohnheit werden.
Hier können nur also via Tastenkombination Ctrl-O oder dem entsprechenden Symbol die zur Verfügung
gestellten Skripts geladen werden. Schrecken Sie nicht davor zurück eigene Abfragen zu schreiben, selber
Tabellen zu erstellen oder eigene Beispiele zu kreieren. Hier bringt das Prinzip ’Learning by doing’ den grössten
Nutzen/Erfolg und am meisten Spass.
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 5/10
3. SQL Skripts
Im Rahmen der Vorlesung Datenbanken wir eine Sammlung von .sql-Dateien angeboten, welche Beispiele aus
der Vorlesung enthalten, den Einstieg in SQL erleichtern und zum Ausprobieren anregen sollen.
3.1. Aufbau
Jedes Skript beginnt mit einem Kommentarteil, welcher durch die Syntax /* und */ eingeschlossen ist. Im
Kommentarteil enthalten sind unter anderem Informationen bezüglich Voraussetzungen (bspw. benötigte Tabellen) und Inhalt bzw. Funktion des jeweiligen Skripts.
Weiter enthält jedes Skript mindestens eine SQL Abfrage, welche ausgeführt werden kann. Zur genaueren
Erklärung bezüglich Ausführung, siehe Kapitel 2.2..
3.2. Dateibezeichnungen
Jedes Skript enthält im Dateinamen eine Nummerierung, welche in direktem Zusammenhang mit dem Vorlesungsskript steht. Als Beispiel bezieht sich eine .sql-Datei aus dem Ordner Das Relationenmodell mit der
Nummer 1_ auf das Kapitel 4. Das Relationenmodell und noch spezifischer auf Punkt 4.1 im Vorlesungsskript.
Weiter wurden zwei Schlüsselworte verwedet um den Nutzen des entsprechenden Skripts klarzumachen.
create Die meisten Skripts haben als Voraussetzung, dass eine entsprechende Tabelle existieren muss. Die
Skripts mit diesem Schlüsselwort werden zur Erzeugung von Tabellen verwendet.
query / subquery Die Skripts mit diesem Schlüsselwort enthalten eine oder mehrere Abfragen, die sich auch
eine spezifisches Beispiel beziehen.
4. Exkurs: Auswertungspläne
Wenn eine Datenbankabfrage gestellt wird, müssen die entsprechenden Befehle, Bedingungen, Scans, Joins
und vieles mehr in einer Reihenfolge abgehandelt werden, die möglichst kostengünstig bzw. effizient ist. Bei
einem Auswertungsplan handelt es sich um die Beschreibung einer solchen Reihenfolge von Schritten, die bei
einer Datenbankabfrage ausgeführt werden. Da es bei den meisten Abfragen mehr als eine Möglichkeit gibt
wie die Ausführung vonstatten gehen kann, existiert ein sogenannter Abfrageoptimierer. Er hat die Aufgabe,
von den verschiedenen Zugriffsvarianten die mit der besten Ausführungszeit zu ermitteln.
4.1. Grafischer Auswertungsplan
Mit dem Schlüsselwort EXPLAIN kann der Auswertungsplan einer beliebigen Abfrage ausgegeben werden.
Wenn EXPLAIN verwendet wird, wird die Abfrage nicht ausgeführt. Stattdessen werden Erwartungswerte
berechnet, welche Aufschluss über das Verhalten der entsprechenden Query liefern soll. Mit einem Klick auf
das Symbol ( ) im Query Fenster wird das beschriebene Szenario ausgeführt. Als Output entsteht eine
Grafik des bebilderten Auswertungsplans. Zusätzlich kann in der Registerkarte Data Output die Textversion
davon eingesehen werden.
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 6/10
4.2. Beispiel: Joinreihenfolge 1
Im Ordner Exkurs befinden sich unter anderem die zwei Skripts Exkurs_create_largetable.sql und
Exkurs_create_smalltable.sql. Hierbei ist zu beachten, dass bei smalltable eine Tabelle mit 99 Einträgen generiert wird, wohingegen die largetable aus 100 Einträgen besteht. Wird nach dem Erstellen und
abfüllen dieser Tabellen das Statement
SELECT * FROM smalltable, largetable;
ausgeführt, so entsteht folgender grafischer Auswertungsplan.
Abbildung 2: Grafischer Auswertungsplan: smalltable=99, largetable=100
Damit nicht alle Einträge von smalltable für jede Zeile von largetable noch einmal gelesen werden müssen,
wird ein Materialize durchgeführt, welches im Memory gespeichert wird. Da smalltable weniger Einträge hat,
wird diese Tabelle vom Optimierer im Speicher behalten. Eine Änderung der Reihenfolge in der Abfrage zu
SELECT * FROM largetable, smalltable;
hat KEINE Änderung am Auswertungsplan zur Folge. Wenn nun aber in der Tabelle smalltable ein einzelner
Eintrag hinzugefügt wird, sprich beide Tabellen 100 Einträge besitzen, dann wird immer die hintere Tabelle
materialisiert. Im Falle, dass die Anzahl der Einträge der Tabelle smalltable diejenige von largetable
übersteigt, so wird durch den Optimierer unabhängig von der Reihenfolge der Abfrage die Tabelle largetable
im Speicher behalten.
Abbildung 3: Grafischer Auswertungsplan: smalltable>100, largetable=100
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 7/10
4.3. Beispiel: Joinreihenfolge 2
Seinen a, b und c Tabellen. Wir möchten nur folgende Query absetzen:
SELECT *
FROM a, b, c
WHERE a.id = b.id AND b.ref = c.id;
Es existieren insgesamt sechs Varianten, wie diese drei Tabellen miteinander verknüpft werden können (3! =
3 ∗ 2 ∗ 1 = 6). Die Anzahl dieser Join-Möglichkeiten vergrössert sich exponentiell. Bei 10 Tabellen erhalten
wir 3.6 Mio. verschiedene Varianten. Jede Variante zu testen ist bei solchen Dimensionen nicht mehr effizient.
Stattdessen werden dann heuristische Ansätze verfolgt.
Da in unserem Beispiel die Tabellen a und c zusammen keine WHERE-Bedingung erfüllen müssen, wäre es
ineffizient a und c zuerst zu joinen, da das komplette kartesische Produkt gebildet werden müsste. Somit wird,
immer entweder erst a und b gejoint oder b und c.
Abbildung 4: Grafischer Auswertungsplan zur obigen Abfrage
4.4. Beispiel: Index
Im Vorlesungsskript, im Kapitel 7.1 werden Indizes beschrieben. Die Funktionalität lesen Sie bitte an der entsprechenden Stelle nach. Es soll hier nun anhand eines Beispiels gezeigt werden, wie Indizes in der Anfragenoptimierung von Nutzen sein können. Führen Sie zunächst im Ordner Exkurs das Skript Exkurs_create_library.sql
in pgAdmin III aus. Nach der Ausführung haben wir eine Tabellen, welche aus 100 Einträgen besteht. Zusätzlich zu den Attributen bookid, author, title und price, haben wir einen Index idx_price auf der Spalte
price angelegt.
Führen wir nun das Skript Exkurs_query_library.sql als grafischen Auswertungsplan aus, dann sehen wir, dass
sich der Abfrageoptimierer entschieden hat, einen sequentiellen Scan durchzuführen. Das heisst, die gesamte
Relation wird in der Reihenfolge gescannt wie sie gespeichert ist. Wir können nun alle INSERT-Statements aus
dem Skript Exkurs_create_library.sql nocheinmal ausführen. Für 200 bis 500 Einträge erhalten wir als Resultat immer einen sequentiellen Scan. Sobald wir aber die INSERT-Statements insgesamt sechs Mal ausgeführt
haben, also 600 Einträge generiert haben, erhalten wir als Output im Auswertungsplan einen Index Scan.
Der Abfrageoptimierer merkt also, dass es ab einem bestimmten Punkt effizienter ist via Index auf die Tabelle
zuzugreifen und dies wird im Query Plan wiedergespiegelt.
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 8/10
Abbildung 5: Sequentieller Scan Abbildung 6: Index Scan
4.5. Arten von Joins2
Nested Loop Join Die rechte Relation wird für jede Zeile, die in der linken Relation gefunden wird, einmal
gescannt. Dies ist einfach zu implementieren, kann jedoch sehr viel Zeit in Anspruch nehmen. Wenn
jedoch die rechte Relation mit einem Index Scan gescannt werden kann, ist es unter Umständen möglich
die Werte der aktuellen Zeile der linken Relation als Schlüssel für den Index Scan der rechten Seite zu
benutzen.
Merge Join Jede Relation wird bezüglich dem Join Attribut sortiert bevor der Join beginnt. Danach werden
beide Relationen parallel gescannt und übereinstimmende Zeilen werden kombiniert. Weil jede Relation
nur einmal gescannt werden muss, ist diese Art von Joins günstiger. Die Sortierung kann entweder via
explizitem Schritt durchgeführt werden oder via Index auf den Join Attributen. Somit wird die Relation
in der richtigen Reihenfolge gescannt.
Hash Join Die rechte Relation wird zuerst gescannt und wird in eine Hash Tabelle geladen. Dazu werden die
Join Attribute als Hash Schlüssel verwendet. Danach wird die linke Relation gescannt und die dazugehörigen Werte jeder gefundenen Zeile werden als Hash Schlüssel verwendet um die betroffenen Zeilen in
der Tabelle zu finden.
Dies ist keine vollständige Liste. Es soll lediglich veranschaulicht werden, dass diverse Arten existieren um
Relationen miteinander zu verknüpfen.
4.6. Beispiel: VaterSohn
Siehe Vorlesungsskript, Kapitel 5.3 und 5.6.
Folgend zur Illustration noch beide Beispiele als grafische Auswertungspläne.
4.6.1. Union
SELECT 1 as Generationen, vater AS Vorfahre, sohn AS Nachfolger
FROM vatersohn
UNION
SELECT 2, N1.vater , N2.sohn
FROM vatersohn AS N1, vatersohn AS N2
WHERE N1.sohn = N2.vater;
2Freie Übersetzung von http://www.postgresql.org/docs/8.4/static/planner-optimizer.html
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 9/10
Abbildung 7: Grafischer Auswertungsplan zum Skript 3_query_union.sql im Ordner SQL Abfragen
4.6.2. Rekursiv
WITH RECURSIVE t (v , n ) AS (
SELECT vater , sohn
FROM vatersohn
UNION ALL
SELECT t .v , vatersohn . sohn
FROM t INNER JOIN vatersohn ON t . n = vatersohn . vater
)
SELECT v AS Vorfahre , n AS Nachfolger
FROM t ;
Abbildung 8: Grafischer Auswertungsplan zum Skript 6_query_union_recursive.sql im Ordner SQL Abfragen
Manual - SQL Skripte zur Vorlesung "Datenbanken" S. 10/10
