normalformen

In einem schlecht gewählten Datenbankschema können Einfüge, Änderungs- und Löschoperationen zu gewissen Anomalien führen. Es kann beispielsweise sein, dass für eine
Änderung mehrere Änderungsoperationen ausgeführt werden müssen oder dass gewisse
Daten gar nicht im gegebenen Schema abgespeichert werden können.
Einfach gesagt treten diese Anomalien immer dann auf, wenn ein Schema mehrere Konzepte modelliert. Um dies formal zu präzisieren, führen wir den Begriff der funktionalen
Abhängigkeit ein. Dies hilft uns, Relationenschemata so zu zerlegen, dass ein Schema nur
noch ein Konzept modelliert und damit Anomalien vermieden werden. Wir sagen dann,
das Schema ist in Normalform. In diesem Kapitel studieren wir insbesondere die dritte
Normalform (3NF) und die Boyce–Codd Normalform (BCNF). Dabei interessiert uns, ob
eine Zerlegung in eine Normalform verlustfrei und abhängigkeitserhaltend ist. Auch geben
wir den Zusammenhang zwischen 3NF und transitiven Abhängigkeiten an. 

9 Normalformen
In einem schlecht gewählten Datenbankschema können Einfüge, Änderungs- und Löschoperationen zu gewissen Anomalien führen. Es kann beispielsweise sein, dass für eine
Änderung mehrere Änderungsoperationen ausgeführt werden müssen oder dass gewisse
Daten gar nicht im gegebenen Schema abgespeichert werden können.
Einfach gesagt treten diese Anomalien immer dann auf, wenn ein Schema mehrere Konzepte modelliert. Um dies formal zu präzisieren, führen wir den Begriff der funktionalen
Abhängigkeit ein. Dies hilft uns, Relationenschemata so zu zerlegen, dass ein Schema nur
noch ein Konzept modelliert und damit Anomalien vermieden werden. Wir sagen dann,
das Schema ist in Normalform. In diesem Kapitel studieren wir insbesondere die dritte
Normalform (3NF) und die Boyce–Codd Normalform (BCNF). Dabei interessiert uns, ob
eine Zerlegung in eine Normalform verlustfrei und abhängigkeitserhaltend ist. Auch geben
wir den Zusammenhang zwischen 3NF und transitiven Abhängigkeiten an.
9.1 Anomalien
Wir beginnen mit einem Beispiel zu einer Bibliotheksdatenbank.
Beispiel 9.1. Unsere Datenbank zur Bibliotheksverwaltung besitzt zwei Schemata: B
modelliert den Buchbestand der Bibliothek, A modelliert die Ausleihen:
B := (BId, ISBN, Titel, Autor)
A := (BId, Name, Adresse, Datum)
Das Attribut BId ist eine eindeutige Id für die Bücher, welche zum Bestand der Bibliothek
gehören. Für jedes dieser Bücher wird die ISBN, der Titel und der Autor abgespeichert.
© Springer-Verlag GmbH Deutschland, ein Teil von Springer Nature 2019
T. Studer, Relationale Datenbanken,
https://doi.org/10.1007/978-3-662-58976-2_9
165
166 9 Normalformen
Bei einer Ausleihe wird die Id des ausgeliehenen Buches, der Name und die Adresse des
Benutzers, welcher das Buch ausleiht, sowie das Ausleihdatum abgespeichert. Wir nehmen
hier an, dass ein Benutzer eindeutig durch seinen Namen identifiziert ist. Ausserdem
sei BId im Schema A ein Fremdschlüssel auf das Schema B. Damit können nur Bücher
ausgeliehen werden, welche zum Bestand der Bibliothek gehören.
Dieses Schema hat den Vorteil, dass für jede Ausleihe unmittelbar auf die entsprechenden Benutzerdaten zugegriffen werden kann. Dem stehen jedoch auch einige Nachteile
gegenüber.
Änderungsanomalie (Update-Anomalie) Nehmen wir an, eine Benutzeradresse soll geändert werden. Falls dieser Benutzer mehrere Bücher ausgeliehen hat, so gibt es
mehrere Einträge mit diesem Benutzer in der A -Relation. In jedem dieser Einträge
muss nun die Adresse aktualisiert werden. Das heisst, obwohl nur die Adresse eines
Benutzers ändert, müssen mehrere Tupel aktualisiert werden. Der Grund dafür ist
natürlich die Redundanz, das mehrfache Vorhandensein, der Daten eines Bibliotheksbenutzers. Dem Vorteil der einfachen Datenbankabfrage steht also der Nachteil komplexer
Änderungsoperationen gegenüber.
Einfügeanomalie (Insertion-Anomalie) Ein neuer Benutzer kann nur erfasst werden,
falls er auch zugleich ein Buch ausleiht. Wenn sich jemand neu anmeldet ohne ein Buch
auszuleihen, dann können seine Daten (Name und Adresse) nicht in der Datenbank
eingetragen werden.
Löschanomalie (Deletion-Anomalie) Wenn ein Benutzer alle ausgeliehenen Bücher
zurückbringt, dann werden alle Daten über diesen Benutzer in der A -Relation gelöscht.
Es sind damit keine Informationen mehr über ihn gespeichert. Somit müssen bei einer
neuen Ausleihe alle Benutzerdaten wieder neu erfasst werden.
Der Grund für diese Anomalien ist, dass durch ein Schema mehrere Konzepte modelliert werden. Tatsächlich werden im Schema A sowohl Informationen über die Ausleihen
als auch über die Benutzer abgespeichert. Auch das Schema B enthält Informationen über
zwei Konzepte: nämlich den aktuellen Buchbestand und die Buchausgaben.
Um Anomalien zu vermeiden, brauchen wir also eine formale Beschreibung dieser
Sachverhalte. Dazu ist es nützlich zu studieren, welche Attribute von welchen anderen
Attributen abhängig sind. Beispielsweise sehen wir, dass im Schema B der Wert des
Attributes Adresse vom Wert des Attributes Name abhängig ist.
Im nächsten Abschnitt werden wir solche Abhängigkeiten präzise einführen und
studieren. Dies dient später dazu, Normalformen für Schemata zu definieren. Man kann
auf diese Weise zeigen, dass gewisse Anomalien nicht auftreten können, falls ein Schema
in Normalform ist.
9.2 Funktionale Abhängigkeiten 167
9.2 Funktionale Abhängigkeiten
Definition 9.2. Es seien A1,...,An Attribute. Eine funktionale Abhängigkeit (functional
dependency) auf einer Attributmenge {A1,...,An} ist gegeben durch
X → Y,
wobei X, Y ⊆ {A1,...,An}. Wir verwenden die Sprechweise eine funktionale Abhängigkeit auf einem Schema als Abkürzung für eine funktionale Abhängigkeit auf der Menge
der Attribute des Schemas.
Eine funktionale Abhängigkeit X → Y heisst trivial, falls Y ⊆ X gilt.
Um die Bedeutung von funktionalen Abhängigkeit formal einzuführen, benötigen
wir folgende Notation. Sei R eine Relation über den Attributen A1,...,An. Ferner sei
X ⊆ {A1,...,An}. Für s,t ∈ R schreiben wir
s[X] = t[X],
falls
s[Ai] = t[Ai] für alle Ai ∈ X
gilt.1
Definition 9.3 (Erfüllung funktionaler Abhängigkeiten). Gegeben sei eine Relation
R eines Schemas S . Ferner sei X → Y eine funktionale Abhängigkeit auf S .
Die Relation R erfüllt X → Y , falls für alle Tupel s,t ∈ R gilt
s[X] = t[X] ⇒ s[Y ] = t[Y ]. (9.1)
Eine funktionale Abhängigkeit X → Y drückt aus, dass wenn zwei Tupel s und t auf
allen Attributen aus X übereinstimmen, so müssen s und t auch auf allen Attributen aus Y
übereinstimmen. Oder anders ausgedrückt, wenn die Werte auf den X-Attributen gegeben
sind, dann sind die Werte auf den Y -Attributen eindeutig bestimmt.
Anmerkung 9.4. Wir wollen nun kurz auf das Problem von Null Werten im Zusammenhang mit funktionalen Abhängigkeiten eingehen. Im Beispiel 2.4 haben wir gesehen,
1Der Unterschied zur Notation in (2.2) besteht darin, dass X hier eine Menge ist und nicht eine
Sequenz. Damit können wir s[X] hier nicht als eigenständiges Tupel verwenden.
168 9 Normalformen
dass (9.1) nicht erfüllt werden kann, falls die vorkommenden Tupel Null Werte in den
Attributen aus Y enthalten.
Wir könnten dieses Problem lösen, indem wir anstelle von (9.1) die Bedingung
s[X] = t[X] ⇒ s[Y ]  t[Y ] (9.2)
verwenden. Dann haben wir jedoch das Problem, dass Null Werte in den Attributen aus
X problematisch sind, siehe Beispiel 2.7. In Anmerkung 10.4 werden wir noch im Detail
zeigen, was mit (9.2) schief geht.
Um diese Probleme mit Null Werten zu vermeiden, treffen wir nun folgende Annahme.
Annahme 9.5 In diesem und dem nächsten Kapitel enthalten alle vorkommenden Datenbanken keine Null Werte.
Anmerkung 9.6. Gegeben seien ein Schema S und eine triviale funktionale Abhängigkeit
X → Y auf S . Offensichtlich erfüllt jede Relation auf S die funktionale Abhängigkeit
X → Y .
Beispiel 9.7. Betrachte folgende Relation Ausleihen über dem Schema A aus Beispiel 9.1:
Ausleihen
BId Name Adresse Datum
11 Eva Thun 20140506
5 Eva Thun 20140804
4 Tom Bern 20140301
Die Relation Ausleihen erfüllt die funktionalen Abhängigkeiten
{BId}→{Name, Adresse, Datum} (9.3)
und
{Name}→{Adresse}. (9.4)
Die Abhängigkeit (9.3) drückt aus, dass der Wert des Attributs BId eindeutig ein Tupel
der Relation identifiziert. Die Abhängigkeit (9.4) sagt, dass Benutzer eindeutig durch ihren
Namen identifiziert werden.
Folgende funktionale Abhängigkeit ist in Ausleihen verletzt, d. h. sie ist nicht erfüllt:
{Name}→{Datum}.
9.2 Funktionale Abhängigkeiten 169
Dies zeigt sich daran, dass es zwei Tupel mit demselben Wert im Attribut Name aber
verschiedenen Werten im Attribut Datum gibt.
Anmerkung 9.8. Wir können eine funktionale Abhängigkeit X → Y über einem
Schema S als Constraint betrachten. Die entsprechende Integritätsregel verlangt dann,
dass jede Instanz R von S die Abhängigkeit X → Y erfüllen muss.
In diesem Sinne können wir unique Constraints als spezielle funktionale Abhängigkeiten darstellen (unter der Annahme, dass keine Null Werte auftreten). Gegeben sei
DB-Schema S = (A1,...,An). Ein Unique constraint
U = (Ai1 ,...,Aim )
kann durch folgende funktionale Abhängigkeit ausgedrückt werden:
{Ai1 ,...,Aim }→{A1,...,An}.
Definition 9.9. Wir führen nun eine Reihe von Abkürzungen ein um die Notation im
Zusammenhang mit funktionalen Abhängigkeiten zu vereinfachen. Es sei
S = (A1,...,An)
ein Schema und X, Y, Z ⊆ {A1,...,An}.
1. Wir verwenden Y Z für Y ∪ Z. Somit steht beispielsweise
X → Y Z für X → Y ∪ Z.
2. Wir schreiben S für {A1,...,An}. Damit betrachten wir S als ungeordnete Menge
und
X → S steht für X → {A1,...,An}.
3. Wir verwenden Ai für die einelementige Menge {Ai}. Somit steht beispielsweise
X → Ai für X → {Ai}.
Damit können wir auch
X → AiAj für X → {Ai, Aj }
schreiben.
170 9 Normalformen
Definition 9.10 (Logische Folgerung). Gegeben sei ein Schema S = (A1,...,An).
Ferner seien eine Menge F von funktionalen Abhängigkeiten über S sowie eine weitere
funktionale Abhängigkeit X → Y über S gegeben.
Wir sagen, X → Y folgt logisch aus F, in Zeichen
F | X → Y,
falls jede Instanz R von S , welche alle Abhängigkeiten in F erfüllt, auch X → Y erfüllt.
Beispiel 9.11. Gegeben sei die Menge F = {W → X, W → Y, XY → Z} von
funktionalen Abhängigkeiten. Dann gilt unter anderem:
1. F | W → X,
2. F | W → XY ,
3. F | W → Z.
Diese drei Eigenschaften ergeben sich unmittelbar aufgrund von Definitions 9.3 und 9.10
durch Betrachtung der auftretenden Tupel.
Definition 9.12 (Hülle F +). Ist F eine Menge von funktionalen Abhängigkeiten, so wird
die Hülle F + von F definiert durch
F + := {X → Y | F | X → Y }.
Wir betrachten nun funktionale Abhängigkeiten wieder als Integritätsbedingungen eines
DB-Schemas. Sei S = (A1,...,An) ein Schema mit einer Menge von funktionalen
Abhängigkeiten F. Falls F eine nicht-triviale funktionale Abhängigkeit enthält, dann gibt
es eine echte Teilmenge X von {A1,...,An}, so dass
X → {A1,...,An} ∈ F +.
Wir sind an möglichst kleinen derartigen Teilmengen interessiert, da jedes Tupel einer
Instanz von S durch die Werte in den Attributen dieser Teilmenge eindeutig identifiziert
ist.
Definition 9.13 (Schlüssel). Gegeben sei ein Schema S = (A1,...,An) mit einer
Menge von funktionalen Abhängigkeiten F. Eine Teilmenge
X ⊆ {A1, A2,...,An}
9.3 Zerlegung von Relationenschemata 171
heisst Superschlüssel für S bezüglich F, falls gilt:
X → S ∈ F +.
Ein Superschlüssel für S heisst Schlüssel für S bezüglich F, falls zusätzlich gilt:
es gibt keine echte Teilmenge Y  X mit Y → S ∈ F +.
Beispiel 9.14. Wir betrachten Postleitzahlen und treffen folgende vereinfachenden Annahmen:
1. Jede Stadt ist eindeutig durch ihre Postleitzahl bestimmt. Das heißt es gibt keine zwei
Städte mit derselben Postleitzahl.
2. Jede Postleitzahl ist eindeutig durch Stadt und Strasse bestimmt. Das heißt die
Postleitzahl ändert sich innerhalb einer Strasse nicht.
Entsprechend wählen wir Attribute Stadt, Str und PLZ sowie das Schema
S = (Stadt, Str, PLZ)
mit der dazugehörigen Menge

{Stadt, Str}→{PLZ}, {PLZ}→{Stadt}

von funktionalen Abhängigkeiten. Mit der obigen Definition folgt sofort, dass die Attributmengen {Stadt, Str} und {Str, PLZ} Schlüssel von S sind.
9.3 Zerlegung von Relationenschemata
Wir betrachten eine Strategie, um schlechte Schemata durch geeignete Zerlegungen zu
verbessern. Ein Ansatz besteht darin jedes Schema, das auf vielen Attributen basiert,
durch mehrere Schemata mit jeweils weniger Attributen zu ersetzen. Zur Erinnerung: Alle
vorkommenden Datenbanken enthalten keine Null Werte (Annahme 9.5).
Definition 9.15. Gegeben seien die Attribute A1, A2,...,An sowie das Schema
S := (A1,...,An).
Eine Zerlegung von S ist eine Menge von Relationenschemata
{(A11, A12,...,A1m1 ), . . . , (Ak1, Ak2,...,Akmk )},   
172 9 Normalformen
so dass gilt
{A11, A12,...,A1m1 }∪···∪{Ak1, Ak2,...,Akmk }={A1, A2,...,An}.
Bei einer Zerlegung dürfen die Schemata, in die das Ausgangsschema zerlegt wird,
gemeinsame Attribute besitzen.
Die Zerlegung eines Schemas soll dazu dienen, Anomalien zu vermeiden. Wir haben
im Abschn. 9.1 gesehen, dass Anomalien auftreten, wenn ein Schema mehrere Konzepte
modelliert. Wir müssen also ein gegebenes Schema so zerlegen, dass jedes Teilschema
möglichst nur noch ein Konzept beschreibt.
Beispiel 9.16. Wir betrachten das Schema
A := (BId, Name, Adresse, Datum)
aus Beispiel 9.1, welches die Ausleihen und die Benutzer modelliert. Wir können dieses
Schema in Teile A1 und A2 zerlegen, die wie folgt gegeben sind:
A1 := (BId, Name, Datum)
A2 := (Name, Adresse)
Das Schema A1 modelliert somit nur noch die Ausleihen und das Schema A2 entsprechend
die Benutzer. In dieser Zerlegung sind die Benutzerdaten nicht mehr redundant gespeichert
und es können auch Benutzer verwaltet werden, die kein Buch ausgeliehen haben. Somit
sind die Anomalien aus Abschn. 9.1 nicht mehr möglich.
Zwei wichtige Eigenschaften von Zerlegungen sind:
1. die ursprüngliche Information soll aus der Zerlegung wieder rekonstruierbar sein;
2. auf der Zerlegung sollen dieselben funktionalen Abhängigkeiten gelten wie auf dem
Ursprungsschema.
Vorerst führen wir folgende Schreibweisen ein. Sei S das Relationenschema
(A1,...,An). Zur Vereinfachung der Notation schreiben wir im Folgenden häufig
πS (R) anstelle von πA1,...,An (R).
Weiter werden wir die Gleichheit von Relationen bezüglich eines Schemas S verwenden.
Wir setzen:
R =S T :⇐⇒ πS (R) = πS (T ).
Somit heisst R =S T , dass die Relationen R und T bezüglich der Attribute aus S
dieselbe Information enthalten.
9.3 Zerlegung von Relationenschemata 173
Beispiel 9.17. Betrachten wir die Attribute Name, Marke und Farbe, sowie das Schema
S := (Name, Marke, Farbe)
mit der Zerlegung {S1, S2} gegeben durch
S1 := (Name, Marke) und S2 := (Marke, Farbe).
Ausserdem sei die Instanz Autos von S gegeben durch:
Autos
Name Marke Farbe
Eva Audi schwarz
Tom Audi rot
Es gilt dann:
πS1 (Autos)
Name Marke
Eva Audi
Tom Audi
πS2 (Autos)
Marke Farbe
Audi schwarz
Audi rot
Damit erhalten wir:
πS1 (Autos)  πS2 (Autos)
Marke Name Farbe
Audi Eva schwarz
Audi Eva rot
Audi Tom schwarz
Audi Tom rot
Es gilt also
πS1(Autos)  πS2(Autos) 
=S Autos.
Die ursprüngliche Relation kann also nicht durch einen Verbund aus den Projektionen
zurückgewonnen werden. Im konkreten Beispiel ging durch die Zerlegung folgende
Information verloren:  
174 9 Normalformen
1. Eva fährt ein schwarzes Auto,
2. Tom fährt ein rotes Auto.
Das heisst, diese Information kann aus den Daten der Zerlegung nicht mehr herausgelesen
werden.
Eine gute Zerlegung sollte keinen Informationsverlust zur Folge haben. Dies führt uns
zur nächsten Definition.
Definition 9.18 (Verlustfreie Zerlegungen). Wir gehen aus von einem Schema S , einer
Zerlegung {S1,..., Sk} von S sowie einer Menge F von funktionalen Abhängigkeiten
über den Attributen von S . Dann besitzt die Zerlegung {S1,..., Sk} einen verlustfreien
Verbund bezüglich F, falls für alle Instanzen R von S , die F erfüllen, gilt, dass
R =S πS1 (R)  ···  πSk (R).
In diesem Fall sprechen wir von einer verlustfreien Zerlegung des Schemas S bezüglich F.
Damit ist im Fall einer verlustfreien Zerlegung (bezüglich F) also die Wiedergewinnung der ursprünglichen Information aus der Zerlegung möglich. Durch geeignete
Zerlegungen kann man in vielen Fällen Redundanzen eliminieren oder zumindest ihre
Zahl verringern. Andererseits sind jedoch bei Zerlegungen im Allgemeinen mehr Joins
zur Beantwortung einer Abfrage erforderlich.
Wir geben nun ein Kriterium dafür an, dass eine Zerlegung in zwei Schemata
verlustfrei ist (ohne Beweis). Dazu führen wir folgende Schreibweise ein. Sei S das
Schema (A1,...,An). Dann verwenden wir die Bezeichnung S auch für die Menge
{A1, A2,...,An}.
Lemma 9.19. Gegeben sei ein Schema S mit einer Menge F von funktionalen Abhängigkeiten. Eine Zerlegung {S1, S2} von S ist genau dann verlustfrei bezüglich F, wenn
1. S1 ∩ S2 → S1 ∈ F + oder
2. S1 ∩ S2 → S2 ∈ F +.
Beispiel 9.20. Wir betrachten die Zerlegung unseres Bibliotheksschemas aus Beispiel 9.16. Das Schema
A := (BId, Name, Adresse, Datum)
wird zerlegt in {A1, A2} mit  
9.3 Zerlegung von Relationenschemata 175
A1 := (BId, Name, Datum)
A2 := (Name, Adresse).
Zu A gehört die Menge von funktionalen Abhängigkeiten
F :=
{BId}→{Name, Adresse, Datum}, {Name}→{Adresse}

.
Wir finden A1 ∩ A2 = {Name}. Also gilt A1 ∩ A2 → A2 ∈ F +. Mit Lemma 9.19 folgt
also, dass die Zerlegung verlustfrei ist.
Eine weitere wünschenswerte Eigenschaft von Zerlegungen ist, dass die funktionalen
Abhängigkeiten erhalten bleiben.
Definition 9.21 (Abhängigkeitserhaltende Zerlegung). Wir betrachten wieder ein
Schema S , eine Zerlegung {S1,..., Sk} von S sowie eine Menge F von funktionalen
Abhängigkeiten über den Attributen von S .
1. Die Projektion von F auf eine Attributmenge Z wird definiert durch
ΠZ(F ) := { X → Y ∈ F + | XY ⊆ Z }.
2. Ist T das Relationenschema (A1,...,An), so setzen wir
ΠT (F ) := Π{A1,...,An}(F ).
3. Die Zerlegung {S1,..., Sk} heisst abhängigkeitserhaltende Zerlegung von S bezüglich F, falls gilt
 
k
i=1
ΠSi(F ) + = F +.
In der Gleichung des dritten Teils dieser Definition ist die Bedingung
 
k
i=1
ΠSi(F ) + ⊆ F +
trivialerweise immer erfüllt.
Wird ein Relationenschema S durch eine Zerlegung dargestellt, die nicht abhängigkeitserhaltend bezüglich F ist, so können Updates in Instanzen der Zerlegungen das
gegebene F über S verletzen.  
176 9 Normalformen
Beispiel 9.22. Wir setzen nun unsere Überlegungen aus Beispiel 9.14 fort. Wir arbeiten
also wieder mit den Attributen Stadt, Str und PLZ, sowie den Relationenschemata
S = (Stadt, Str, PLZ),
S1 = (Str, PLZ), S2 = (Stadt, PLZ).
Wie vorher sei ausserdem F unsere Menge
{ {Stadt, Str} → PLZ, PLZ → Stadt }
von funktionalen Abhängigkeiten. Mit Lemma 9.19 finden wir, dass {S1, S2} eine
verlustfreie Zerlegung von S bezüglich F ist. Ferner gilt:
ΠS1 (F ) =
X → Y | XY ⊆ {Str, PLZ} und ∅ | X → Y
,
ΠS2 (F ) =
X → Y | XY ⊆ {Stadt, PLZ} und {PLZ → Stadt} | X → Y
.
Jedoch haben wir
ΠS1 (F ) ∪ ΠS2 (F ) 
| {Stadt, Str} → PLZ.
In der Tat, folgende Instanzen S1 von S1 und S2 von S2 zeigen, dass F durch die
Zerlegung {S1, S2} nicht erhalten wird:
S1
Str PLZ
Baumstr 2500
Baumstr 2502
S2
Stadt PLZ
Biel 2500
Biel 2502
Damit folgt nämlich
S1  S2
PLZ Str Stadt
2500 Baumstr Biel
2502 Baumstr Biel
Die Relationen S1 und S2 erfüllen jeweils die projizierten funktionalen Abhängigkeiten ΠS1 (F ) und ΠS2 (F ). Der Verbund S1  S2 verletzt jedoch die funktionale
Abhängigkeit {Stadt, Str} → PLZ.      
9.4 1NF bis BCNF 177
9.4 1NF bis BCNF
Eine Menge von funktionalen Abhängigkeiten kann dazu verwendet werden, um beim
Design eines DB-Systems einige der angesprochenen Anomalien zu vermeiden. Bauen
wir ein solches System auf, so kann es notwendig werden, eine Relation in mehrere
kleinere Relationen zu zerlegen. Unter Ausnutzung funktionaler Abhängigkeiten kann
man verschiedene Normalformen definieren, die zu einem guten DB-Design führen.
Um später die Normalformen präzise zu beschreiben, benötigen wir die folgenden
Konzepte. Zur Erinnerung: die Begriffe Schlüssel und Superschlüssel wurden in Definition 9.13 eingeführt.
Definition 9.23. Gegeben sei ein Relationenschema S sowie eine Menge F von funktionalen Abhängigkeiten bezüglich S .
1. Ein Attribut A von S heisst prim, falls A Teil eines Schlüssels von S ist; anderenfalls
heisst A nicht-prim.
2. Es gelte X → Y ∈ F + und Y → X 
∈ F +; ausserdem sei A ein Attribut von S , das
weder in X noch in Y vorkommt und für das Y → A ∈ F + gilt. Dann sagen wir, dass
A von X transitiv bezüglich F abhängig ist.
3. Eine funktionale Abhängigkeit X → Y mit Attributen von S heisst partielle
Abhängigkeit bezüglich F, falls es eine echte Teilmenge Z von X gibt, so dass
Z → Y ∈ F + ist. Dann sagen wir, dass Y von X partiell bezüglich F abhängig
ist.
Beispiel 9.24 (Transitive Abhängigkeit). Wir betrachten wieder das Schema
A := (BId, Name, Adresse, Datum)
aus Beispiel 9.1 mit den funktionalen Abhängigkeiten
F :=
{BId}→{Name, Adresse, Datum}, {Name}→{Adresse}

.
Wir haben
BId → Name ∈ F + und Name → BId ∈/ F +.
Ausserdem gilt
Name → Adresse ∈ F +.
Somit ist Adresse von BId transitiv bezüglich F abhängig.  
178 9 Normalformen
Beispiel 9.25 (Partielle Abhängigkeit). Wir betrachten ein Schema
S1 := (Autor, Jahrgang, Titel)
mit der Menge
F1 := {Autor → Jahrgang}
von funktionalen Abhängigkeiten. Das Schema S1 modelliert Autoren, deren Jahrgang
sowie die Titel der Bücher, die sie geschrieben haben. Wir werden dieses Schema später
im Beispiel 9.28 genauer studieren. Hier ist nur wichtig, dass
{Autor, Titel}→{Jahrgang} ∈ F +
1
eine partielle Abhängigkeit bezüglich F ist, da {Autor} eine echte Teilmenge von
{Autor, Titel} ist und gilt
{Autor}→{Jahrgang} ∈ F +
1 .
Es gibt viele verschiedene Normalformen, um gute DB-Schemata zu beschreiben. Wir beschränken uns hier aber auf diejenigen, die in der folgenden Definition zusammengestellt
sind.
Definition 9.26 (Normalformen). Wir gehen von einem Relationenschema S sowie
einer Menge F von funktionalen Abhängigkeiten bezüglich S aus.
Erste Normalform (1NF) S ist in erster Normalform, falls alle Attribute von S nur
atomare Domänen haben. Dabei heisst eine Domäne atomar, falls ihre Elemente als nichtunterteilbare Einheiten aufgefasst werden.
Zweite Normalform (2NF) S ist in zweiter Normalform bezüglich F, falls S in erster
Normalform ist und für alle Attribute A von S mindestens eine der folgenden zwei
Bedingungen erfüllt ist:
(2NF.1) A ist prim;
(2NF.2) A ist nicht von einem Schlüssel für S partiell bezüglich F abhängig.
Dritte Normalform (3NF) S ist in dritter Normalform bezüglich F, falls S in erster
Normalform ist und für alle X → Y aus F + mindestens eine der folgenden drei
Bedingungen erfüllt ist:
(3NF.1) Y ⊆ X;
(3NF.2) X ist ein Superschlüssel von S ;
(3NF.3) jedes Attribut A aus Y \ X ist prim.
9.4 1NF bis BCNF 179
Boyce–Codd Normalform (BCNF) S ist in Boyce–Codd Normalform bezüglich F,
falls S in erster Normalform ist und für alle X → Y aus F + mindestens eine der
folgenden zwei Bedingungen erfüllt ist:
(BCNF.1) Y ⊆ X;
(BCNF.2) X ist ein Superschlüssel von S .
Beispiel 9.27 (Nicht 1NF). Wir wählen das Schema
S0 := (Autor, Jahrgang, Titelliste)
um Autoren und deren Werke zu verwalten. Das Attribut Autor dient als Primärschlüssel.
Das heisst, die dazugehörende Menge von funktionalen Abhängigkeiten ist
F0 := {Autor → Jahrgang, Autor → Titelliste}.
Wir betrachten nun folgende Instanz von S0:
Werke
Autor Jahrgang Titelliste
Goethe 1749 {Götz, Faust}
Schiller 1759 {Tell}
Die Domäne des Attributs Titelliste ist hier nicht atomar. Sie besteht aus Mengen,
welche aus einzelnen Elementen zusammengesetzt sind. Somit ist dieses Schema nicht in
1NF.
Das Problem bei diesem Schema besteht darin, dass nicht auf einen einzelnen Titel
zugegriffen werden kann. Das heisst beispielsweise, dass die Query
Wer ist der Autor von Faust?
in der relationalen Algebra nicht ausgedrückt werden kann.
Beispiel 9.28 (1NF, aber nicht 2NF). Um das Problem aus dem vorherigen Beispiel zu
vermeiden, verwenden wir nun ein Schema bei dem jeder Titel einen eigenen Eintrag
erhält. Wir wählen also das Schema
S1 := (Autor, Jahrgang, Titel).
Die Kombination Autor, Titel dient als Primärschlüssel. Jedoch ist das Attribut Jahrgang natürlich nur vom Attribut Autor abhängig. Das heisst, die
dazugehörende Menge von funktionalen Abhängigkeiten ist
180 9 Normalformen
F1 := {Autor → Jahrgang}.
Damit gilt (siehe auch Beispiel 10.2 später)
{Autor, Titel}→{Autor, Jahrgang, Titel} ∈ F +
1 .
Das heisst, die Attributmenge
K := {Autor, Titel}
ist ein Schlüssel für S1. Wir betrachten nun folgende Instanz von S1:
Werke
Autor Jahrgang Titel
Goethe 1749 Götz
Goethe 1749 Faust
Schiller 1759 Tell
Alle Attribute haben nun atomare Domänen. Somit ist dieses Schema in 1NF. Jedoch
ist es nicht in 2NF. Es gilt nämlich:
1. Jahrgang ist nicht-prim und
2. Jahrgang ist partiell vom Schlüssel K abhängig.
Das Problem hier ist, dass die Daten des Jahrgangs mehrfach vorhanden, d. h. redundant,
sind. Dadurch ist es möglich die Integrität der Daten zu verletzen. So könnte der
Jahrgang im Tupel von Götz verändert werden, ohne dass die entsprechende Änderung
im Tupel von Faust vorgenommen wird. In diesem Fall wären dann zwei verschiedene (sich widersprechende) Angaben zum Jahrgang von Goethe in der Datenbank
abgespeichert.
Anmerkung 9.29. Zusammengesetzte Schlüssel wie im vorangehenden Beispiel sind nicht
grundsätzlich problematisch. In vielen Fällen sind sie sogar notwendig, beispielsweise
um m:n–Beziehungen abzubilden. Es muss nur sichergestellt werden, dass alle nicht-prim
Attribute vom ganzen Schlüssel abhängig sind. Dies ist im Beispiel 9.28 nicht gegeben.
Beispiel 9.30 (2NF, aber nicht 3NF). Hier betrachten wir nicht mehr ein Schema um
Autoren und deren Werke zu verwalten, sondern um einzelne Exemplare dieser Werke
zu verwalten. Es soll also möglich sein, das Tupel von Tell doppelt einzutragen. Dies
wird z. B. von einer Bibliothek benötigt, die von einem Werk mehrere Exemplare besitzen
kann.
9.4 1NF bis BCNF 181
Wir verwenden dazu das folgende Schema:
S2 := (BuchId, Autor, Jahrgang, Titel).
Das neue Attribut BuchId dient nun als Primärschlüssel. Wir haben also folgende Menge
von funktionalen Abhängigkeiten:
F2 :=
{BuchId}→{Autor, Jahrgang, Titel},{Autor}→{Jahrgang}

.
Wir betrachten nun folgende Instanz von S2:
Werke
BuchId Autor Jahrgang Titel
1 Goethe 1749 Götz
2 Goethe 1749 Faust
3 Schiller 1759 Tell
4 Schiller 1759 Tell
Das Schema S2 ist in 2NF. Die Attributmenge {BuchId} ist der einzige Schlüssel
dieses Schemas und da dieser Schlüssel nicht zusammengesetzt ist (er besteht nur
aus einem Attribut), kann kein Attribut partiell von ihm abhängig sein. Somit ist die
Bedingung (2NF.2) offensichtlich erfüllt und dieses Schema ist in zweiter Normalform.
Das Schema ist jedoch nicht in 3NF. Betrachte die funktionale Abhängigkeit
Autor → Jahrgang ∈ F +
2 .
Wir finden:
1. (3NF.1) ist nicht erfüllt: es gilt nämlich {Jahrgang} 
⊆ {Autor}.
2. (3NF.2) ist nicht erfüllt: {Autor} ist kein Superschlüssel von S2.
3. (3NF.3) ist nicht erfüllt: nicht jedes Attribut aus {Jahrgang} ist prim, denn das
Attribut Jahrgang ist nicht Teil eines Schlüssels.
Somit ist keine der drei Bedingungen erfüllt und das Schema S2 ist nicht in dritter
Normalform.
In diesem Schema tritt derselbe Effekt auf wie im vorhergehenden Beispiel. Der
Jahrgang eines Autors ist mehrfach abgespeichert, was zu Inkonsistenzen führen kann.
Anmerkung 9.31. Das Problem im obigen Beispiel besteht darin, dass das Attribut
Jahrgang von Autor funktional abhängig ist, aber {Autor} kein Superschlüssel ist.
Bedingung (3NF.2) wäre erfüllt, falls Jahrgang nur von Superschlüsseln abhängig ist.  
182 9 Normalformen
Diese Beobachtung ergibt zusammen mit Bemerkung 9.29 folgende scherzhafte Charakterisierung der dritten Normalform (in Anlehnung an den amerikanischen Gerichtseid):
Jedes nicht-prim Attribut muss etwas aussagen über
1. den Schlüssel (1NF),
2. den ganzen Schlüssel (2NF) und
3. nur über den Schlüssel (3NF).
Die Bezugnahme auf den Schlüssel ist, wie wir oben gesehen haben, natürlich eine starke
Vereinfachung.
Beispiel 9.32 (3NF, aber nicht BCNF). Wir betrachten wiederum das Postleitzahlverzeichnis aus den Beispielen 9.14 und 9.22. Wir haben das Schema
S3 = (Stadt, Str, PLZ)
mit der dazugehörigen Menge
F3 :=
{Stadt, Str}→{PLZ}, {PLZ}→{Stadt}

von funktionalen Abhängigkeiten. Schlüssel von S3 sind also die Attributmengen
{Stadt, Str} und {Str, PLZ}.
Betrachte folgende Instanz von S3
Verzeichnis
PLZ Str Stadt
2500 Baumstr Biel
3000 Parkstr Bern
3018 Wiesenstr Bern
3018 Baumstr Bern
Dieses Schema ist in 3NF. In der Tat gehört jedes Attribut zu einem Schlüssel, d. h. alle
Attribute sind prim. Somit ist die Bedingung (3NF.3) für alle funktionalen Abhängigkeiten
aus F +
3 erfüllt und damit ist S3 in dritter Normalform.
Das Schema ist jedoch nicht in BCNF. Betrachte die funktionale Abhängigkeit
PLZ → Stadt ∈ F +
3 Wir finden: .
1. (BCNF.1) ist nicht erfüllt: es gilt nämlich {Stadt} 
⊆ {PLZ}.
2. (BCNF.2) ist nicht erfüllt: {PLZ} ist kein Superschlüssel von S3.  
9.4 1NF bis BCNF 183
Somit sind beide Bedingungen nicht erfüllt und das Schema S3 ist nicht in Boyce–Codd
Normalform.
Diese Verletzung der BCNF bedeutet, dass immer noch gewisse Redundanzen vorhanden sein können. Betrachten wir die Relation Verzeichnis. Dort ist die Beziehung
zwischen der Postleitzahl 3018 und dem Ortsnamen Bern mehrfach abgespeichert.
Sollte sich die Post entschliessen die Ortsbezeichnung für diese Postleitzahl zu ändern,
beispielsweise zu Bern-Bümpliz, so sind Updates in mehreren Tupeln nötig. Falls
nicht alle diese Updates ausgeführt werden, dann sind verschiedene Namen für dieselbe
Postleitzahl abgespeichert. Wird der Eintrag der Baumstrasse aktualisiert, derjenige
der Wiesenstrasse aber nicht, so ist die funktionale Abhängigkeit
PLZ → Stadt
nicht mehr erfüllt. Die Relation ist dann inkonsistent.
Anmerkung 9.33. Wie das obige Beispiel zeigt, können Updates auf einem Schema
in 3NF noch zu Inkonsistenzen führen. Ist jedoch ein Schema in BCNF bezüglich einer
Menge F von funktionalen Abhängigkeiten, so kann es keine Redundanzen geben, welche
durch F verursacht werden. Das heisst, in einem Schema, welches in BCNF ist, können
Updates nicht zu Inkonsistenzen bezüglich funktionaler Abhängigkeiten führen.
Die Frage lautet somit:
Gibt es zu jedem DB-Schema ein äquivalentes DB-Schema in BCNF?
Wir haben folgendes Theorem.
Theorem 9.34. Gegeben seien ein Schema S und eine Menge von funktionalen Abhängigkeiten F bezüglich S . Dann gilt:
1. Es gibt eine verlustfreie Zerlegung
Z := {S1,..., Sn}
von S , so dass alle Si ∈ Z in BCNF bezüglich ΠSi(F ) sind.
2. Es gibt eine verlustfreie und abhängigkeitserhaltende Zerlegung
Z := {S1,..., Sn}
von S , so dass alle Si ∈ Z in 3NF bezüglich ΠSi(F ) sind.
184 9 Normalformen
Damit gibt es Zerlegungen in BCNF und 3NF. Jedoch ist nur die Zerlegung in 3NF
abhängigkeitserhaltend. Bei einer Zerlegung in BCNF können funktionale Abhängigkeiten
verloren gehen.
Wir verzichten hier auf den Beweis dieses Theorems und geben nur zwei Beispiele an,
wie eine Zerlegung aussehen kann. Im nächsten Kapitel werden wir dann Algorithmen
studieren, um ein gegebenes Schema in 3NF und BCNF zu zerlegen.
Beispiel 9.35 (Zerlegung). Wir betrachten nochmals die Situation aus Beispiel 9.28. Wir
haben das Schema
S1 := (Autor, Jahrgang, Titel)
mit den funktionalen Abhängigkeiten
F1 := {Autor → Jahrgang}.
Dieses Schema verletzt die zweite Normalform.
Wir zerlegen S1 in {S1,1, S1,2} mit
S1,1 := {Autor, Jahrgang} und S1,2 := {Autor, Titel}.
Mit Lemma 9.19 finden wir, dass diese Zerlegung verlustfrei ist. Zusätzlich ist sie auch
noch abhängigkeitserhaltend. Insbesondere haben wir
{Autor → Jahrgang} ∈ ΠS1,1 (F ).
Weiter stellen wir fest:
1. S1,1 ist in BCNF bezüglich ΠS1,1 (F ),
2. S1,2 ist in BCNF bezüglich ΠS1,2 (F ).
Die Relation Werke aus Beispiel 9.28 wird wie folgt zerlegt:
πS1,1 (Werke)
Autor Jahrgang
Goethe 1749
Schiller 1759
πS1,2 (Werke)
Autor Titel
Goethe Götz
Goethe Faust
Schiller Tell
Hier haben wir eine Zerlegung in BCNF gesehen, welche abhängigkeitserhaltend ist.
Im Allgemeinen muss dies nicht erfüllt sein, wie das folgende Beispiel zeigt.
9.4 1NF bis BCNF 185
Beispiel 9.36 (Zerlegung mit Abhängigkeitsverlust). Wir betrachten die Situation aus
Beispiel 9.32. Das heisst,
S3 = (Stadt, Str, PLZ)
und
F3 :=
{Stadt, Str}→{PLZ}, {PLZ}→{Stadt}

.
Wir hatten gezeigt, dass S3 nicht in BCNF bezüglich F3 ist.
Wir wählen nun die Zerlegung {S3,1, S3,2} mit
S3,1 := {Str, PLZ} und S3,2 := {Stadt, PLZ}.
Im Beispiel 9.22 haben wir gesehen, dass diese Zerlegung nicht abhängigkeitserhaltend
ist. Aus Lemma 9.19 folgt jedoch, dass sie verlustfrei ist. Weiter stellen wir fest:
1. S3,1 ist in BCNF bezüglich ΠS3,1 (F ),
2. S3,2 in ist BCNF bezüglich ΠS3,2 (F ).
Die Relation Verzeichnis aus Beispiel 9.32 wird also wie folgt zerlegt:
πS3,1 (Verzeichnis)
Str PLZ
Baumstr 2500
Parkstr 3000
Wiesenstr 3018
Baumstr 3018
πS3,2 (Verzeichnis)
Stadt PLZ
Biel 2500
Bern 3000
Bern 3018
In den folgenden Lemmata fassen wir einige Eigenschaften der eingeführten Normalformen zusammen.
Lemma 9.37. Gegeben seien ein Relationenschema S sowie eine Menge F von funktionalen Abhängigkeiten bezüglich S . Dann ist S in 3NF bezüglich F genau dann, wenn es
kein nicht-primes Attribut A von S gibt, das von einem Schlüssel für S transitiv bezüglich
F abhängig ist.
Beweis. Wir zeigen zuerst die Richtung von links nach rechts und nehmen dazu an, dass
S in 3NF bezüglich F ist. Nun gehen wir indirekt vor und nehmen zusätzlich an, dass
A ein nicht-primes Attribut ist, das transitiv bezüglich F von einem Schlüssel X für S
abhängt. Dann gibt es ein Y mit A 
∈ X ∪ Y , so dass  
186 9 Normalformen
X → Y ∈ F +, Y → X 
∈ F + und Y → A ∈ F + (9.5)
gilt. Nun wissen wir, dass für Y → A eine der drei Bedingungen (3NF.1), (3NF.2) oder
(3NF.3) erfüllt ist. Wegen A 
∈ X∪Y und da A nicht-prim ist, muss es sich also um (3NF.2)
handeln. Folglich ist Y ein Superschlüssel für S . Daraus folgt aber Y → X ∈ F +. Dies
ist ein Widerspruch zu (9.5), so dass die Richtung von links nach rechts nachgewiesen ist.
Zum Beweis der Richtung von rechts nach links gehen wir davon aus, dass es kein
nicht-primes Attribut von S gibt, das von einem Schlüssel für S transitiv bezüglich F
abhängig ist. Ausserdem wählen wir eine funktionale Abhängigkeit X → Y ∈ F +, für
die
Y 
⊆ X und X ist kein Superschlüssel für S
vorausgesetzt wird. Ferner betrachten wir ein Attribut A ∈ Y \ X. Wegen
X → Y ∈ F +
gilt auch
X → A ∈ F +. (9.6)
Da X kein Superschlüssel für S ist, gibt es einen Schlüssel Z für S mit der Eigenschaft
Z → X ∈ F + und X → Z 
∈ F +. (9.7)
Mit (9.6) und (9.7) folgt also, dass A von einem Schlüssel für S , nämlich Z, transitiv
bezüglich F abhängig ist. Daher ist A prim und es folgt (3NF.3). Damit ist unser Beweis
vollständig. 
Beispiel 9.38. Wir gehen zurück zum Beispiel 9.24. Wir haben also das Schema
A := (BId, Name, Adresse, Datum)
mit den funktionalen Abhängigkeiten
F :=
{BId}→{Name, Adresse, Datum}, {Name}→{Adresse}

.
Wir wissen:
1. Adresse ist ein nicht-primes Attribut,
2. BId ist ein Schlüssel für A ,
3. Adresse ist transitiv abhängig von BId.
Mit Lemma 9.37 folgt somit, dass A nicht in 3NF ist.  
9.4 1NF bis BCNF 187
Umgekehrt folgt aus Lemma 9.37 auch, dass es in jedem Schema das nicht in 3NF ist,
transitive Abhängigkeiten geben muss. Somit werden in jedem Schema das nicht in 3NF
ist, dieselben Anomalien auftreten, die wir auch für A im Abschn. 9.1 beschrieben haben.
Lemma 9.39. Es gilt folgende Beziehung:
BCNF ⇒ 3NF ⇒ 2NF ⇒ 1NF.
Beweis. Offensichtlich ist nur zu zeigen, dass aus der dritten Normalform die zweite
Normalform folgt. Sei also S ein Relationenschema in 3NF bezüglich F, und sei A ein
Attribut von S . Ist A prim, so ist Bedingung (2NF.1) erfüllt, und wir sind fertig.
Ist andererseits A nicht-prim, so folgt nach Lemma 9.37, dass
A kann nicht von einem Schlüssel für S
transitiv bezüglich F abhängig sein. (9.8)
Nun gehen wir indirekt vor und nehmen an, dass
(2NF.2) nicht erfüllt ist. (9.9)
Das heisst, A ist von einem Schlüssel X für S partiell bezüglich F abhängig. Dann gibt
es eine echte Teilmenge Z von X, so dass
Z → A ∈ F + (9.10)
gilt. Da A nicht-prim ist, kann A kein Element von X sein. Also haben wir
A 
∈ X und A 
∈ Z. (9.11)
Da X ein Schlüssel für S und Z eine echte Teilmenge von X ist, dürfen wir ferner
schliessen auf
X → Z ∈ F + und Z → X 
∈ F +. (9.12)
Aus (9.10), (9.11) und (9.12) folgt schliesslich, dass A vom Schlüssel X transitiv
bezüglich F abhängig ist. Dies ist jedoch ein Widerspruch zu (9.8). Damit ist (9.9) nicht
erfüllbar und Bedingung (2NF.2) muss gelten. 
188 9 Normalformen
Weiterführende Literatur2
1. Abiteboul, S., Hull, R., Vianu, V.: Foundations of Databases: The Logical Level. Addison-Wesley,
Reading (1995)
2. Codd, E.F.: Further normalization of the data base relational model. IBM Research Report, San
Jose, RJ909 (1971)
3. Codd, E.F.: Relational completeness of data base sublanguages. In: Rustin, R. (Hrsg.) Courant
Computer Science Symposium 6: Data Base Systems, S. 33–64. Prentice Hall, Englewood Cliffs
(1972)
4. Codd, E.F.: Recent investigations in relational data base systems. In: IFIP Congress, S. 1017–1021
(1974)
5. Jäger, G.: Datenbanken. Vorlesungsskript Universität Bern, Bern (1999)
6. Kandzia, P., Klein, H.: Theoretische Grundlagen relationaler Datenbanksysteme „Reihe Informatik“, Bd. 79. Bibliographisches Institut (1993)
7. Kent, W.: A simple guide to five normal forms in relational database theory. Commun. ACM
26(2), 120–125 (1983)
8. Maier, D.: The Theory of Relational Databases. Computer Science Press (1983). http://web.cecs.
pdx.edu/~maier/TheoryBook/TRD.html. Zugegriffen am 11.06.2019
2Codd entwickelte die Konzepte von funktionalen Abhängigkeiten und Normalformen
(insbesondere auch die dritte Normalform) bereits in seinen ersten Arbeiten zum relationalen
Modell [2, 3]. Die Boyce–Codd Normalform geht ebenfalls auf die frühen Arbeiten zurück [4].
Unsere Präsentation dieser Themen basiert auf dem Vorlesungsskript von Jäger [5]. Das Buch
von Meier [8], welches frei verfügbar ist, bietet ebenfalls eine hervorragende Darstellung dieses
Materials. Normalformen und Abhängigkeiten werden natürlich auch in den Theorie-Büchern von
Abiteboul et al. [1] und von Kandzia und Klein [6] ausführlich besprochen. Die Charakterisierung
der dritten Normalform in Bemerkung 9.31 stammt aus [7].
