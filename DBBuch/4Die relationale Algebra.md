#Die relationale Algebra kann als Abfragesprache des Relationenmodells verstanden wer-
den. Sie geht von einigen Grundoperationen (Vereinigung, Mengendifferenz, kartesisches
Produkt, Projektion, Selektion und Umbenennung) aus, welche aus einer oder zwei ge-
gebenen Relationen eine neue Relation berechnen. Aus diesen Grundoperationen können
komplexe Ausdrücke geformt werden, welche komplexe Berechnungen von Relationen
beschreiben. Diese Ausdrücke entsprechen komplexen Abfragen einer Datenbank und
geben (auf einer abstrakten Ebene) vor, wie das Resultat der Abfrage berechnet werden
kann.
In diesem Kapitel führen wir die relationale Algebra formal ein. Wir zeigen dann, wie
in der Sprache der relationalen Algebra verschiedene Join-Operationen und die relationale
Division definiert werden können. Mit einer Reihe von konkreten Beispielen illustrieren
wir, wie Datenbankabfragen als Ausdrücke der relationalen Algebra formuliert werden
können. Zum Schluss erweitern wir die relationale Algebra noch mit Gruppierungsopera-
tionen und Aggregatsfunktionen.

#Die relationale Algebra bezieht sich auf ein gegebenes DB-Schema, welches die Basisre-
lationen der relationalen Algebra festlegt. Mit den Operationen der relationalen Algebra
können wir dann aus diesen Basisrelationen komplexe Ausdrücke aufbauen, welche neue
Relationen definieren. 

#Input Relationen
Sei S ein Schema des gegebenen DB-Schemas und sei R eine Instanz von S . Dann ist R
eine Basisrelation der relationalen Algebra.

#Konstante Relationen
Sei A ein Attribut mit Domäne D, welches im gegebenen DB-Schema vorkommt.
Weiter sei a eine Element von D. Dann ist die konstante 1-stellige Relation {(a)} eine
Basisrelation der relationalen Algebra. Offensichtlich ist die Relation {(a)} eine Instanz
des Schemas (A).
Anmerkung 4.1. Wir erinnern uns, dass der Wert Null zu jeder Domäne gehört. Somit
gilt für jedes Attribut A, dass die konstante Relation {(Null)} eine Instanz von (A) ist.
