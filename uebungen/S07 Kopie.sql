-- Tobias Matys 16-936-098
-- Nina Baumgartner 17-404-047

-- 2a
SELECT DISTINCT filialleiter FROM filiale
	NATURAL JOIN artikel
	NATURAL JOIN lieferant
	WHERE lieferant.name = 'Druckwerk Trallala';

-- 2b
SELECT * FROM kunde
	NATURAL JOIN kauft
	NATURAL JOIN artikel
	WHERE lid NOT IN
		(SELECT lid from lieferant
			WHERE lieferant.land <> 'Schweiz');

-- 2c
﻿SELECT DISTINCT kunde.* FROM kunde
NATURAL JOIN kauft
NATURAL JOIN artikel
NATURAL JOIN
  (SELECT typid FROM artikeltyp
    NATURAL JOIN bietetan
    NATURAL JOIN lieferant
    WHERE land='Schweiz') AS foo;

-- 2d
SELECT Distinct bezeichnung FROM artikeltyp
NATURAL JOIN artikel
WHERE fid is NULL;

-- 2e
SELECT kid, SUM(preis) FROM kunde
NATURAL JOIN kauft
NATURAL JOIN artikel
NATURAL JOIN artikeltyp
GROUP BY kid ORDER BY kid;
