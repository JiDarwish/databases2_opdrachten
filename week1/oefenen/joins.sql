
-- 1

SELECT teamnaam, klasse, thuishal
FROM Team;

--2

SELECT *
FROM lid
WHERE speelt_in = 'AMSTH1'
ORDER BY achternaam;

-- 3

SELECT klasse, COUNT(teamCode)
FROM team
GROUP BY klasse;

-- 4

SELECT klasse, teamnaam, thuishal, L.achternaam
FROM team T
JOIN Lid L
ON L.lidnr = T.aanvoerder;