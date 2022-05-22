DROP TABLE Person, Buch, Autor;

CREATE TABLE Person(
	pid INTEGER PRIMARY KEY,
	vorname VARCHAR(50),
	nachname VARCHAR(50)
);

CREATE TABLE Autor(
	aid INTEGER PRIMARY KEY,
	
	-- Wird eine Person gelöscht, existiert sie auch nicht weiter als Autor
	FOREIGN KEY (aid) REFERENCES Person (pid) ON DELETE CASCADE
);

CREATE TABLE Buch(
	isbn VARCHAR(17) PRIMARY KEY,
	titel VARCHAR(100) NOT NULL,
	seiten INTEGER,
	aid INTEGER NOT NULL,
	beschreibung TEXT DEFAULT 'Ohne Worte',

	-- Fremdschlüssel auf Autor. Wenn ein Autor gelöscht wird, sollen auch seine Bücher gelöscht werden
	FOREIGN KEY (aid) REFERENCES Autor (aid) ON DELETE CASCADE
);

-- Die ISBN soll aus genau 13 Ziffern bestehen (SIMILAR TO und Regular Expressions sind kein Prüfungsstoff)
ALTER TABLE Buch ADD CONSTRAINT "Gültige ISBN"
	CHECK (isbn SIMILAR TO '[0-9]{13}')
;

-- Jeder Autor hat mindestens ein Buch geschrieben
-- Leider unterstützt psql keine Subqueries in Check Constrainsts.
ALTER TABLE Autor ADD CONSTRAINT "Schrieb Buch"
	CHECK (EXISTS (SELECT aid FROM Buch WHERE Buch.aid = Autor.aid))
;

--------------------------------------------------------------------------------------------------

-- Wegen der Reference Constraints spielt die Reihenfolge der Inserts eine Rolle!
INSERT INTO Person VALUES
	(313, 'Don', 'Rosa'),
	(752, 'Sina', 'Seifert'),
	(999, 'Max', 'Meier')
;

INSERT INTO Autor VALUES
	(313),
	(752)
	-- Max Meier ist kein Autor
;

-- Keine Beschreibung -> Es wird der Default Wert 'Ohne Worte' benutzt.
INSERT INTO Buch VALUES
	('9783770440528', 'Uncle Scrooge and Donald Duck - The Son of the Sun', 208, 313)
;

-- Error - Dieser Tupel verletzt den 'Valid ISBN' Constraint
INSERT INTO Buch VALUES
	('Schubidubidub', 'Totally real book', 1000, 752, 'This is amazing!')
;

-- Error - und dieser den Reference Constraint auf Autor
INSERT INTO Buch VALUES
	('9771673625183', 'Kunst ist Kunst ist Kunst', 301, 999, 'Ein Augenöffner')
;

-- Wird nun eine Person gelöscht, so wird sie auch als Autor gelöscht und
-- damit werden all ihre Bücher gelöscht (ON DELETE CASCADE)
-- DELETE FROM Person WHERE nachname LIKE 'R%';
