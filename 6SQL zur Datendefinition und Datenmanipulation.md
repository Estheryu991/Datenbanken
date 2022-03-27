#6. SQL zur Datendefinition und Datenmanipulatio

In diesem Kapitel zeigen wir, wie mit SQL Daten eingefügt, geändert und gelöscht werden
können. Dabei studieren wir auch sogenannte Sequenzen. Das sind Datenbankobjekte mit
denen eindeutige Werte erzeugt werden können. Diese sind wichtig, um Primärschlüssel-
attribute korrekt abzufüllen.
Weiter betrachten wir die Möglichkeiten von SQL zur Definition von Tabellen und
Constraints. Dazu führen wir die wichtigsten Datentypen von PostgreSQL ein und zeigen,
wie Defaultwerte für Attribute definiert werden können. Ausserdem untersuchen wir die
Funktionsweise von unique, not null, primary key, foreign key und check Constraints
und geben Beispiele, wie Änderungen an Attributen eine Kaskade von Änderungen in
anderen Tabellen zur Folge haben können. Zum Schluss führen wir noch dynamische und
materialisierte Views ein.

6.1 Datenmanipulation 

Bisher haben wir SQL als Sprache zur Abfrage einer Datenbank betrachtet. Nun wenden
wir uns dem Problem zu, mit Hilfe von SQL Daten hinzuzufügen, zu entfernen und
zu modifizieren. Ausserdem wollen wir SQL zur Definition von Datenbankschemata
verwenden. 

# Um Daten in eine Relation einzufügen,


spezifizieren wir ein Tupel, das eingefügt
werden soll, oder schreiben eine Abfrage, deren Ergebnis eine Menge von Tupeln ist, die
eingefügt werden sollen. Dabei ist zu beachten, dass die Attributwerte der einzufügenden
Tupel zu den Domänen der betroffenen Attribute gehören müssen. Ausserdem müssen die
einzufügenden Tupel die korrekte Stelligkeit besitzen.
Wir betrachten wieder die Relation Autos über dem Schema. 

(Marke, Farbe, Baujahr, FahrerId).

Wie bereits beschrieben, können wir mit der Anweisung
# INSERT INTO Autos
VALUES (’Audi’, ’silber’, 2008, 3)
ein neues Tupel in die Relation Autos einfügen.
Es können auch explizit Null Werte eingefügt werden, bspw. falls der Fahrer
unbekannt ist. Die entsprechende Anweisung lautet dann:
INSERT INTO Autos
VALUES (’Skoda’, ’silber’, 2009, Null)
Äquivalent dazu ist folgende Anweisung:
INSERT INTO Autos (Baujahr, Farbe, Marke)
VALUES (2009, ’silber’, ’Skoda’)
Hierbei geben wir die Attribute des einzufügenden Tupels explizit an. Diese dürfen dann
in einer beliebigen Reihenfolge auftreten. Attribute, welche nicht angegeben werden,
erhalten den Wert Null.
Die einzufügenden Tupel können auch mit Hilfe einer SQL Abfrage erzeugt werden.
Die Anweisung
INSERT INTO Autos
SELECT ’Audi’, ’silber’, 2008, PersId
FROM Personen
WHERE Vorname = ’Eva’ AND Nachname = ’Meier’
