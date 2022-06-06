
CREATE TABLE Angestellte (
PersonalNr INTEGER NOT NULL,
  Name VARCHAR(40),
  Vorname VARCHAR(40),
  Telefon VARCHAR(40),
  "akad Grad" VARCHAR(40),
  Typ VARCHAR(40),
  PRIMARY KEY(PersonalNr)
);
CREATE TABLE Vorlesungen (
  VorlesungsNr INTEGER NOT NULL,
  Titel VARCHAR(40),
  ECTS INTEGER,
  Semester VARCHAR(40),
  PRIMARY KEY(VorlesungsNr)
);
CREATE TABLE HaeltBetreut (
  VorlesungsNr INTEGER NOT NULL,
  PersonalNr INTEGER NOT NULL,
  PRIMARY KEY(VorlesungsNr, PersonalNr)
);


INSERT INTO Angestellte VALUES
(123,'Zauder','Peer','0123-1235','Prof. Dr.','Professor'),
(121, 'Prau', 'Hans', '0123-1125', 'Prof. Dr. hs.mult. Dr. ing. habil.', 'Professor'),
(171, 'Main', 'Willi', '0121-1123', 'Dipl.-Inf.', 'Assistent'), (176, 'Meier', 'Hans', '0123-1124', 'Dipl.-Math.', 'Assistent'),
(178, 'Meier', 'Georg', '0123-83646', 'M.sc.', 'Assistent'),
(179, 'Meier', 'Karl', '0123-32546', 'M.sc.', 'SHK');

INSERT INTO Vorlesungen VALUES
(121, 'Programmieren', 4, 'hs10'),
(124, 'Datenbanken', 5, 'fs10'),
(128, 'Datenbanken', 5, 'fs11'),
(123, 'Programmieren', 4, 'hs11'),
(127, 'Programmieren', 4, 'hs12'),
(129, 'Datenbanken', 5, 'fs12'),
(135, 'Automatentheorie', 5, 'fs14');

INSERT INTO HaeltBetreut VALUES (121, 121), (124, 123), (128, 121), (123, 123), (127, 123), (129, 121), (135, 121), (121, 171), (121, 176), (127, 178), (129, 176), (135, 171);


SELECT Angestellte.* FROM Angestellte
JOIN HaeltBetreut ON HaeltBetreut.PersonalNr = Angestellte.PersonalNr
JOIN Vorlesungen ON Vorlesungen.VorlesungsNr = HaeltBetreut.VorlesungsNr
WHERE Vorlesungen.Titel = 'Programmieren' AND Angestellte.Typ = 'Assistent';


SELECT DISTINCT Titel, ECTS FROM Vorlesungen WHERE Semester = 'fs11';


SELECT DISTINCT ECTS, Titel FROM Vorlesungen
JOIN HaeltBetreut ON HaeltBetreut.VorlesungsNr = Vorlesungen.VorlesungsNr
JOIN Angestellte ON Angestellte.PersonalNr = HaeltBetreut.PersonalNr
WHERE Angestellte.Name = 'Zauder';
