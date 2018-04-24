CREATE DATABASE IF NOT EXISTS Bedrijf;
USE Bedrijf;

CREATE TABLE IF NOT EXISTS Werknemer (
  wNr INT(4) NOT NULL,
  wNaam VARCHAR(45) NOT NULL,
  voorletters VARCHAR(10) NULL DEFAULT NULL,
  geboorteDatum DATE NOT NULL,
  functie VARCHAR(20) NOT NULL,
  salaris DECIMAL(7,2) NOT NULL,
  kamer VARCHAR(10) NOT NULL,
  chefNr INT(4) NULL DEFAULT NULL,
  aNr INT(2) NOT NULL,
  PRIMARY KEY (wNr));

CREATE TABLE IF NOT EXISTS Locatie (
  code VARCHAR(5) NOT NULL,
  omschrijving VARCHAR(45) NOT NULL,
  land VARCHAR(45) NOT NULL,
  beheerderNr INT(4) NULL DEFAULT NULL,
  PRIMARY KEY (code));

CREATE TABLE IF NOT EXISTS Afdeling (
  aNr INT(2) NOT NULL,
  aNaam VARCHAR(25) NOT NULL,
  locatieCode VARCHAR(5) NOT NULL,
  secretaresseNr INT(4) NULL DEFAULT NULL,
  PRIMARY KEY (aNr));

CREATE TABLE IF NOT EXISTS SalarisSchaal (
  schaal INT(2) NOT NULL,
  ondergrens DECIMAL(7,0) NOT NULL,
  bovengrens DECIMAL(7,0) NOT NULL,
  PRIMARY KEY (schaal));

ALTER TABLE Werknemer
  ADD CONSTRAINT Werknemer_heeft_Chef_fk
    FOREIGN KEY (chefNr) REFERENCES Werknemer (wNr),
  ADD CONSTRAINT Werknemer_werkt_op_Afdeling_fk
    FOREIGN KEY (aNr) REFERENCES Afdeling (aNr);

ALTER TABLE Locatie
  ADD CONSTRAINT Locatie_heeft_Beheerder_fk
    FOREIGN KEY (beheerderNr) REFERENCES Werknemer (wNr);

ALTER TABLE Afdeling
  ADD CONSTRAINT Afdeling_heeft_Secretaresse_fk
    FOREIGN KEY (secretaresseNr) REFERENCES Werknemer (wNr),
  ADD CONSTRAINT Afdeling_is_op_Locatie_fk
    FOREIGN KEY (locatieCode) REFERENCES Locatie (code);

INSERT INTO SalarisSchaal VALUES (1,700,1200);
INSERT INTO SalarisSchaal VALUES (2,1201,1400);
INSERT INTO SalarisSchaal VALUES (3,1401,2000);
INSERT INTO SalarisSchaal VALUES (4,2001,3000);
INSERT INTO SalarisSchaal VALUES (5,3001,9999);

INSERT INTO Locatie VALUES ( 'AMS', 'Amsterdam Damrak', 'Nederland', null);
INSERT INTO Locatie VALUES ( 'ROT', 'Rotterdam Maashaven', 'Nederland', null);
INSERT INTO Locatie VALUES ( 'PAR', 'Paris', 'Frankrijk', null);
INSERT INTO Locatie VALUES ( 'LON', 'London City', 'Groot-Brittannië', null);
INSERT INTO Locatie VALUES ( 'HAM', 'Hamburg', 'Duitsland', null);
INSERT INTO Afdeling VALUES (10, 'Accounting','AMS', null);
INSERT INTO Afdeling VALUES (20, 'Research', 'PAR', null);
INSERT INTO Afdeling VALUES (30, 'Sales','AMS', null);
INSERT INTO Afdeling VALUES (40, 'Supply & Distribution', 'ROT', null);
INSERT INTO Afdeling VALUES (50, 'Manufacturing','HAM', null);
INSERT INTO Afdeling VALUES (60, 'Operations','LON', null);

INSERT INTO Werknemer VALUES (7839, 'King', 'W.A.', '1981-11-17', 'CEO',  5000, '15A00', null, 10);
INSERT INTO Werknemer VALUES (7698, 'Barends', 'J.R.', '1981-05-01', 'Manager', 2850, '411', 7839, 30);
INSERT INTO Werknemer VALUES (7566, 'Duval', 'P.', '1981-04-02', 'Manager', 2975, 'A3-01', 7839, 20);
INSERT INTO Werknemer VALUES (7782, 'Clark', null, '1981-06-09', 'Manager', 2450, '11B23', 7839, 10 );
INSERT INTO Werknemer VALUES (7902, 'Macron', 'F.P.', '1981-12-03', 'Analyst', 2000, 'AAX-2', 7566, 20);
INSERT INTO Werknemer VALUES (7369, 'Dumière', 'D.', '1980-12-17', 'Technician', 1800, 'AAX-11', 7902, 20);
INSERT INTO Werknemer VALUES (7499, 'Adema', 'A.', '1981-02-20', 'Salesman', 1600, '223', 7698, 30);
INSERT INTO Werknemer VALUES (7521, 'Deutekom', 'C. van', '1981-01-22', 'Secretary', 1050, '135', 7698, 20);
INSERT INTO Werknemer VALUES (7788, 'Magrait', 'F.', '1982-12-09', 'Analyst', 2200, 'B2-04', 7566, 20);
INSERT INTO Werknemer VALUES (7654, 'Martens', null, '1981-09-28', 'Salesman', 2250, '231', 7698, 30);
INSERT INTO Werknemer VALUES (7844, 'Dijkstra', 'E.W.', '1981-09-08', 'Salesman', 1500, '15A01', 7698, 30);
INSERT INTO Werknemer VALUES (7876, 'Papail', 'E.', '1983-01-12', 'Technician', 1700, 'AAX-11', 7788, 20);
INSERT INTO Werknemer VALUES (7900, 'Jansen', 'J.', '1981-12-03', 'Salesman', 1950, '15A01', 7698, 30 );
INSERT INTO Werknemer VALUES (7934, 'Miller', 'C.A.', '1982-01-23', 'Secretary', 1250, '15A01', 7782, 10);
INSERT INTO Werknemer VALUES (7417, 'Jager', 'R. de', '1970-03-10', 'Manager', 2685, '15A01', 7839, 40);
INSERT INTO Werknemer VALUES (7421, 'Drupper', 'K.', '1967-03-10', 'Analyst', 1685, 'C01-14', 7417, 40);
INSERT INTO Werknemer VALUES (7443, 'Holleder', 'W.', '1963-01-10', 'Technician', 1865, 'C01-19', 7417, 40);
INSERT INTO Werknemer VALUES (7623, 'Fritz', 'F.J.', '1963-03-12', 'Manager', 2985, 'A3-01', 7839, 50);
INSERT INTO Werknemer VALUES (7635, 'Frölich', 'M.', '1995-05-12', 'Technician', 1320, 'B7-24', 7623, 50);
INSERT INTO Werknemer VALUES (7647, 'Derckx', 'J.', '1998-01-12', 'Technician', 980, 'B7-25', 7623, 50);
INSERT INTO Werknemer VALUES (7658, 'Dietrich', 'M.', '1998-01-12', 'Secretary', 780, 'B7-25', 7623, 50);
INSERT INTO Werknemer VALUES (7663, 'Müller', 'A.', '1990-01-12', 'Technician', 1590, 'B4-28', 7623, 50);

UPDATE Locatie SET beheerderNr=7698 WHERE code='AMS';
UPDATE Locatie SET beheerderNr=7698 WHERE code='ROT';
-- UPDATE Locatie SET beheerderNr=7566 WHERE code='PAR';
-- UPDATE Locatie SET beheerderNr=7839 WHERE code='LON';
UPDATE Locatie SET beheerderNr=7623 WHERE code='HAM';

UPDATE Afdeling SET secretaresseNr=7934 WHERE aNr=10;
UPDATE Afdeling SET secretaresseNr=7521 WHERE aNr=20;
UPDATE Afdeling SET secretaresseNr=7934 WHERE aNr=30;
-- UPDATE Afdeling SET secretaresseNr=7934 WHERE aNr=40;
UPDATE Afdeling SET secretaresseNr=7647 WHERE aNr=50;
-- UPDATE Afdeling SET secretaresseNr=7934 WHERE aNr=60;
