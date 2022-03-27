# In einem schlecht gewählten Datenbankschema können Einfüge, 

Änderungs- und Lösch-
operationen zu gewissen Anomalien führen. Es kann beispielsweise sein, dass für eine
Änderung mehrere Änderungsoperationen ausgeführt werden müssen oder dass gewisse
Daten gar nicht im gegebenen Schema abgespeichert werden können.
Einfach gesagt treten diese Anomalien immer dann auf, wenn ein Schema mehrere Kon-
zepte modelliert. Um dies formal zu präzisieren, führen wir den Begriff der funktionalen
Abhängigkeit ein. Dies hilft uns, Relationenschemata so zu zerlegen, dass ein Schema nur
noch ein Konzept modelliert und damit Anomalien vermieden werden. Wir sagen dann,
das Schema ist in Normalform. In diesem Kapitel studieren wir insbesondere die dritte
Normalform (3NF) und die Boyce–Codd Normalform (BCNF). Dabei interessiert uns, ob
eine Zerlegung in eine Normalform verlustfrei und abhängigkeitserhaltend ist. Auch geben
wir den Zusammenhang zwischen 3NF und transitiven Abhängigkeiten an. 

# 9.1 Anomalien 
9.1 Anomalien
Wir beginnen mit einem Beispiel zu einer Bibliotheksdatenbank.
Beispiel 9.1. Unsere Datenbank zur Bibliotheksverwaltung besitzt zwei Schemata: B
modelliert den Buchbestand der Bibliothek, A modelliert die Ausleihen:
B := (BId, ISBN, Titel, Autor)
A := (BId, Name, Adresse, Datum)

Das Attribut BId ist eine eindeutige Id für die Bücher, welche zum Bestand der Bibliothek
gehören. Für jedes dieser Bücher wird die ISBN, der Titel und der Autor abgespeichert.
