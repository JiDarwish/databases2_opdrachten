-- 5

SELECT SUM(bedrag) AS total
FROM boete;

-- 6

SELECT boetetype, SUM(bedrag) AS total
FROM boete
GROUP BY boetetype;

-- 7

SELECT T.klasse, COUNT(L.lidNr)
FROM lid L
JOIN Team T
ON T.teamCode = L.speelt_in
GROUP BY klasse;