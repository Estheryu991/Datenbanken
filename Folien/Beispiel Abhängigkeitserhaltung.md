Wir betrachten wieder
A := (BId, Name, Adresse, Datum)
mit den Abhängigkeiten
F := 
{Bid} → {Name, Adresse, Datum}, {Name} → {Adresse}
	
.
und der Zerlegung in {A1, A2} mit
A1 := (BId, Name, Datum) A2 := (Name, Adresse) .
Es gilt
{Bid} → {Name, Datum} ∈ ΠA1
(F)
{Name} → {Adresse} ∈ ΠA2
(F) .
Also
{Bid} → {Name, Adresse, Datum} ∈ (ΠA1
(F) ∪ ΠA2
(F))+

hülle : addresse wieder produktionen 
