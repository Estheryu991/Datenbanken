--- Dankeschön  ---
--- datenbanken ---
B modelliert den Buchbestand der Bibliothek, A modelliert die Ausleihen:
B := (BId, ISBN, Titel, Autor)
A := (BId, Name, Adresse, Datum)
Das Attribut BId ist eine eindeutige Id für die Bücher, welche zum Bestand
der Bibliothek gehören.
Für jedes dieser Bücher wird die ISBN, der Titel und der Autor
abgespeichert.
Bei einer Ausleihe, wird die Id des ausgeliehenen Buches, der Name und die
Adresse der Benutzers, welcher das Buch ausleiht, sowie das Ausleihdatum
abgespeichert.
Wir nehmen hier an, dass ein Benutzer eindeutig durch seinen Namen
identifiziert ist.
Ausserdem sei BId im Schema A ein Fremdschlüssel auf das Schema B.

# Änderungsanomalie

Was passiert, wenn ein Benutzer seine Adresse ändern will?

Falls dieser Benutzer mehrere Bücher ausgeliehen hat, so gibt es mehrere
Einträge mit diesem Benutzer in der A-Relation. In jedem dieser Einträge
muss nun die Adresse aktualisiert werden.
Das heisst, obwohl nur die Adresse eines Benutzers ändert, müssen mehrere
Tupel aktualisiert werden.
