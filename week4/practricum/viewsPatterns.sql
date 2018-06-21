
----------- A
CREATE OR REPLACE VIEW VerkoopResultaat AS
SELECT code, omschrijving, artikelPrijs, (SELECT COUNT(artikelCode) FROM BestelRegel WHERE artikelCode = code) AS aantalVerkocht, voorraad
FROM Artikel
ORDER BY code;


----------- B

SELECT (artikelPrijs * aantalVerkocht) AS omzet
FROM VerkoopResultaat
WHERE LOWER(code) LIKE '%dam%';

-------------- C
SELECT * FROM Artikel WHERE code REGEXP '[A-Za-z]{3}/?WEHK|wehk';