Gegeben sei die Menge
F = {W → X, W → Y, XY → Z}
von funktionalen Abhängigkeiten. Dann gilt unter anderem:
1 F |= W → X,
2 F |= W → XY ,
3 F |= W → Z.

Wir betrachten Postleitzahlen und treffen folgende vereinfachenden Annahmen:
## 1 Jede Stadt ist eindeutig durch ihre Postleitzahl bestimmt. D.h. es gibt
keine zwei Städte mit derselben Postleitzahl.
## 2 Jede Postleitzahl ist eindeutig durch Stadt und Strasse bestimmt.
D.h. die Postleitzahl ändert sich innerhalb einer Strasse nicht.
Entsprechend wählen wir Attribute Stadt, Str und PLZ sowie das Schema.
$$ S = (Stadt, Str, PLZ)$$

mit der dazugehörigen Menge.

$${Stadt, Str} → {PLZ}, {PLZ} → {Stadt}$$
	
von funktionalen Abhängigkeiten. Mit der obigen Definition folgt sofort,
dass die Attributmengen {Stadt, Str} und {Str, PLZ} Schlüssel von S sind.


A := (BId, Name, Adresse, Datum) wird zerlegt in {A1, A2} mit
$$ A1 := (BId, Name, Datum) $$
$$ A2 := (Name, Adresse) $$.

Zu A gehört die Menge von funktionalen Abhängigkeiten
$$ F := {Bid} → {Name, Adresse, Datum}, {Name} → {Adresse}$$.
	
Wir finden A1 ∩ A2 = {Name}. Also gilt
$$ A1 ∩ A2 → A2 ∈ F_+ $$

Es folgt, dass die Zerlegung verlustfrei ist.
