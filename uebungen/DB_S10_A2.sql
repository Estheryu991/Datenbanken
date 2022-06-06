-- Noé Stemmer 17 106 956
-- Nina Baumgartner

-- DB Serie 10 Aufgabe 2

CREATE VIEW magOverview AS
    SELECT DISTINCT Haustiere.art, Futter.name AS Futter,
        (SELECT SUM (mag.grad) FROM mag)
            WHERE Haustiere.ha_pkey=mag.ha_pkey
                AND mag.f_pkey=Futter.f_pkey)
                    AS sum

    FROM mag,Haustiere,Futter
        WHERE Futter.f_pkey = mag.f_pkey
            AND Haustiere.ha_pkey = mag.ha_pkey;
/*We get a Relation with three columns "Haustiere.art", "Futter","mag.grad".
he mag.grad is the added value of degree to which the animals of a kind like a
certain food. */

CREATE VIEW arithmeticAverage AS
    SELECT DISTINCT Haustiere.art, Futter.name AS Futter,
        (SELECT AVG(sum)FROM magOverview
            WHERE magOverview.art = Haustiere.art
                AND magOverview.Futter = Futter.name)
                    AS average
    FROM magOverview, Haustiere, Futter,
    ORDER BY average DESC;
/*We get a Relation with three columns "Haustiere.art", "Futter" and "average".
Average is the average degree to which to which the animals of a kind like a
certain food. Average is ordered by the highest ones first. */

CREATE VIEW ranking AS
        SELECT arithmeticAverage.Futter, arithmeticAverage.art,
            count(arithmeticAverage.average) as rank
            FROM arithmeticAverage, arithmeticAverage AS ariAv
             			WHERE arithmeticAverage.art = ariAv.art
            				AND arithmeticAverage.average >= ariAv.average
    GROUP BY arithmeticAverage.Futter, arithmeticAverage.art;
/* Reltation that ranks the ordered averages. */

CREATE VIEW billigsterHersteller AS
        Hersteller := SORT (name, h_pkey)
        verkauft := SORT (preis, h_pkey)
        i:= 1
        j:= 1

        WHILE (i <= #Hersteller AND  <= #verkauft)
        IF ( Hersteller [i][h_pkey] = verkauft [j][h_pkey]) THEN j = jj
        WHILE ( Hersteller[i][h_pkey] = T[j][h_pkey] AND j <= #verkauft )
            OUTPUT (Hersteller[i],verkauft[j])
            j++
        j = jj
        i++
        ELSE IF ( Hersteller[i][h_pkey] > T[j][h_pkey] ) THEN
        j++
        ELSE
        i++ ;
