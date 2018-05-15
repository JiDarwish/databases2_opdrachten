-------------------------------------- A

DELIMITER $$

CREATE FUNCTION VolledigAdres(pLidNr SMALLINT) RETURNS VARCHAR (45)
BEGIN

DECLARE adres VARCHAR(200) DEFAULT "";

select CONCAT(straat, " ", huisnr, IFNULL(toevoeging, ""), ", ", postcode, " ", woonplaats) AS address
FROM lid
WHERE lidnr = pLidNr
INTO adres; -- STOOR HET IN adres

RETURN adres;
END $$

DELIMITER ;


----------------------------------------- B
DELIMITER $$

CREATE PROCEDURE OpschonenOudeGegevens (IN pDatum DATE)
BEGIN

DELETE FROM Boete 
WHERE datumovertreding < pDatum;

DELETE FROM Wedstrijd 
WHERE datum < pDatum;

DELETE FROM BestuursFunctie 
WHERE einddatum < pDatum;

UPDATE BestuursFunctie 
SET beginDatum = pDatum 
WHERE beginDatum < pDatum;

END $$

DELIMITER ;


-------------------------------------------- C
DELIMITER $$

CREATE TRIGGER before_team_veranderen_aanvoerder BEFORE UPDATE ON Lid FOR EACH ROW
BEGIN 

 IF ((select COUNT(aanvoerder) FROM Team WHERE aanvoerder = OLD.lidNr) > 0)
 THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT='Aanvoerder kan niet van team veranderen',
    TABLE_NAME="Lid", COLUMN_NAME="lidNr", MYSQL_ERRNO=9002;
  END IF;
  
END $$

DELIMITER ;