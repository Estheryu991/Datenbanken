Sei S := (Name, Marke, Farbe) mit Zerlegung
S1 := (Name, Marke) und S2 := (Marke, Farbe) .
Betrachte die Instanz Autos von S und ihre Zerlegung:
Autos
Name Marke Farbe
Eva Audi schwarz
Tom Audi rot
πS1 (Autos)
Name Marke
Eva Audi
Tom Audi
πS2 (Autos)
Marke Farbe
Audi schwarz
Audi rot
Damit erhalten wir:
πS1 (Autos) on πS2 (Autos)
Marke Name Farbe
Audi Eva schwarz
Audi Eva rot
Audi Tom schwarz
Audi Tom rot

Sei
S ein Schema,
{S1, . . . , Sk} eine Zerlegung von S und
F eine Menge von funktionalen Abhängigkeiten über den Attributen
von S.
Wir sagen, dass die Zerlegung {S1, . . . , Sk} einen verlustfreien Verbund
bezüglich F besitzt , falls für alle Instanzen R von S, die F erfüllen, gilt,
dass
R =S πS1
(R) on . . . on πSk
(R) .
In diesem Fall sprechen wir auch von einer verlustfreien Zerlegung des
Schemas S bezüglich F
