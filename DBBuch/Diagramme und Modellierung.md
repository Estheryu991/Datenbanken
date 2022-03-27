#Die Datenmodellierung ist ein wichtiger Schritt bei der Entwicklung eines Informatiksys-
tems. Es geht darum, ein DB-Schema zu finden, so dass
1. alle benötigten Daten im DB-Schema abgespeichert werden können,
2. effizient auf die Daten zugegriffen werden kann und
3. die Datenkonsistenz gewährleistet ist.
In diesem Kapitel studieren wir die grundlegenden Möglichkeiten, wie Entitäten1 ver-
schiedener Typen (z. B. Autos und ihre Fahrer) zueinander in Beziehung stehen können.
Wir untersuchen dann, wie die Tabellenstruktur eines DB-Schemas diese Beziehungsarten
abbilden kann. Dabei werden wir wesentlichen Gebrauch machen von den Constraints,
welche wir im vorherigen Kapitel eingeführt haben. Auf das Thema der Effizienz wird
später im Kap. 7 noch genauer eingegangen. Die Datenkonsistenz wird in den Kap. 9
und 10 ausführlich behandelt.
Ein DB-Schema ist üblicherweise aus sehr vielen Tabellen aufgebaut. In einer rein
textuellen Beschreibung eines solchen DB-Schemas sind dann die Beziehungen zwischen
den Tabellen nicht mehr klar darstellbar. Deshalb führen wir eine Diagramm-Notation
für DB-Schemata ein, mit der wir die Tabellen-Struktur einer relationalen Datenbank
graphisch darstellen können. Unsere Notation lehnt sich an die sogenannte Krähenfuss-
Notation an.
