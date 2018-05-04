SELECT type, SUM(lading) AS vervordeLading
FROM vlucht
  JOIN vliegtuig ON vliegtuig.registratieNr = vlucht.registratieNr
GROUP BY Type
HAVING type = "Fokker F50";