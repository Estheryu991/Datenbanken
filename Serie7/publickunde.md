# Aufgabe 

Auf dem Server faulus liegt fu ̈r Sie eine Postgresql-Datenbank “fs22 s07” bereit.
Sie ko ̈nnen nur lesend auf die darin enthaltenen Schemen zugreifen. Verbinden Sie sich mit ihrem Benutzernamen, wie in den Serien 5 und 6 angegeben. Es ist empfehlenswert die ersten beiden Aufgaben in der angegebenen Reihenfolge zu bearbeiten.
Wenn etwas nicht funktioniert sollten Sie sich folgende Fragen stellen und das Verbindungspa- per auf Ilias konsultieren:
􏰐 Befinden Sie sich im Uninetz oder sind Sie via VPN damit verbunden?
􏰐 Haben Sie sich korrekt eingeloggt? (psql -U username -h faulus.inf.unibe.ch -W fs22 s07). Fu ̈rU ̈bungszweckestehtIhnenzudemweiterhindieDatenbankmitNamefs22usernameplayground zur Verfu ̈gung. Mit dieser werden Sie aber die Aufgaben nicht lo ̈sen ko ̈nnen.
􏰐 Kennt ihr Programm den Pfad von psql?
Aufgabe 1
Bestimmen Sie die Tabellen-Schemata der Datenbank und zeichnen Sie dazu ein Kra ̈henfuss- Diagramm, das diese mo ̈glichst pra ̈zise abbildet.
Hinweis: Sie ko ̈nnen in postgresql mittels “\d+ tabellenname” Informationen u ̈ber eine Tabelle erhalten. Geben sie keinen Tabellennamen an erhalten Sie eine U ̈bersicht. Beispiel:
$ psql -U t.kohler4 -h faulus.inf.unibe.ch -W fs22_s07
fs22_s07=# \d kunde
                             Table "public.kunde"
     Column     |          Type          | Modifiers | Storage  | Description
----------------+------------------------+-----------+----------+-------------
 kid            | integer                | not null  | plain    |
 steuerreferenz | character varying(100) |           | extended |
Indexes:
    "kunde_pkey" PRIMARY KEY, btree (kid)
Referenced by:
    TABLE "kauft" CONSTRAINT "kauft_kid_fkey" FOREIGN KEY (kid) REFERENCES kunde(kid)
Has OIDs: no
Insbesondere gibt die Information “PRIMARY KEY, btree (kid)” an, dass kid der Prima ̈r-Schlu ̈ssel von Kunde ist, und die Information nach “References” gibt an, dass eine andere Tabelle von dieser Tabelle abha ̈ngt (also direkt oder indirekt eine Beziehung bestehen muss). Der Modifikator “not null” gibt an, dass der Wert “NULL” als mo ̈glicher Wert ausgeschlossen ist.
Hinweis 2: Vergleichen Sie auch die unten stehende SQL-Aufgabe um die Struktur besser zu erfassen.
Aufgabe 2
Finden Sie SQL-Abfragen, die die folgenden Informationen abfragen:
a) Alle Filialleiter, welche Artikel vom Lieferanten ”Druckwerk Trallala”beziehen (Die richtige Lo ̈sung liefert 4 Zeilen)
b) Alle Kunden, die einen Artikel gekauft haben, der nicht von einer Schweizer Firma produziert wird (Die richtige Lo ̈sung liefert 992 Zeilen)
c) Die Kunden, die Artikel gekauft haben, deren Artikeltypen auch von einem Schweizer Liefe- ranten verfu ̈gbar sind. (Die Lo ̈sung hat 1286 Zeilen)
 
Datenbanken
U ̈bungsblatt7 AbgabederLo ̈sungen:14.April2022
d) Alle Bezeichnungen von nicht mehr in Filialen lagernden Artikeltypen und deren Anzahl. (Die Lo ̈sung hat 19 Zeilen)
e) Zu jedem Kunden das Total (die Summe der Preise) bereits gekaufter Artikel, wenn er sie zu aktuellen Preisen kaufen wu ̈rde. (Der Kunde mit der Kundennummer 8 hat fu ̈r 20111.25 Franken eingekauft und es hat insgesamt 1414 Kunden)
f*) Zu jedem Artikeltyp, von dem weniger als 400 Exemplare in (verschiedenen) Filialen lagern den gu ̈nstigsten Lieferanten. (Die richtige Lo ̈sung liefert 3 Zeilen)
Abzugeben sind die SQL-Abfragen u ̈ber Ilias, einmal als .sql- und einmal als .pfd-Datei
Ihre Ergebnistabellen ko ̈nnen Sie auch im Forum auf Ilias vero ̈ffentlichen um sie zu vergleichen. Bitte geben Sie diese nicht mit ab.
Aufgabe 3
Bestimmen Sie die Ergebnisse der untenstehenden logischen Ausdru ̈cke.
a) NULL = NULL b) 17 = NULL
c) (3<7)OR29>NULL
d) ‘Mein Nachbar ist cool‘ LIKE ‘%a%b%c l‘
e) NULL IS NOT NULL Hinweis: dreiwertige Logik!
Aufgabe 4
Erstellen Sie eine Tabelle (auf Papier), so dass der folgende Ausdruck, wenn er auf den Tupeln ausgewertet wird, mindestens einmal TRUE, FALSE und UNKNOWN annimmt.
(Art NOT NULL OR Gewicht > 7000.000 )
AND ( Name NOT LIKE ‘%fant%‘ OR Name=NULL )
Hinweis: Die Relation beno ̈tigt ho ̈chstens drei Tupel.
