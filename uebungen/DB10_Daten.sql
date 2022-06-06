-- Noé Stemmer 17 106 956
-- Nina Baumgartner

-- DB Serie 10 Aufgabe 3


INSERT INTO Person(p_pkey, name)
	VALUES(1, 'Alex')
;
INSERT INTO Haustiere(ha_pkey, name, gewicht, art, p_pkey)
	VALUES(1, 'Büsi', 00005.000 , 'Vierfarb', 1)
;
INSERT INTO Haustiere
	VALUES(2, 'T-Rex', 00010.000 , 'Sennenhund', 1)
;
INSERT INTO Haustiere
	VALUES(3, 'Kevin', 05000.000 , 'Weishorn', 1)
;


INSERT INTO Futter(f_pkey, name)
	VALUES(1, 'Katzenraum')
;
INSERT INTO Futter(f_pkey, name)
	VALUES(2, 'Hundetraum')
;
INSERT INTO Futter(f_pkey, name)
	VALUES(3, 'Rinotraum')
;
INSERT INTO Futter(f_pkey, name)
	VALUES(4, 'Trockenfu')
;
INSERT INTO Futter(f_pkey, name)
	VALUES(5, 'Vegie')
;


INSERT INTO mag(ha_pkey, f_pkey, grad)
 	VALUES(1, 1, 09.9)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(1, 2, 05.1)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(1, 3, 02.2)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(1, 4, 06.6)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(1, 5, 00.1)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(2, 1, 05.2)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(2, 2, 08.5)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(2, 3, 05.0)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(2, 4, 06.6)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(2, 5, 00.1)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(3, 1, 05.0)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(3, 2, 07.1)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(3, 3, 09.9)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(3, 4, 03.6)
;
INSERT INTO mag(ha_pkey, f_pkey, grad)
	VALUES(3, 5, 00.1)
;
