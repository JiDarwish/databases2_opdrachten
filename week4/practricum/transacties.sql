-------------------- A

DELIMITER $$


CREATE PROCEDURE AlgemeneSalarisVerhoging(IN percentage DECIMAL(4,2))
BEGIN
  START TRANSACTION
    UPDATE Werknemer
    SET salaris = salaris + (salaris * (percentage / 100));

    UPDATE SalarisSchaal
    SET 
      ondergrens = ondergrens + (ondergrens * (percentage / 100)),
      bovengrens = bovengrens + (bovengrens * (percentage / 100));
  COMMIT;
END $$

DELIMITER ;



------------------------------ B
DELIMITER $$

CREATE PROCEDURE JuniorFunctieSalarisVerhoging(IN pFunctie VARCHAR(20), IN percentage DECIMAL(4,2))
BEGIN

  UPDATE Werknemer W
  SET salaris = salaris + (salaris * percentage / 100)
  WHERE functie = pFunctie AND 
  salaris < (SELECT ((bovengrens + ondergrens) / 2) AS grens 
  FROM SalarisSchaal WHERE W.salaris > ondergrens AND W.salaris < bovengrens);

  COMMIT;
  
END $$

DELIMITER ;

--------------------------------------------------- C

-------------------------------------------------- D
CREATE USER 'Explorer'@'localhost' IDENTIFIED BY 'Expl2017';

GRANT SELECT ON bedrijf.Werknemer TO 'Explorer'@'localhost';
GRANT SELECT ON bedrijf.afdeling TO 'Explorer'@'localhost';
GRANT SELECT ON bedrijf.locatie TO 'Explorer'@'localhost';