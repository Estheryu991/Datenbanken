#Bestimmte Folgen von Datenbankanweisungen 

müssen als eine Einheit ausgeführt wer-
den. Eine solche Einheit nennen wir Transaktion. In diesem Kapitel führen wir die ACID
Postulate für Transaktionen ein und zeigen wie Transaktionen in SQL behandelt werden.
Theoretisch sollten parallel ausgeführte Transaktionen einander nicht beeinflussen,
d. h. sie werden isoliert ausgeführt. In der Praxis wird diese Bedingung aus Performance-
Gründen jedoch gelockert. Wir studieren die verschiedenen Isolationsgrade, welche SQL
anbietet. Dazu betrachten wir drei Phänomene, die bei der parallelen Transaktionsverar-
beitung auftreten können: Dirty Reads, Non-repeatable Reads und Phantom Reads.
Wir zeigen auch, wie PostgreSQL die verschiedenen Isolationsgrade mittels einer Mul-
tiversion Concurrency Control (MVCC) Architektur implementiert. Bei diesem Ansatz
werden für jedes Tupel mehrere Versionen abgespeichert und eine Sichtbarkeitsbedingung
definiert, welche Transaktion welche Version eines Tupels sieht.

# 8.1 Transaktionen

Eine Transaktion ist eine Folge von Datenbankanweisungen, welche zusammen eine
Einheit bilden. Die Anweisungen einer Transaktion werden entweder vollständig ausge-
führt (d. h. alle Anweisungen werden erfolgreich beendet) oder gar nicht. Falls also im
Verlauf einer Transaktion eine fehlerhafte Situation auftritt, so werden die bisher erfolgten
Anweisungen rückgängig gemacht und es wird der Zustand zu Beginn der Transaktion
wieder hergestellt.
Das Standardbeispiel im Zusammenhang mit Transaktionen ist die Überweisung eines
Betrags von einem Bankkonto A auf ein anderes Bankkonto B. Dazu sind zwei Schritte
nötig. 
