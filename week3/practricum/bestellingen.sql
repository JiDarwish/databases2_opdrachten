---------------------------------------------------------------------------- A
ALTER TABLE Klant ADD PRIMARY KEY (klantNummer);
ALTER TABLE Artikel ADD PRIMARY KEY (code);
ALTER TABLE Bestelling ADD PRIMARY KEY (bestelNummer);
ALTER TABLE BestelRegel ADD PRIMARY KEY (bestelNr, artikelCode);

-------------------------------------------------------------------------- B

-- bestelling fk
ALTER TABLE Bestelling
ADD CONSTRAINT bestelling_hoort_bij_klant_fk
FOREIGN KEY (klantNr) REFERENCES Klant(klantNummer)
ON DELETE RESTRICT
ON UPDATE CASCADE; -- kun add index here

-- BestelRegel fk

ALTER TABLE BestelRegel
ADD CONSTRAINT bestel_hoort_bij_bestelling_fk
FOREIGN KEY (bestelNr) REFERENCES Bestelling(bestelNummer)
ON DELETE CASCADE
ON UPDATE CASCADE,
ADD CONSTRAINT bestel_betreft_artikel_fk
FOREIGN KEY (artikelCode) 
REFERENCES Artikel(code)
ON DELETE RESTRICT 
ON UPDATE CASCADE;

-------------------------------- INDEXES
--- add some
-------------------------------------------------------------------------- C
ALTER TABLE BestelRegel
ADD CONSTRAINT meer_dan_nul_per_bestelling
CHECK (aantal > 0);

ALTER TABLE Bestelling 
ADD CONSTRAINT bestel_dag_uc
UNIQUE (klantNr, bestelDatum);


/*
USE Bestellingen;
DELETE 
FROM Bestelregel;
DELETE FROM Bestelling;
DELETE FROM Artikel;
DELETE FROM Klant;
INSERT INTO Artikel
VALUES
  ('DAM/CWJU0001', 'Sweatjurk', 'HOOG', 69.95, 67);
INSERT INTO Artikel
VALUES
  ('WONWEHK0001', 'Hoekbank Bornholm', 'HOOG', 899.00, 18);
INSERT INTO Artikel
VALUES
  ('DAM/PUMA0012', 'Basket Heart Patent Sneakers', 'HOOG', 94.95, 17);
INSERT INTO Artikel
VALUES
  ('HER/PMEL0038', 'Regular Fit Overhemd', 'HOOG', 79.95, 19);
INSERT INTO Artikel
VALUES
  ('DAMGEIS0034', 'Jurk met lurex', 'HOOG', 79.
99, 33);
INSERT INTO Artikel
VALUES
  ('DAM/Wehk0005', 'Fluwelen jurk', 'HOOG', 59.95, 19);
INSERT INTO Artikel
VALUES
  ('dam/wehk0006', 'Broek Britt coated', 'HOOG', 79.95, 9);
INSERT INTO Artikel
VALUES
  ('HER/Jajo0006', 'Core parka', 'HOOG', 99.99, 13);
INS
ERT INTO Artikel VALUES
('HER/BJBO0006', 'Boxer (set van 5)', 'HOOG', 59.95, 13);
INSERT INTO Artikel
VALUES
  ('herjajo0016', 'Intelligence Tim slim fit jeans', 'HOOG', 79.99, 3);
INSERT INTO Artikel
VALUES
  ('won/hkli0006', 'Kunstplant blauwe bessen tak', '
HOOG', 9.95, 12);
INSERT INTO Klant
VALUES
  (670427, 'Willem van Buuren', 'Wassenaar');
INSERT INTO Klant
VALUES
  (691231, 'Maxima van Buuren', 'Wassenaar');
INSERT INTO Klant
VALUES
  (700115, 'Mark Rutte', 'Den Haag');
INSERT INTO Klant
VALUES
  (810101, 'Jes
se Klaver', 'Gouda');
INSERT INTO Bestelling
VALUES
  (default, 670427, '20161213');
SET @debestelling = last_insert_id();
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'won/hkli0006', 3);
INSERT INTO Bestelling
VALUES
  (default, 670427, '20161218');
SET 
@debestelling = last_insert_id();
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'HER/PMEL0038', 1);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'HER/BJBO0006', 2);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'HER/Jajo0006', 1);
INSERT INTO 
Bestelling
VALUES
  (default, 700115, '20161218');
SET @debestelling = last_insert_id();
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'WONWEHK0001', 1);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'HER/Jajo0006', 1);
INSERT INTO Bestelling
VALUES
  (def
ault, 810101, '20161207');
SET @debestelling = last_insert_id();
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'HER/BJBO0006', 1);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'herjajo0016', 1);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'HER/PMEL0
038', 4);
INSERT INTO Bestelling
VALUES
  (default, 691231, '20161128');
SET @debestelling = last_insert_id();
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'DAM/CWJU0001', 1);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'DAMGEIS0034', 1);
INSERT INTO 
Bestelregel
VALUES
  (@debestelling, 'dam/wehk0006', 1);
INSERT INTO Bestelregel
VALUES
  (@debestelling, 'DAM/Wehk0005', 1);


*/
/*

CREATE DATABASE Bestellingen;
USE Bestellingen;

CREATE TABLE Klant (
klantNummer
INT NOT NULL,
naam VARCHAR(45) NOT NULL,
plaats VARCHAR(45) NOT NULL
);
CREATE TABLE Bestelling (
bestelNummer
INT NOT NULL,
klantNr INT NOT NULL,
bestelDatum DATE NOT NULL
);
CREATE TABLE Artikel (
code VARCHAR(12) NOT NULL,
omschrijving
VARCHAR(45) NOT NULL,
btwtarief VARCHAR(4) NOT NULL,
artikelPrijs DECIMAL(6,2) NOT NULL,
voorraad INT NOT NULL
);
CREATE TABLE Bestelregel (
bestelNr INT NOT NULL,
artikelCode VARCHAR(12) NOT NULL,
aantal INT NOT NULL
);

*/