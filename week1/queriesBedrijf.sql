-- query 1
SELECT L.omschrijving, L.land, W.wnaam, W.wNr
FROM locatie L
  LEFT JOIN werknemer W ON L.beheerderNr = W.wNr;

-- query 2
SELECT A.aNaam, L.omschrijving, W.wNr AS secrNr, W.wNaam AS secrNaam, C.wNr AS chefNr, C.wNaam AS chefNaam
FROM Afdeling A
  INNER JOIN locatie L ON L.code = A.locatieCode
  LEFT JOIN Werknemer W ON A.secretaresseNr = W.wNr
  LEFT JOIN werknemer C ON W.chefNr = C.wNr
WHERE land = 'Nederland';
