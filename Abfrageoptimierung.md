In diesem Kapitel geht es darum, 
# wie ein Datenbanksystem Abfragen effizient,
d. h. schnell, beantworten kann. Dazu betrachten wir im ersten Teil sogenannte
Indizes. Das sind Hilfsobjekte, welche die Suche nach bestimmten Daten unterstützen.
Insbesondere führen wir Indizes ein, welche auf B+-Bäumen oder Hash-Funktionen
basieren.
Anschliessend studieren wir Methoden zur logischen und physischen Query-
Optimierung. Bei der logischen Optimierung geht es darum, eine gegebene Abfrage
so umzuformulieren, dass sie dasselbe Resultat liefert aber effizienter berechnet werden
kann, beispielsweise weil kleinere Zwischenresultate erzeugt werden. Damit wird weniger
Speicherplatz benötigt und die Berechnung kann schneller ausgeführt werden.
Die physische Optimierung behandelt die Auswahl der Algorithmen, welche die
Operationen der relationalen Algebra implementieren. Wir führen drei Algorithmen ein,
um Joins zu berechnen: Nested Loop Join, Merge Join und Hash Join. Wir zeigen auch,
wie Auswertungspläne von PostgreSQL die verschiedenen Algorithmen darstellen. 

# 7.1 Indizes 
sind Hilfsobjekte in einer Datenbank, welche der Beschleunigung von Suchabfra-
gen dienen. Es sind Hilfsobjekte in dem Sinn, dass sie für die Semantik der Datenbank
irrelevant sind. Indizes enthalten somit keine zusätzlichen Daten. Sie ermöglichen nur
alternative (d. h. schnellere) Zugriffswege auf bereits bestehende Daten in der Datenbank.
Um die Wirkungsweise von Indizes zu illustrieren, betrachten wir die Tabelle Filme,
gegeben durch
