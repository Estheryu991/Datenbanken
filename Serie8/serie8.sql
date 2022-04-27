CREATE TABLE Haustier(
	hid integer NOT NULL,
	pid integer NOT NULL,
	Name varchar(32) NOT NULL,
	GebTag integer,
	GebMonat integer,
	GebJahr integer,
	PRIMARY KEY (hid),
	FOREIGN KEY (pid) REFERENCES Halter ON DELETE CASCADE,
	CHECK (GebTag<32 AND GebTag>0 AND GebMonat<13 AND GebMonat>0)
);

CREATE TABLE Katze (
	hid integer NOT NULL,
	Dominanz integer,
	Fellfarbe varchar(32) NOT NULL,
	PRIMARY KEY (hid),
	CONSTRAINT Dominanz CHECK (Dominanz   BETWEEN 0 AND 100)
);

CREATE TABLE Hund(
	hid integer NOT NULL,
	Rasse varchar(32),
	PRIMARY KEY (hid)
);

CREATE TABLE Futter (
	Hersteller varchar(32) NOT NULL,
	Name varchar(32) NOT NULL,
	PRIMARY KEY (Hersteller, Name)
);

CREATE TABLE mag(
	hid integer NOT NULL,
	Hersteller varchar(32) NOT NULL,
	Name varchar(32) NOT NULL,
	PRIMARY KEY (Hersteller, Name, hid),
	FOREIGN KEY (Hersteller, Name) REFERENCES Futter,
	FOREIGN KEY (hid) REFERENCES Haustier ON DELETE CASCADE
);

CREATE TABLE Halter(
	pid integer NOT NULL,
	hid integer NOT NULL,
	Typ varchar(32),
	PRIMARY KEY (pid),
	FOREIGN KEY (hid) REFERENCES Haustier ON DELETE CASCADE,
	FOREIGN KEY (pid) REFERENCES Person ON DELETE CASCADE
);

CREATE TABLE "hat-bei"(
	hid integer NOT NULL,
	pid integer NOT NULL,

    lid integer NOT NULL,
	PRIMARY KEY (hid, pid),
	FOREIGN KEY (hid) REFERENCES Haustier ON DELETE CASCADE,
 	FOREIGN KEY (pid) REFERENCES Person ON DELETE CASCADE,
	FOREIGN KEY (lid) REFERENCES Lieblingsplatz ON DELETE CASCADE
);

CREATE TABLE Person(
	pid integer NOT NULL,
	Name varchar(32),
	Wohnort varchar(32),
	PRIMARY KEY (pid)
);

CREATE TABLE Aufpasser (
	pid integer NOT NULL,
	Stundenlohn integer DEFAULT NULL,
	FOREIGN KEY (pid) REFERENCES Person ON DELETE CASCADE
);

CREATE TABLE Lieblingsplatz (
	lid integer NOT NULL,
	PRIMARY KEY (lid)
);

CREATE TABLE Kamin (
	lid integer NOT NULL,
	Material varchar(32),
	PRIMARY KEY (lid)
);

CREATE TABLE Karton(
	lid integer NOT NULL,
	PRIMARY KEY (lid)
);

CREATE TABLE Laptop(
	lid integer NOT NULL,
	Hersteller varchar(32) NOT NULL,
	Kennzeichnung varchar(32),
	PRIMARY KEY (lid)
);





