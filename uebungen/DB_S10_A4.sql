-- Noé Stemmer 17 106 956
-- Nina Baumgartner

-- DB Serie 10 Aufgabe 4
-- a
select hersteller.name as Name from hersteller
inner join verkauft using(h_pkey)
inner join futter using(f_pkey)
where futter.name ='Stroh';

-- b
with counter as (
    select count(*) as anzahl
    from haustiere
    where p_pkey IS NOT NULL)
select case when 0 = anzahl then true
    else false end
    from counter;

--c
with counter as (
    select name
    from haustiere
    natural join mag
    group by name
    having min(grad) = max(grad) and count(mag.ha_pkey) > 1
    )
select case when count(name) > 0 then true
    else false end
    from counter
    
--d
    count(mag.ha_pkey) > 1
    select name
    from haustiere
    natural join mag
    group by name
    having min(grad) = max(grad) and count(mag.ha_pkey) > 1
