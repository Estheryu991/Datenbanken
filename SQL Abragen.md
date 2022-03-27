#SQL (Structured Query Language)

 ist die wichtigste Sprache im Bereich der relationalen
Datenbanksysteme. Obwohl sie als Query Language bezeichnet wird, bietet SQL weit
mehr Möglichkeiten als blosse Datenabfrage. So kann man etwa die Struktur von Daten
definieren, Daten in einer Datenbank modifizieren und Sicherheitsbedingungen aufbauen.
Nach einer Kurzeinführung in SQL werden wir in diesem Kapitel im Detail zeigen,
wie mit SQL Datenbankabfragen formuliert werden können. Dabei betrachten wir auch
die verschiedenen Arten von Join-Operationen, Gruppierung und Aggregation, sowie
rekursive Queries. 

einer relationalen Datenbank werden sämtliche Daten in Tabellen gespeichert. In einem
ersten Schritt müssen wir also eine solche Tabelle erzeugen. Dies geschieht mit einem
CREATE TABLE StCREATE TABLE TabellenName (
Attribut_1 Domäne_1,
Attribut_2 Domäne_2,
Attribut_3 Domäne_3 )atement, welches eine leere Instanz (d. h. eine Relation, welche keine
Tupel enthält) über einem Schema erstellt. Eine einfache Form des CREATE TABLE
Statements ist:
