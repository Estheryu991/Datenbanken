# klass


# Optimierung 

Programmers waste enormous amounts of time thinking about, or
worrying about, the speed of noncritical parts of their programs,
and these attempts at efficiency actually have a strong negative impact when debugging and maintenance are considered. We should
forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil. Yet we should not pass
up our opportunities in that critical 3%
Donald Knuth, Structured Programming with Goto Statements.
Computing Surveys 6:4 (December 1974), pp. 261–301

# Tecknicken 

Indizes
Hilfsobjekte, welche die Suche nach bestimmten Daten vereinfachen
Logische Optimierung
eine gegebene Abfrage so umformulieren, dass sie dasselbe Resultat liefert
aber effizienter berechnet werden kann, beispielsweise weil kleinere
Zwischenresultate erzeugt werden
Physische Optimierung
effiziente Algorithmen auswählen, um die Operationen der relationalen
Algebra zu implementieren

# Indizes


# Sequentielles Abarbeiten
SELECT *
FROM Filme
WHERE Jahr = 2010

# Index für SELECT * FROM Filme WHERE Jahr = 2010

# Noch besser: Θ-Join
πD.Name(D onD.DozId=A.Assistiert (σA.Name=’Meier’(A))) .

# Abfrageplan:
1 Wie bisher wird zuerst die passende Assistentin selektiert.
2 Damit kennen wir den Wert ihres Assistiert Attributs und wissen,
welchen Wert das DozId Attribut der gesuchten Dozierenden haben
muss.
3 Wir können also die entsprechende Dozierende mit Hilfe des Indexes
auf dem Attribut DozId effizient suchen.
4 Dieser Index existiert, weil DozId der Primärschlüssel ist.

# Abschätzungen
Annahme: 10 Dozierende, 50 Assistierende
πD.Name(σA.Name=’Meier’∧D.DozId=A.Assistiert(D × A)) .
Kartesisches Produkt: 500 Tupeln
Selektion aus diesen 500 Tupeln: 1 Tupel

# Besser:
πD.Name(σD.DozId=A.Assistiert(D × σA.Name=’Meier’(A))) .
Selektion aus 50 Tupeln: 1 Tupel
Kartesisches Produkt: 10 Tupel
Selektion aus diesen 10 Tupeln: 1 Tupel

# Beispiel
Wir werden die Tabellen nur durch den Anfangsbuchstaben ihres Namens
bezeichnen.
Finden den Namen derjenigen Dozierenden, der die Assistentin Meier
zugeordnet ist.
SQL Query:
SELECT D.Name
FROM D, A
WHERE A.Name = ’Meier’ AND D.DozId = A.Assistiert
Kanonische Übersetzung:
πD.Name(σA.Name=’Meier’∧D.DozId=A.Assistiert(D × A)) .$


# Äquivalenz von relationalen Ausdrücken
Wir schreiben
E1 ≡ E2 ,
um auszudrücken, dass die relationalen Ausdrücke E1 und E2
dieselben Attribute enthalten und
bis auf die Reihenfolge der Spalten gleich sind.


# Umformungen 1

1. Aufbrechen und Vertauschen von Selektionen. Es gilt
σΘ1∧Θ2
(E) ≡ σΘ1
(σΘ2
(E)) ≡ σΘ2
(σΘ1
(E)) .
2. Kaskade von Projektionen. Sind A1, . . . , Am und B1, . . . , Bn Attribute
mit
{A1, . . . , Am} ⊆ {B1, . . . , Bn} ,
so gilt
πA1,...,Am(πB1,...,Bn
(E)) ≡ πA1,...,Am(E) .
3. Vertauschen von Selektion und Projektion. Bezieht sich das
Selektionsprädikat Θ nur auf die Attribute A1, . . . , Am, so gilt
πA1,...,Am(σΘ(E)) ≡ σΘ(πA1,...,Am(E)) .


# Umformungen 2

4. Kommutativität. Es gelten
E1 × E2 ≡ E2 × E1
E1 on E2 ≡ E2 on E1
E1 onΘ E2 ≡ E2 onΘ E1 .
5. Assoziativität. Es gelten
(E1 × E2) × E3 ≡ E1 × (E2 × E3)
(E1 on E2) on E3 ≡ E1 on (E2 on E3) .
Bezieht sich die Joinbedingung Θ1 nur auf Attribute aus E1 sowie E2
und die Joinbedingung Θ2 nur auf Attribute aus E2 sowie E3, so gilt
(E1 onΘ1 E2) onΘ2 E3 ≡ E1 onΘ1
(E2 onΘ2 E3) .


# Umformungen 3

6. Vertauschen von Selektion und kartesischem Produkt. Bezieht sich das
Selektionsprädikat Θ nur auf die Attribute aus E1, so gilt
σΘ(E1 × E2) ≡ σΘ(E1) × E2 .
7. Vertauschen von Projektion und kartesischem Produkt. Sind
A1, . . . , Am Attribute von E1 und B1, . . . , Bn Attribute von E2, so
gilt
πA1,...,Am,B1,...,Bn
(E1 × E2) ≡ πA1,...,Am(E1) × πB1,...,Bn
(E2) .
Dieselbe Idee funktioniert auch bei Θ-Joins. Falls sich die Join
Bedingung Θ nur auf die Attribute A1, . . . , Am und B1, . . . , Bn
bezieht, so gilt
πA1,...,Am,B1,...,Bn
(E1 onΘ E2) ≡ πA1,...,Am(E1) onΘ πB1,...,Bn
(E2) .

(Ein Beispiel mit die Umteilen. ) 

# Umformungen 4

8. Selektion ist distributiv über Vereinigung und Differenz. Es gelten
σΘ(E1 ∪ E2) ≡ σΘ(E1) ∪ σΘ(E2)
σΘ(E1 \ E2) ≡ σΘ(E1) \ σΘ(E2) .

9. Projektion ist distributiv über Vereinigung. Es gilt
πA1...,
Am(E1 ∪ E2) ≡ πA1...,Am(E1) ∪ πA1...,Am(E2) .
Es ist zu beachten, dass in der Regel Projektionen nicht distributiv
über Differenzen sind.

# Projektion nicht distributiv über Differenzen

Achtung:
πA(E1 \ E2) 6≡ πA(E1) \ πA(E2)
In der Tat, seien
R = {(a, 1)} S = {(a, 2)}
über dem Schema (A, B).
Dann gilt:
πA(R \ S) = {(a)}
πA(R) \ πA(S) = {}



# 29: Projektion nicht distributiv über Differenzen
Achtung:
πA(E1 \ E2) 6≡ πA(E1) \ πA(E2)
In der Tat, seien
R = {(a, 1)} S = {(a, 2)}
über dem Schema (A, B).
Dann gilt:
πA(R \ S) = {(a)}
πA(R) \ πA(S) = {}



# 30 : Ablauf der Umformungen

1 Mittels der ersten Regel werden konjunktive Selektionsprädikate in
Kaskaden von Selektionsoperationen zerlegt.
2 Mittels der Regeln 1, 3, 6 und 8 werden Selektionsoperationen soweit
wie möglich nach innen propagiert.
3 Wenn möglich, werden Selektionen und kartesische Produkte zu
Θ-Joins zusammengefasst.
4 Mittels Regel 5 wird die Reihenfolge der Joins so vertauscht, dass
möglichst kleine Zwischenresultate entstehen.
5 Mittels der Regeln 2, 3, 7 und 9 werden Projektionen soweit wie
möglich nach innen propagiert.

# 31: Beispiel: Suche die Namen aller Assistierenden, welche die
Studierende Meier betreuen
SELECT A.Name
FROM A, AU, VS, S
WHERE S.Name = ’Meier’ AND S.MatNr = VS.MatNr AND
VS.VorlNr = AU.VorlNr AND AU.AssId = A.AssId
πA.Name
σS.Name=’Meier’∧S.MatNr=VS.MatNr∧···
×
×
×
A AU
VS
S

