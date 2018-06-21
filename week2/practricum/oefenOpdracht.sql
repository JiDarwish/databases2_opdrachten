--------- 2 AGREGATIE
-- 1
SELECT SUM(bedrag)
FROM boete;

-- 2
SELECT boetetype, SUM(bedrag)
FROM boete
GROUP BY boeteType;
