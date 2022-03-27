# 10_BerechnungVonNormalformen.

In diesem Kapitel geht es um Algorithmen, die ein gegebenes Schema in Normalform
zerlegen. Dazu führen wir als erstes den Armstrong Kalkül ein, mit dem die Hülle einer
Menge von funktionalen Abhängigkeiten berechnet werden kann. Dann betrachten wir
einen Algorithmus zur Berechnung der Hülle einer Menge von Attributen unter einer
Menge von funktionalen Abhängigkeiten. Das heisst, wir berechnen all diejenigen Attri-
bute, welche von einer gegebenen Attributmenge funktional abhängig sind. Weiter geben
wir einen Algorithmus an, um eine minimale Überdeckung einer Menge von funktionalen
Abhängigkeiten zu berechnen. Schliesslich untersuchen wir einen Zerlegungsalgorithmus
um ein Schema verlustfrei in BCNF zu zerlegen, sowie einen Synthesealgorithmus um ein
Schema verlustfrei und abhängigkeitserhaltend in die dritte Normalform zu zerlegen. 

# 10.1

Die Hülle F + einer Menge F von funktionalen Abhängigkeiten wurde in Definiti-
on 9.12 unter Bezugnahme auf Erfüllbarkeit semantisch eingeführt. Hier studieren wir den
Armstrong-Kalkül. Dieser liefert ein syntaktisches Verfahren, welches die Berechnung von
F +, ausgehend von F , ermöglicht.
In diesem Kapitel bezeichnet U die Menge aller Attribute, die in den involvierten
Relationenschemata vorkommen. Ausgangspunkt für den Armstrong-Kalkül bildet eine
Menge F von funktionalen Abhängigkeiten mit Attributen aus U . Sind X, Y ⊆ U , so
schreiben wir F  X → Y , um auszudrücken, dass sich die funktionale Abhängigkeit
X → Y aus F ableiten lässt.
