Wir betrachten wieder ein Schema S, eine Zerlegung {S1, . . . , Sk} von S
sowie eine Menge F von funktionalen Abhängigkeiten über den Attributen
von S.
1 Die Projektion von F auf eine Attributmenge Z wird definiert durch

ΠZ(F) := { X → Y ∈ F+ | XY ⊆ Z } .

2. Ist T das Relationenschema (A1, . . . , An), so setzen wir
ΠT (F) := Π{A1,...,An}(F) .

3 Die Zerlegung {S1, . . . , Sk} heisst abhängigkeitserhaltende Zerlegung
von S bezüglich F, falls gilt

[k_i=1_ΠSi_(F)_+ = F+
