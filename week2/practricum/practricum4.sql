-- A
SELECT A.aNaam, COUNT(W.wNr)
FROM Afdeling A
  LEFT JOIN Werknemer W on W.aNr = A.aNr
GROUP BY A.aNaam;


-- B
SELECT wNr, wNaam, voorletters, functie, (SELECT schaal
  FROM SalarisSchaal
  WHERE salaris < bovengrens AND salaris > ondergrens) AS schaal, salaris
FROM werknemer
ORDER BY salaris DESC;

-- C
SELECT W.wNr, W.wNaam, (SELECT locatieCode
  FROM Afdeling
  WHERE aNr = W.aNr) AS locatieCode, W.kamer
FROM werknemer W
WHERE (SELECT COUNT(kamer)
FROM Werknemer
WHERE W.kamer = kamer AND W.aNr = aNr) >= 2
ORDER BY kamer;