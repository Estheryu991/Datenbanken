-- Tobias Matys 16-936-098
-- Nina Baumgartner 17-404-047
/* if tables already exist..
DROP TABLE angestellte;
DROP TABLE vorlesungen;
DROP TABLE haeltbetreut;
*/

CREATE TABLE angestellte (
PersonalNr INTEGER,
Name VARCHAR(30),
Vorname VARCHAR(30),
Telefon VARCHAR(10),
"akad Grad" VARCHAR(80),
Typ VARCHAR(20)
);

ALTER TABLE angestellte ADD PRIMARY KEY (PersonalNr);
ALTER TABLE angestellte ADD UNIQUE (PersonalNr);
INSERT INTO angestellte VALUES (123,'Zauder','Peer','0123-1235','Prof. Dr.','Professor');
INSERT INTO angestellte VALUES (121,'Prau','Hans','0123-1125','Prof. Dr. hc.mult. Dr. ing. habil.','Professor');
INSERT INTO angestellte VALUES (171,'Main','Willi','0121-1123','Dipl.-Inf.','Assistent');
INSERT INTO angestellte VALUES (176,'Meier','Hans','0123-1124','Dipl.-Math.','Assistent');
INSERT INTO angestellte VALUES (178,'Meier','Georg','0123-83646','M.sc.','Assistent');
INSERT INTO angestellte VALUES (179,'Meier','Karl','0123-32546','M.sc.','SHK');

CREATE TABLE vorlesungen (
	VorlesungsNr INTEGER,
	Titel VARCHAR(30),
	ECTS INTEGER,
	Semester VARCHAR(10)
);

ALTER TABLE vorlesungen ADD PRIMARY KEY (VorlesungsNr);
ALTER TABLE vorlesungen ADD UNIQUE (VorlesungsNr);

INSERT INTO vorlesungen VALUES (124,'Datenbanken',5,'fs10');
INSERT INTO vorlesungen VALUES (128,'Datenbanken',5,'fs11');
INSERT INTO vorlesungen VALUES (123,'Programmieren',4,'hs11');
INSERT INTO vorlesungen VALUES (127,'Programmieren',4,'hs12');
INSERT INTO vorlesungen VALUES (129,'Datenbanken',5,'fs12');
INSERT INTO vorlesungen VALUES (135,'Automatentheorie',5,'fs14');

CREATE TABLE haeltbetreut (
	VorlesungsNr INTEGER,
	PersonalNr INTEGER
);

INSERT INTO haeltbetreut VALUES (121,121);
INSERT INTO haeltbetreut VALUES (124,123);
INSERT INTO haeltbetreut VALUES (128,121);
INSERT INTO haeltbetreut VALUES (123,123);
INSERT INTO haeltbetreut VALUES (127,123);
INSERT INTO haeltbetreut VALUES (129,121);
INSERT INTO haeltbetreut VALUES (135,121);
INSERT INTO haeltbetreut VALUES (121,121);
INSERT INTO haeltbetreut VALUES (121,176);
INSERT INTO haeltbetreut VALUES (127,178);
INSERT INTO haeltbetreut VALUES (129,176);
INSERT INTO haeltbetreut VALUES (135,171);

SELECT DISTINCT name,vorname,typ,titel FROM angestellte 
JOIN haeltbetreut ON angestellte.PersonalNr=haeltbetreut.PersonalNr 
JOIN vorlesungen ON vorlesungen.vorlesungsnr=haeltbetreut.vorlesungsnr  
WHERE titel = 'Programmieren' AND typ = 'Assistent';

SELECT DISTINCT semester,ECTS,titel FROM angestellte 
JOIN haeltbetreut ON angestellte.PersonalNr=haeltbetreut.PersonalNr 
JOIN vorlesungen ON vorlesungen.vorlesungsnr=haeltbetreut.vorlesungsnr                     
WHERE semester='fs11';

SELECT DISTINCT ECTS,titel FROM angestellte 
JOIN haeltbetreut ON angestellte.PersonalNr=haeltbetreut.PersonalNr 
JOIN vorlesungen ON vorlesungen.vorlesungsnr=haeltbetreut.vorlesungsnr    
WHERE name='Zauder';
