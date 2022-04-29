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


Definition 10.1 (Armstrong-Kalkül). Gegeben sei eine Menge F von funktionalen Abhängigkeiten über U . Dann wird F ⊢ X → Y für X, Y ⊆ U induktiv definiert durch:
© Springer-Verlag GmbH Deutschland, ein Teil von Springer Nature 2019 189 T. Studer, Relationale Datenbanken,
https://doi.org/10.1007/978- 3- 662- 58976- 2_10
 
190 10 Berechnung von Normalformen
 1.ElementevonF. IstX→Y einElementvonF,sogiltF ⊢X→Y. 2. Reflexivität. Ist Y eine Teilmenge von X, so gilt F ⊢ X → Y . 3.Augmentation. AusF⊢X→YundZ⊆UfolgtF⊢XZ→YZ. 4.Transitivität. AusF ⊢X→Y undF ⊢Y →ZfolgtF ⊢X→Z.
Beispiel10.2. WirbetrachtennochmalsdieSituationausBeispiel9.28mit U := {Autor, Jahrgang, Titel}
F1 := {Autor → Jahrgang}. Somit gilt mit Regel Elemente von F
F1 ⊢Autor→Jahrgang. Dann folgt mit Regel Augmentation (für Z = {Autor,Titel})
F1 ⊢ {Autor, Titel} → {Autor, Jahrgang, Titel}.
Die nächsten beiden Theoreme besagen, dass Herleitbarkeit im Armstrong-Kalkül und
logische Folgerung für funktionale Abhängigkeiten übereinstimmen.
Theorem 10.3 (Armstrong-Kalkül, Korrektheit). Ist F eine Menge von funktionalen Abhängigkeiten über U , so gilt für alle X, Y ⊆ U
F ⊢ X → Y 􏰇⇒ F |􏰇 X → Y.
Dieses Theorem wird durch einfache Induktion nach der Länge der Herleitung im Armstrong-Kalkül gezeigt. Ist die funktionale Abhängigkeit X → Y ein Element von F odergiltY ⊆ X,soistF |􏰇 X → Y trivialerweiseerfüllt.WurdeF ⊢ X → Y durch Augmentation oder Transitivität erschlossen, so folgt die Behauptung aus der Induktionsvoraussetzung mit Hilfe von Tupelberechnungen.
Anmerkung 10.4. Für die Korrektheit des Armstrong-Kalküls ist es wesentlich, dass wir die Erfüllung einer funktionalen Abhängigkeit via (9.1) definieren und nicht (analog zu unique Constraints) die Bedingung
s[X] = t[X] 􏰇⇒ s[Y] ≃ t[Y] (10.1) verwenden. Um dies zu zeigen, definieren wir das Schema
S := (BuchId, Autor, Jahrgang)

## 10.1 Armstrong-Kalkül 
191 mit den funktionalen Abhängigkeiten
F := {BuchId → Autor, Autor → Jahrgang}. Wir betrachten nun folgende Instanz von S : Werke
BuchId Autor Jahrgang 1 null 1751
1 null 1765

Wir nehmen nun an, dass die Erfüllbarkeit von funktionalen Abhängigkeiten mit Hilfe von (10.1) definiert ist. 

Damit finden wir:
1. dieRelationWerkeerfülltBuchId→Autor,
2. dieRelationWerkeerfülltAutor→Jahrgang,
3. aber die Relation Werke erfüllt BuchId → Jahrgang nicht.
4. 
Das heisst, mit (10.1) ist die Transitivitätsregel des Armstrong-Kalküls nicht korrekt.

Theorem 10.5 (Armstrong-Kalkül, Vollständigkeit). Ist F eine Menge von funktiona-len Abhängigkeiten über U , so gilt für alle X, Y ⊆ U
F |􏰇 X → Y 􏰇⇒ F ⊢ X → Y.

Wir verzichten hier auf den Beweis dieses Vollständigkeitssatzes. 

Stattdessen betrachten wir sofort eine unmittelbare Folgerung aus der Korrektheit und Vollständigkeit des Armstrong-Kalküls.

Korollar 10.6 (Charakterisierung der Hülle F+). Ist F eine Menge von funktionalen Abhängigkeiten über U, so gilt + Def inition 9.12 Theorems 10.3, 10.5
F = { X → Y | F |􏰇 X → Y } = { X → Y | F ⊢ X → Y } .

Beispiel 10.7. Im Beispiel 10.2 haben wir im Armstrong-Kalkül
F1 ⊢ {Autor, Titel} → {Autor, Jahrgang, Titel} hergeleitet. Mit obigem Korollar folgt nun daraus
   
192 10 Berechnung von Normalformen {Autor,Titel} → {Autor,Jahrgang,Titel} ∈ F1+.
Es folgen einige Deduktionsregeln für den Armstrong-Kalkül, die recht wichtig sind und sich mit den Regeln aus Definition 10.1 leicht beweisen lassen.
Theorem10.8. IstFeineMengevonfunktionalenAbhängigkeitenüberU,sogiltfüralle X,Y,Z ⊆ U:
1.Vereinigung. 2.Zerlegung. 3.Einfachheit.

F ⊢X→Y undF ⊢X→Z 􏰇⇒ F ⊢X→YZ,
F ⊢X→Y undZ⊆Y 􏰇⇒ F ⊢X→Y1Y2...Yn ⇐⇒
F ⊢X→Z.
F ⊢X→Yi füralle1≤i≤n.

Die dritte Aussage dieses Theorems folgt unmittelbar aus der Vereinigungs- und Zer- legungseigenschaft. 

Sie besagt, dass jede funktionale Abhängigkeit durch funktionale Abhängigkeiten mit einelementigen rechten Seiten ausgedrückt werden kann.
Definition10.9(EinfachefunktionaleAbhängigkeit). FunktionaleAbhängigkeitenmit einelementigen rechten Seiten werden als einfache funktionale Abhängigkeiten bezeich- net.
10.2 Hüllenberechnungen
Häufig ist es für das Design einer Datenbank wesentlich, ob für eine gegebene Menge F von funktionalen Abhängigkeiten und für Attributmengen X und Y die Beziehung F ⊢ X → Y gilt. Da wir andererseits wissen, dass
F⊢X→Y ⇐⇒ X→Y∈F+, könnten wir im Prinzip die Frage, ob F ⊢ X → Y der Fall ist, dadurch beantworten, dass wir die Menge F+ systematisch auflisten. Dieses Vorgehen ist jedoch in der Regel unrealistisch, da F+ für eine n-elementige Menge F im schlimmsten Fall O(2n) viele Elemente besitzen kann.
Beispiel10.10. WirbetrachtendieMenge
F :={A→B1, A→B2, ..., A→Bn}.

Durch mehrfache Anwendung der Vereinigungseigenschaft aus Theorem 10.8 erhalten wir dann sehr leicht, dass F + mindestens 2n − 1 Elemente besitzt.
In Definition 9.12 haben wir die Hülle von einer Menge von funktionalen Abhängig- keiten betrachtet. Jetzt definieren wir die Hülle von einer Menge von Attributen.
 
10.2 Hüllenberechnungen 193
 Definition 10.11 (Attributhülle X+). Gegeben seien eine Menge F von funktionalen Abhängigkeiten über der universellen Menge U sowie eine Menge X ⊆ U. Die Attributhülle X+ von X unter F ist dann definiert durch
X+ := {A ∈ U | F ⊢ X → A}.
Im folgenden Lemma geben wir nun eine weitere charakterisierende Eigenschaft von X+
an und betrachten im Anschluss daran einen Algorithmus zur Berechnung von X+. Lemma 10.12. Für alle Mengen F von funktionalen Abhängigkeiten über der universel-
len Menge U sowie für alle Mengen X, Y ⊆ U gilt
F ⊢ X → Y ⇐⇒ Y ⊆ X+.
Beweis. Es sei Y die Attributmenge {A1, A2, . . . , An}. Wir zeigen nun zuerst die Richtung von links nach rechts. Es gelte also F ⊢ X → Y . Aufgrund der Zerlegungseigenschaft ausTheorem10.8folgtF ⊢X→Ai füralle1≤i≤n.DiesergibtY ⊆X+.
Um die Richtung von rechts nach links zu zeigen, nehmen wir Y ⊆ X+ an. MitderDefinitionvonX+ folgtdarausF ⊢ X → Ai füralle1 ≤ i ≤ n. Mit der Vereinigungseigenschaft aus Theorem 10.8 erhalten wir also unmittelbar F⊢X→Y. ⊓⊔
Zusammen mit Theorem 10.5 erlaubt uns dieses Lemma also, die Frage nach F |􏰇 X → Y auf die Frage nach Y ⊆ X+ zu reduzieren. Diese Überlegung bildet die Grundlage des folgenden Algorithmus.
Algorithmus zur Berechnung von X+
Gegeben seien eine universelle Menge U von Attributen, eine Menge F von funktionalen Abhängigkeiten über U sowie eine Menge X ⊆ U . Folgender Algorithmus berechnet die Attributhülle X+ von X unter F :
EINGABE: F, X
R:=X; alt_R:=∅;
WHILE R ̸= alt_R DO alt_R := R;
FOREACHV →W INF DO
IFV ⊆RTHENR := R∪W
AUSGABE: X+ := R

194 10 Berechnung von Normalformen
 Es ist leicht zu sehen, dass der oben angegebene Algorithmus im schlimmsten Fall qua- dratisch in der Anzahl der Elemente von F ist. Es gibt sogar einen etwas komplizierteren Algorithmus zur Berechnung der Attributhülle von X unter F , der nur linear in der Grösse von F ist.
Beispiel 10.13. Bezeichne U die Menge der Attribute {A, B, C, D, E, F, G}, F die Menge der funktionalen Abhängigkeiten
{AC→G, BD→CE, E→A, G→BF} undXdieTeilmenge{C,E}vonU.DannnimmtRbeiderBerechnungvonX+ imobigen
Algorithmus der Reihe nach folgende Werte an:
{C,E}, {C,E,A}, {C,E,A,G}, {C,E,A,G,B,F}. 10.3 Minimale Überdeckungen
In diesem Abschnitt betrachten wir Überdeckung und Äquivalenz von Mengen funktio- naler Abhängigkeiten, beschäftigen uns mit einem Äquivalenztest und studieren minimale Überdeckungen.
Definition 10.14. Gegeben seien Mengen F und G von funktionalen Abhängigkeiten über U.
1. G überdeckt F, in Zeichen F ≤ G, falls F+ ⊆ G+.
2. F und G sind äquivalent, falls F und G sich gegenseitig überdecken, das heisst
F≃G :⇐⇒ F≤G∧G≤F.
Aufgrund früherer Überlegungen wissen wir, dass in der Regel die Äquivalenz von F und G nicht dadurch getestet werden sollte, dass wir F + und G+ berechnen und auf Gleichheit untersuchen. Stattdessen betrachten wir zuerst ein Lemma und dann ein effizienteres Verfahren zur Abklärung von Äquivalenzen.
Lemma 10.15. Gegeben seien Mengen F und G von funktionalen Abhängigkeiten über U. Dann gilt
F⊆G+ ⇐⇒ F≤G.
Beweis. Die Richtung von rechts nach links ist offensichtlich. Um die Umkehrung zu beweisen, nehmen wir F ⊆ G+ an. Damit gilt
 
10.3 Minimale Überdeckungen 195
 F+ ={Y →Z|F ⊢Y →Z}
⊆{Y →Z|G+ ⊢Y →Z}=(G+)+ =G+.
Daraus folgt mit der vorhergehenden Definition sofort die Behauptung, dass F ≤ G gilt. ⊓⊔
Algorithmen für Überdeckungs- und Äquivalenztest
Den Ausgangspunkt bilden Mengen F und G von funktionalen Abhängigkeiten über U. Mit folgendem Algorithmus können wir entscheiden, ob die Menge G die Menge F überdeckt:
EINGABE: F, G.
ÜberprüfefürjedesY →Z∈F,obY →Z∈G+ durch:
Berechne Y+ unter G und teste Z ⊆ Y+.
Falls dies immer der Fall ist,
AUSGABE: F ≤ G; anderenfalls AUSGABE: F ̸≤ G.
Damit erhalten wir natürlich auch einen Algorithmus für den Test der Äquivalenz von F und G, indem wir sowohl F ≤ G als auch G ≤ F überprüfen.
Lemma 10.16. Jede Menge F von funktionalen Abhängigkeiten über U ist zu einer Menge G äquivalent, die nur einfache funktionale Abhängigkeiten enthält, d. h. funktionale Abhängigkeiten mit einelementigen rechten Seiten.
Beweis. Wir gehen aus von einer Menge F von funktionalen Abhängigkeiten über U und definieren
GF := {X→A|∃Y(X→Y ∈F undA∈Y)}.
Aufgrund der Zerlegungseigenschaft folgt X → A ∈ F + für alle A und Y mit A ∈ Y und X→Y ∈F.FolglichistGF ⊆F+.
Ist andererseits Y die Menge {A1, A2, . . . , An} und gilt X→Ai ∈GF füralle1≤i≤n,
so folgt mit der Vereinigungseigenschaft auch X → Y ∈ G+F . Daraus folgt F ⊆ G+F .

196 10 Berechnung von Normalformen
 AusGF ⊆ F+ undF ⊆ G+F folgtmitLemma10.15,dassF ≃ GF gilt.DaGF offensichtlich eine Menge von einfachen funktionalen Abhängigkeiten ist, haben wir unser Lemma bewiesen. ⊓⊔
Definition 10.17. Eine Menge F von funktionalen Abhängigkeiten über U heisst minimal, falls folgende Bedingungen erfüllt sind:
1. F enthält nur einfache funktionale Abhängigkeiten.
2. Keine funktionale Abhängigkeit in F ist redundant, d. h.
(∀X → A ∈ F )(F \ {X → A} ̸≃ F ). (M2) 3. Kein Attribut auf der linken Seite einer funktionalen Abhängigkeit aus F ist redundant,
d. h.
(∀X→A∈F)(∀Y􏰆X)(F\{X→A}∪{Y→A} ̸≃ F). (M3)
Man kann direkt sehen, ob F nur aus einfachen funktionalen Abhängigkeiten besteht. Die Überprüfung auf Redundanz der funktionalen Abhängigkeiten von F geschieht durch das Testen auf
A∈X+ unter F\{X→A}
für alle X → A ∈ F . Schliesslich kann man auf Redundanz bei den Attributen auf der
linken Seite testen, indem wir für alle X → A ∈ F und Y 􏰆 X feststellen, ob A∈Y+ unter F.
Diese drei Punkte liefern damit ein Verfahren, um abzuklären, ob F minimal ist.
Definition 10.18. Gegeben sei eine Menge F von funktionalen Abhängigkeiten über U . Eine minimale Überdeckung von F ist eine minimale Menge von funktionalen Abhängig- keiten, welche zu F äquivalent ist.
In einem nächsten Schritt geben wir nun einen Algorithmus an, der für jede Menge F von funktionalen Abhängigkeiten über U eine minimale ÜberdeckungMU(F) von F berechnet.

10.3 Minimale Überdeckungen 197
 Algorithmus für minimale Überdeckungen
EINGABE: Eine Menge F von funktionalen Abhängigkeiten über U.
1. Spalte alle nicht-einfachen funktionalen Abhängigkeiten in F auf. Nenne die neue Menge F′.
2. Entferne sukzessive alle redundanten Attribute im Sinne von (M3) der vorhergehenden Definition aus F′. Nenne die neue Menge F′′.
3. Entferne sukzessive alle redundanten funktionalen Abhängigkeiten im Sinne von (M2) der vorhergehenden Definition aus F′′. Nenne die neue Menge F′′′.
AUSGABE: MU(F) := F′′′.
Lemma 10.19. Für jede Menge F von funktionalen Abhängigkeiten über U ist MU(F )
eine minimale Überdeckung von F .
Wir verzichten auf die explizite Angabe eines Beweises dieses Lemmas, da er sich recht direkt aus der Beschreibung des Algorithmus zur Berechnung von MU(F ) und den begleitenden Überlegungen ergibt.
Beispiel 10.20. Wir gehen aus von einer Menge F von funktionalen Abhängigkeiten über der Attributmenge {A, B, C} mit
F = {AB→C,A→AB,B→A}. Nun wenden wir den obigen Algorithmus an.
1. Schritt: Die einzige nicht-einfache funktionale Abhängigkeit in F ist A → AB. Wir spalten diese auf und erhalten so die Menge
F′ = {AB →C, A→A, A→B, B →A}.
2. Schritt: Wir testen, ob A redundant in AB → C ist. Dazu überprüfen wir, ob
C∈{B}+ unter F′
gilt. Da {B}+ unter F′ die Menge {A, B, C} ist, ist dies der Fall. Daher ist A redundant in AB → C und wird gestrichen. Weitere redundante Attribute auf linken Seiten gibt es nicht. Also erhalten wir
F′′ = {B →C, A→B, B →A, A→A}.

198 10 Berechnung von Normalformen
 3. Schritt: Wir entfernen alle redundanten funktionalen Abhängigkeiten aus F′′. Offen- sichtlich gilt
A∈{A}+ unter F′′\{A→A}.
Folglich ist A → A in F ′′ redundant und wird entfernt. Weitere Redundanzen gibt es
dann nicht mehr. Es folgt also
MU(F) = {B →C, A→B, B →A}.
Anmerkung 10.21. Sei F eine Menge von funktionalen Abhängigkeiten. Dann kann es mehrere minimale Überdeckungen von F geben. D. h. im Allgemeinen ist die minimale Überdeckung von F nicht eindeutig.
Betrachte zum Beispiel die beiden Mengen von funktionalen Abhängigkeiten über der Attributmenge {A, B, C}:
F1 :={A→B, B →A, A→C, C →A}, F2 :={A→B, B →C, C →A}.
Beide Mengen sind offensichtlich minimal und es gilt F1+ = F2+.
10.4 Zerlegungen in BCNF und 3NF
In Theorem 9.34 haben wir gesehen:
1. jedes Schema kann verlustfrei in BCNF zerlegt werden;
2. jedes Schema kann verlustfrei und abhängigkeitserhaltend in 3NF zerlegt werden.
In diesem Abschnitt wollen wir nun Algorithmen angeben, um solche Zerlegungen zu erzeugen. Dabei werden wir Attributmengen wie folgt als Schemata betrachten: Eine Attributmenge X kann für ein beliebiges Schema stehen, welches alle Attribute aus X enthält.
Algorithmus für die BCNF-Zerlegung
Gegeben seien ein Relationenschema S mit einer Menge von funktionalen Abhängigkei- ten F . Der folgende Algorithmus berechnet eine Zerlegung Z von S , welche in BCNF bezüglich F ist.
 
10.4 Zerlegungen in BCNF und 3NF 199
 EINGABE: S, F
Z :={S}
WHILEes gibt Si ∈ Z mit Si nicht in BCNF bez. ΠSi (F)DO wähle ein solches Si
wähle disjunkte X, Y, Z ⊆ Si mit
AUSGABE: Z
X∪Y∪Z=Si und
X→Y∈F+ und
X → A ∈/ F + f ü r a l l e A ∈ Z 􏰈􏰉􏰊􏰋
Z:= Z\{Si} ∪ X∪Y,X∪Z
Die Grundidee dieses Algorithmus ist folgende. Wähle ein Schema Si welches die BCNF Bedingungen verletzt bezüglich einer funktionalen Abhängigkeit X → Y. Das Schema Si wird dann gemäss Abb. 10.1 in zwei Schemata zerlegt.
Weil X → Y ∈ F+ erfüllt sein muss, garantiert Lemma 9.19, dass diese Zerlegung von Si in {X ∪ Y, Si \ Y } verlustfrei ist. Dieser Schritt wird solange wiederholt, bis alle Schemata der Zerlegung in BCNF sind.
Beispiel10.22. WirbeginnenmitdemSchemaausBeispiel9.32,welchesBCNFverletzt. Wir betrachten also
S3 = (Stadt,Str,PLZ) 􏰊􏰋
F3 = {Stadt, Str} → {PLZ}, {PLZ} → {Stadt} .
Wir beginnen nun mit Z := {S3}. Es gilt S3 ∈ Z ist nicht in BCNF bezüglich F3. Wir
wählen nun
X := {PLZ} Y := {Stadt} Z := {Str}.
E s g i l t X ∪ Y ∪ Z = S 3 u n d X → Y ∈ F 3+ u n d X → S t r ∈/ F 3+ . W i r s e t z e n Z n e u a u f
Abb.10.1 BCNFZerlegung
􏰊􏰋
(PLZ,Stadt), (PLZ,Str) .
Y X i \(X ∪Y)
  
200 10 Berechnung von Normalformen
 Jetzt sind alle Elemente von Z in BCNF und der Algorithmus gibt die Zerlegung Z als Resultat zurück.
Es lässt sich zeigen, dass ein Algorithmus, der iterativ ein Schema in zwei Schemata zerlegt, im Allgemeinen nicht eine abhängigkeitserhaltende Zerlegung erzeugen kann. Somit benötigen wir eine etwas komplexere Methode um eine abhängigkeitserhaltende Zerlegung in 3NF zu finden. Dabei benutzen wir vorgängig Lemma 10.19, um zu einer gegebenen Menge F von funktionalen Abhängigkeiten eine minimale Überdeckung zu berechnen.
Algorithmus für die 3NF-Zerlegung
Gegeben seien ein Schema S sowie eine minimale Menge F von funktionalen Abhän- gigkeiten. Für jede Abhängigkeit X → A ∈ F definieren wir ein Schema SX→A, so dass
SX→A =X∪{A}
im mengentheoretischen Sinn.
EINGABE: S, F
Z := {SX→A | X → A ∈ F }
IF kein SX→A ∈ Z enthält Schlüssel für S bez.F THEN wähle Schema K , welches Schlüssel für S ist
Z := Z ∪ {K }
AUSGABE: Z
Die so erhaltene Ausgabemenge Z ist dann die gewünschte Zerlegung von S in 3NF
bezüglich F .
Beispiel 10.23. Wir betrachten das Schema aus Beispiel 9.30, welches nicht in dritter
Normalform ist. Wir haben
S2 =(BuchId,Autor,Jahrgang,Titel)
􏰊􏰋
F2 = {BuchId} → {Autor, Jahrgang, Titel}, {Autor} → {Jahrgang} . Zuerst berechnen wir die minimale Überdeckung MU(F2) von F2.

10.4 Zerlegungen in BCNF und 3NF 201
 1. Durch Aufspalten erhalten wir
F2′ :={BuchId→Autor,BuchId→Jahrgang
BuchId → Titel, Autor → Jahrgang }.
2. Redundante Attribute entfernen. Die linken Seiten sind alle ein-elementig. Es können
also keine Attribute entfernt werden. Somit haben wir
F′′ := F′. 22
3. Redundante Abhängigkeiten entfernen. Wir finden
Jahrgang ∈ BuchId+ unter F ′′ \ {BuchId → Jahrgang}. 2
Somit gilt
und wir setzen
F ′′ \ {BuchId → Jahrgang} ≃ F ′′ 22
MU(F2 ) := F ′′′ := F ′′ \ {BuchId → Jahrgang}. 22
Als Input für den 3NF-Algorithmus verwenden wir nun S2 und MU(F2 ). Im ersten Schritt erhalten wir so die Zerlegung
􏰊􏰋
Z = {BuchId, Autor}, {BuchId, Titel}, {Autor, Jahrgang} .
Das Schema {BuchId,Autor} ∈ Z enthält einen Schlüssel für S2 bezüg- lich MU(F2 ). Somit müssen wir im zweiten Schritt kein Schema hinzufügen.
Damit ist Z eine verlustfreie und abhängigkeitserhaltende Zerlegung des Schemas S2 in die dritte Normalform.
Anmerkung 10.24. Die Zerlegung Z im obigen Beispiel ist offensichtlich nicht optimal. Die beiden Schemata
{BuchId,Autor} und {BuchId,Titel}
könnten einfach zusammengefasst werden.
Dieser Effekt entsteht, weil eine minimale Überdeckung gemäss Definition aus einfa-
chen funktionalen Abhängigkeiten besteht. Wir könnten nach der Berechnung vonMU(F2) die Abhängigkeiten mit gleichen linken Seiten zusammenfassen zu

202 10 Berechnung von Normalformen
 MU′(F2) := 􏰊{BuchId} → {Autor,Titel}, {Autor} → {Jahrgang}􏰋
und diese Menge als Input für den NF3-Algorithmus verwenden. Dies würde etwas bessere
Ergebnisse liefern.
Anmerkung 10.25. Es gibt eine weitere Konstellation, in welcher der 3NF Algorithmus nicht zu einer optimalen Zerlegung führt. Wir betrachten nochmals das Schema
S3 = (Stadt,Str,PLZ) 􏰊􏰋
F3 = {Stadt, Str} → {PLZ}, {PLZ} → {Stadt} . Der Algorithmus liefert die Zerlegung
􏰊􏰋
(Stadt, Str, PLZ), (Stadt, PLZ) .
Diese Zerlegung erfüllt zwar die 3NF Bedingungen, ist aber nicht optimal. Offensichtlich ist das Schema (Stadt, PLZ) im Schema (Stadt, Str, PLZ) enthalten und damit über- flüssig. Wir könnten den Algorithmus verbessern, indem wir am Ende noch überprüfen, ob es S′,S′′ ∈ Z gibt, so dass S′ 􏰆 S′′ gilt. Falls dies der Fall ist, entfernen wir S′ aus Z .
Beachte, dass in diesem Beispiel die funktionale Abhängigkeit
{PLZ} → {Stadt} (10.2)
für beide Schemata der Zerlegung gilt. Das heisst, sowohl
(Stadt, Str, PLZ) als auch (Stadt, PLZ)
müssen (10.2) erfüllen. Damit können wir (Stadt,PLZ) aus der Zerlegung entfernen, ohne dass Abhängigkeiten verloren gehen.
Beispiel 10.26. In diesem Beispiel zeigen wir, weshalb wir möglicherweise ein Schema K , welches ein Schlüssel für S ist, zu der Zerlegung in 3NF hinzufügen müssen. Wir betrachten ein Schema
S := ( A, B, C ) mit der Menge von funktionalen Abhängigkeiten
F := { B → C }.

Weiterführende Literatur 203
 Wir wenden nun den Algorithmus zur Zerlegung in 3NF an. Nach dem ersten Schritt erhalten wir
􏰊􏰋
Z = {B,C} ,
da B → C die einzige funktionale Abhängigkeit in F ist. Wir sehen, dass die Menge Z nach diesem ersten Schritt noch nicht alle Attribute aus S abdeckt. Die Menge Z ist also noch keine Zerlegung von S . Der Algorithmus korrigiert dies im 2. Schritt, indem er noch einen Schlüssel K für S zu Z hinzufügt. Der einzige Schlüssel für S ist {A, B} und wir erhalten somit
􏰊􏰋
Z= {B,C},{A,B} als 3NF–Zerlegung des Schemas S .
Mit diesem Beispiel beschliessen wir dieses Buch und hoffen, dass Sie, liebe Leserin- nen und Leser, das Wissen über relationale Datenbanken persistent gespeichert haben und effizient darauf zugreifen können.
Weiterführende Literatur1
1. Armstrong, W.W.: Dependency structures of data base relationships. In: IFIP Congress, S. 580–583 (1974)
2. Bernstein, P.A.: Synthesizing third normal form relations from functional dependencies. ACM Trans. Database Syst. 1(4), 277–298 (1976). https://doi.org/10.1145/320493.320489
3. Biskup, J., Dayal, U., Bernstein, P.A.: Synthesizing independent database schemas. In: Procee- dings of the 1979 ACM SIGMOD International Conference on Management of Data, SIGMOD ’79, 143–151. ACM (1979). https://doi.org/10.1145/582095.582118
4. Tsou, D.M., Fischer, P.C.: Decomposition of a relation scheme into Boyce-Codd normal form. SIGACT News 14(3), 23–29 (1982). https://doi.org/10.1145/990511.990513
  1Armstrong [1] präsentierte seinen Kalkül zur Beschreibung von funktionalen Abhängigkeiten 1974. Bernstein [2] und Biskup et al. [3] studieren Synthesealgorithmen, um verlustfreie und abhängigkeitserhaltende Zerlegungen in dritte Normalform zu erzeugen. Die Dekomposition eines Schemas in Boyce-Codd Normalform wird unter anderem von Tsou und Fischer [4] untersucht.
