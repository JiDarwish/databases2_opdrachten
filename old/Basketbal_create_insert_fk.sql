CREATE DATABASE Basketbal;

USE Basketbal;

CREATE TABLE Boete
(
  betalingnummer smallint NOT NULL,
  lidnr smallint NOT NULL,
  boetetype varchar(1) NOT NULL,
  datumovertreding date NOT NULL,
  bedrag decimal(5,2) NOT NULL,
  PRIMARY KEY (betalingnummer)
);

CREATE TABLE Lid
(
  lidnr smallint NOT NULL,
  achternaam varchar(25) NOT NULL,
  voorletters varchar(6) NOT NULL,
  tussenvoegsel varchar(7),
  geb_datum date NOT NULL,
  geslacht varchar(1) NOT NULL,
  straat varchar(50) NOT NULL,
  huisnr varchar(4) NOT NULL,
  toevoeging varchar(4),
  postcode varchar(7) NOT NULL,
  woonplaats varchar(50) NOT NULL,
  telefoon varchar(15),
  emailadres varchar(50),
  speelt_in varchar(10),
  PRIMARY KEY (lidnr)
);

CREATE TABLE Sporthal
(
  sporthalnaam varchar(25) NOT NULL,
  sporthalplaats varchar(25) NOT NULL,
  aantalvelden smallint NOT NULL,
  PRIMARY KEY (sporthalnaam)
);

CREATE TABLE Team
(
  teamcode varchar(10) NOT NULL,	
  klasse varchar(8) NOT NULL,
  teamnaam varchar(50) NOT NULL,
  thuishal varchar(25) NOT NULL,
  aanvoerder smallint NOT NULL,
  PRIMARY KEY (teamcode)
);


CREATE TABLE Wedstrijd
(
  datum date NOT NULL,
  tijd time NOT NULL,
  teamthuis varchar(10) NOT NULL,
  teamuit varchar(10) NOT NULL,
  veld smallint NOT NULL,
  scorethuis int NOT NULL,
  scoreuit int NOT NULL,
  PRIMARY KEY (datum, tijd, teamthuis)
);

CREATE TABLE BestuursFunctie (
  functie varchar(25),
  begindatum date NOT NULL,
  einddatum date,
  lidnr smallint NOT NULL,
  PRIMARY KEY (functie, begindatum)
) ;

ALTER TABLE Boete 
ADD CONSTRAINT Lid_heeft_Boete_fk
  FOREIGN KEY (lidnr) REFERENCES Lid (lidnr);

ALTER TABLE Team 
ADD CONSTRAINT Team_heeft_Aanvoerder_fk
  FOREIGN KEY (aanvoerder) REFERENCES Lid (lidnr),
ADD CONSTRAINT Team_speelt_in_Thuishal_fk
  FOREIGN KEY (thuishal)  REFERENCES Sporthal (sporthalnaam);

ALTER TABLE Wedstrijd 
ADD CONSTRAINT ThuisTeam_van_Wedstrijd_fk
  FOREIGN KEY (teamthuis)  REFERENCES Team (teamcode),
ADD CONSTRAINT UitTeam_van_Wedstrijd_fk
  FOREIGN KEY (teamuit)  REFERENCES Team (teamcode);
  
ALTER TABLE BestuursFunctie 
ADD CONSTRAINT Lid_heeft_Bestuursfunctie_fk
  FOREIGN KEY (lidnr)  REFERENCES Lid (lidnr);

-- Insert Sporthallen
INSERT INTO Sporthal VALUES ('IJmuiden Oost', 'IJmuiden', 3);
INSERT INTO Sporthal VALUES ('Topsportcentr.', 'Almere Almere' ,2);
INSERT INTO Sporthal VALUES ('Waterwijk', 'Almere' ,2);
INSERT INTO Sporthal VALUES ('De Eckart', 'Eindhoven' ,3);
INSERT INTO Sporthal VALUES ('Sporthal de Weide Wereld', 'Vleuten',2);
INSERT INTO Sporthal VALUES ('Waterwin', 'Utrecht',4);
INSERT INTO Sporthal VALUES ('Kalverdijkje', 'Leeuwarden',2);
INSERT INTO Sporthal VALUES ('De Laar', 'Arnhem',2);
INSERT INTO Sporthal VALUES ('De Bongerd', 'Bemmel' ,3);
INSERT INTO Sporthal VALUES ('De Driesprong', 'Barendrecht',2);
INSERT INTO Sporthal VALUES ('Hazelaar', 'Rosmalen',2);
INSERT INTO Sporthal VALUES ('Carla de Liefdehal', 'Oud-Beijerland',3);
INSERT INTO Sporthal VALUES ('De Paperclip', 'Utrecht',4);
INSERT INTO Sporthal VALUES ('Vinkhuizen', 'Groningen',4);
INSERT INTO Sporthal VALUES ('Forum Kwadraat', 'Voorburg',3);
INSERT INTO Sporthal VALUES ('Schutskamp', 'den bosch',4);
INSERT INTO Sporthal VALUES ('Maaspoort', 'den bosch',3);
INSERT INTO Sporthal VALUES ('Burg. Verdegaalhal', 'Tubbergen',2);
INSERT INTO Sporthal VALUES ('Martiniplaza', 'Groningen',2);
INSERT INTO Sporthal VALUES ('Willem Alexander sportc.', 'Groningen',3);
INSERT INTO Sporthal VALUES ('De Oude Alo', 'Groningen',2);
INSERT INTO Sporthal VALUES ('Oosterbliek', 'Gorinchem',2);
INSERT INTO Sporthal VALUES ('Struikhal', 'Groningen',2);
INSERT INTO Sporthal VALUES ('Brasserskade', 'Delft',3);
INSERT INTO Sporthal VALUES ('Sportcentrum Caland', 'Amsterdam',4);
INSERT INTO Sporthal VALUES ('Sportlaan', 'Den Helder',2);
INSERT INTO Sporthal VALUES ('Spectrum', 'Hoofddorp',3);
INSERT INTO Sporthal VALUES ('Scharlakenhof', 'Haren', 3);
INSERT INTO Sporthal VALUES ('Stadssporthal', 'Tilburg',2);
INSERT INTO Sporthal VALUES ('Deppenbroek', 'Enschede',4);
INSERT INTO Sporthal VALUES ('De Vlechttuinen', 'Urk',2);
INSERT INTO Sporthal VALUES ('De Vredehof', 'Hoorn',2);
INSERT INTO Sporthal VALUES ('ZBC-hal', 'Zwolle',3);
INSERT INTO Sporthal VALUES ('Stilohal', 'Zwolle',2);
INSERT INTO Sporthal VALUES ('De Bloemerd', 'Leiderdorp',2);
INSERT INTO Sporthal VALUES ('Apollohal', 'Amsterdam',4);
INSERT INTO Sporthal VALUES ('van Zweedenzaal', 'Rijswijk',2);
INSERT INTO Sporthal VALUES ('Horstacker', 'Nijmegen',2);
INSERT INTO Sporthal VALUES ('Northgohal', 'Noordwijk',3);
INSERT INTO Sporthal VALUES ('Sporthallen Zuid', 'Amsterdam',4);
INSERT INTO Sporthal VALUES ('Sporth. Galecop', 'Nieuwegein',2);
INSERT INTO Sporthal VALUES ('Het Veerhuis', 'Nieuwegein',3);
INSERT INTO Sporthal VALUES ('Sportcenter', 'Den Helder',2);
INSERT INTO Sporthal VALUES ('De Slenk', 'Den Helder',3);
INSERT INTO Sporthal VALUES ('StudentenSporthal UVT', 'Tilburg',3);
INSERT INTO Sporthal VALUES ('Sportcentr. Drachten', 'Drachten',2);
INSERT INTO Sporthal VALUES ('Indoor Centrum', 'Landsmeer',4);
INSERT INTO Sporthal VALUES ('Sportcentrum TU', 'Delft',3);
INSERT INTO Sporthal VALUES ('Het Vledder', 'Meppel',4);
INSERT INTO Sporthal VALUES ('De Wielewaal', 'Hardinxveld-Giessendam',2);
INSERT INTO Sporthal VALUES ('De Kienehoef', 'Sint-Oederode',2);
INSERT INTO Sporthal VALUES ('Alexanderhal', 'Rotterdam',4);
INSERT INTO Sporthal VALUES ('Topsportcentrum', 'Rotterdam',3);
INSERT INTO Sporthal VALUES ('Sterrenburg', 'Dordrecht',4);
INSERT INTO Sporthal VALUES ('De Kuil', 'Bunschoten',2);
INSERT INTO Sporthal VALUES ('Cleyn Duin', 'Katwijk',3);
INSERT INTO Sporthal VALUES ('Galgenwaard', 'Utrecht',4);
INSERT INTO Sporthal VALUES ('Boshoven', 'Weert',2);
INSERT INTO Sporthal VALUES ('Wibauthal', 'Amsterdam',4);
INSERT INTO Sporthal VALUES ('Die Heygrave', 'Vlijmen',3);
INSERT INTO Sporthal VALUES ('Baskensburg', 'Vlissingen',3);
INSERT INTO Sporthal VALUES ('Sporthal Boulevard', 'Bergen op Zoom',3);
INSERT INTO Sporthal VALUES ('De Slinger', 'Houten',2);
INSERT INTO Sporthal VALUES ('Sporthal de Slagen', 'Waalwijk',3);
INSERT INTO Sporthal VALUES ('Vijf Meihal', 'Leiden',4);

-- Insert Leden
INSERT INTO Lid VALUES (1, 'Laan','P','van der','1985-03-21','m','Haarlemmerweg',477,'a','1055PK','Amsterdam','0206359120','Pvd.Laan@gmail.com','AMSTH1');
INSERT INTO Lid VALUES (108, 'Visser','G.F','de','1984-06-25','m','Kerkstraat ',23,'III','1088DA','Amsterdam','0209385628','visser@gmail.com','AMSTH1');
INSERT INTO Lid VALUES (109, 'Vries','N','de','1987-05-23','v','Dapperstraat ',388,NULL,'1095XS','Amsterdam','0208477564','vries@hotmail.com ','LEAMD1');
INSERT INTO Lid VALUES (110, 'Bakker','K',NULL,'1988-06-01','v','Boerhaveplein',2,'a','1088KM','Amsterdam','0207584639','broodje@tiscali.nl','LEAMD1');
INSERT INTO Lid VALUES (111, 'Jennes','M','van','1970-08-09','v','Hunnellaan ',3,NULL,'1098KM','Amsterdam','0208457759','piko@hotmail.nl','LEAMD1');
INSERT INTO Lid VALUES (2, 'Costache','D',NULL,'1981-10-02','v','Ward Bingleystraat',8,NULL,'1066TB','Amsterdam','0207095145','costache@gmail.com','LEAMD1');
INSERT INTO Lid VALUES (113, 'Wenslaar','A',NULL,'1980-07-12','v','Wagenaarstraat',23,NULL,'1094HN','Amsterdam','0208463957','hansje@upcmail.nl ','LEAMD1');
INSERT INTO Lid VALUES (3, 'Aleksi','H.Y',NULL,'1980-11-11','m','Mauritskade',58,NULL,'1055PD','Amsterdam','0208091324','H.Y.Aleksi@gmail.com','AMSTH2');
INSERT INTO Lid VALUES (4, 'Mactavish','E',NULL,'1979-12-24','m','Achtergracht',71,NULL,'1071HF','Amsterdam','0204520530','E.Mactavish@gmail.com','AMSTH1');
INSERT INTO Lid VALUES (5, 'Temmink','K',NULL,'1987-05-12','m','Gover Flinkstraat',23,NULL,'1100IN','Amsterdam','0207436803','K.Temmink@gmail.com','AMSTH1');
INSERT INTO Lid VALUES (6, 'Weijer','A',NULL,'1975-02-05','m','Prinsengracht',76,NULL,'1061VE','Amsterdam','0208603454','A.Weijer@gmail.com','AMSTH1');
INSERT INTO Lid VALUES (7, 'Croon','R',NULL,'1983-10-15','m','Van Breestraat',39,NULL,'1041RU','Amsterdam','0204124654','R.Croon@gmail.com','AMSTH2');
INSERT INTO Lid VALUES (8, 'Homborg','B.P',NULL,'1985-06-30','m','Bart de ligtstaat',23,NULL,'1059NM','Amsterdam','0201345287','B.P.Homborg@gmail.com','AMSTH2');
INSERT INTO Lid VALUES (9, 'Bos','J.P',NULL,'1983-01-05','m','Borneolaan',74,NULL,'1092LW','Amsterdam',NULL,'J.P.Bos@gmail.com','AMSTH2');
INSERT INTO Lid VALUES (10, 'Juurlink','T',NULL,'1976-01-05','m','Kijkduinstraat',13,NULL,'1054XA','Amsterdam','0204523579','T.Juurlink@gmail.com','AMSTH2');
INSERT INTO Lid VALUES (11, 'Schaap','W',NULL,'1921-07-24','m','Ziedewijdsebaan',53,NULL,'2992LC','Barendrecht','0180812302','W.Schaap@gmail.com','CBVBH1');
INSERT INTO Lid VALUES (12, 'Oneil','G.S',NULL,'1990-12-11','m','Klipper',12,NULL,'2990RT','Barendrecht','0180785949','G.S.Oneil@gmail.com','CBVBH1');
INSERT INTO Lid VALUES (13, 'Kater','B',NULL,'1985-03-06','m','Wilheminastraat',65,NULL,'2989IO','Barendrecht','0180984137','B.Kater@gmail.com','CBVBH1');
INSERT INTO Lid VALUES (14, 'Pieterson','C.A',NULL,'1991-12-15','m','Scheldestraat',123,NULL,'2993CL','Barendrecht','0180790124','C.A.Pieterson@gmail.com','CBVBH1');
INSERT INTO Lid VALUES (15, 'Sanderson','W',NULL,'1986-10-05','m','Walmolen',34,NULL,'2995UY','Barendrecht','0180874911','W.Sanderson@gmail.com','CBVBH1');
INSERT INTO Lid VALUES (16, 'Price','T',NULL,'1982-10-03','m','Koepelstraat',13,NULL,'4622AH','Bergen Op Zoom','0307412356','T.Price@gmail.com','WCAAH1');
INSERT INTO Lid VALUES (17, 'Schoen','V',NULL,'1984-12-31','m','Mozartlaan',57,NULL,'4620NU','Bergen Op Zoom','0305879027','V.Schoen@gmail.com','WCAAH1');
INSERT INTO Lid VALUES (18, 'Steen','E',NULL,'1987-07-13','m','Wouwsestraatweg',125,NULL,'4623LP','Bergen Op Zoom','0308490315','E.Steen@gmail.com','WCAAH1');
INSERT INTO Lid VALUES (19, 'Oosten','P',NULL,'1982-08-12','m','Drebbelstraat',64,NULL,'4610BP','Bergen Op Zoom','0309421456','P.Oosten@gmail.com','WCAAH1');
INSERT INTO Lid VALUES (20, 'Tromp','T',NULL,'1980-05-31','m','Zandstraat',45,NULL,'4690RE','Bergen Op Zoom','0307890412','T.Tromp@gmail.com','WCAAH1');
INSERT INTO Lid VALUES (21, 'Kluijse ','J',NULL,'1990-01-06','m','Eliza Dorusstraat',74,NULL,'2616WR','Delft','0152686730','KluijseJ@gmail.com','DSBVH1');
INSERT INTO Lid VALUES (22, 'Riet','S',NULL,'1975-03-08','m','Leeghwaterstraat',15,NULL,'2629QV','Delft','0157520135','Riet@msn.com ','DSBVH1');
INSERT INTO Lid VALUES (23, 'Vliecher','O',NULL,'1983-12-30','v','vlasakker',6,NULL,'2723JT','Zoetermeer','0791235710','Vliecher@gmail.com','DASDD1');
INSERT INTO Lid VALUES (24, 'Tessla','B',NULL,'1988-08-06','m','Bossenwaard',31,NULL,'2751TB','Zoetermeer ','0799023654','Tessla@gmail.com','DSBVH1');
INSERT INTO Lid VALUES (25, 'Cretien ','L',NULL,'1983-10-10','m','Voorstraat',54,NULL,'2625OE','Delft','0155385921','LCretien@gmail.com','DSBVH1');
INSERT INTO Lid VALUES (26, 'Quinton ','F',NULL,'1992-02-13','v','Hof van Delftstraat',86,NULL,'2631TX','Nootdorp','0158104514','Quinton.F@gmail.com ','DASDD1');
INSERT INTO Lid VALUES (27, 'Ruitt','Z',NULL,'1990-02-28','v','Kievitsbloem',23,NULL,'2631OA','Nootdorp','0151363013','ZRuitt@gmail.com','DASDD1');
INSERT INTO Lid VALUES (28, 'Sempas','U',NULL,'1990-01-16','v','Rotterdamse weg',65,NULL,'2616GY','Delft',NULL,'Sempas.U@gmail.com','DASDD1');
INSERT INTO Lid VALUES (29, 'Fietsma ','A',NULL,'1990-06-01','m','Henry Dunantlaan',1,NULL,'2620AR','Delft','0155732945','AFietsma@home.nl','DSBVH1');
INSERT INTO Lid VALUES (30, 'Kerlinghof','C',NULL,'1984-10-28','v','Cromelienlaan',9,NULL,'2623HT','Delft','0155794920','Kerlinghof@yahoo.com','DASDD1');
INSERT INTO Lid VALUES (31, 'Pereboom','W',NULL,'1982-08-15','m','Peperstraat',63,NULL,'5211NY','Den Bosch','0735914652','Pereboom@hotmail.com','EBBCH2');
INSERT INTO Lid VALUES (32, 'Nieuwlaat','Z',NULL,'1991-06-09','m','Acaciasingel',123,NULL,'5200KO','Den Bosch','0736921415','Nieuwlaat@hotmail.com','EBBCH2');
INSERT INTO Lid VALUES (33, 'Ebbe','V.P',NULL,'1979-10-10','m','Weberstraat',87,NULL,'5287HG','Den Bosch',NULL,'Ebbe@hotmail.com','EBBCH2');
INSERT INTO Lid VALUES (34, 'Dekker','K',NULL,'1986-06-17','m','Pieter van Osstraat',52,NULL,'5260BU','Den Bosch','0734093413','Dekker@hotmail.com','EBBCH2');
INSERT INTO Lid VALUES (35, 'Jusche','P',NULL,'1976-05-12','m','Uilenburg',15,NULL,'5300BE','Den Bosch','0739682053','Jusche@hotmail.com','EBBCH2');
INSERT INTO Lid VALUES (36, 'Lari','L',NULL,'1987-12-29','v','Ooievaarstraat',9,NULL,'1783AX','Den Helder','0223386451','Lari@hotmail.com','HLBAD1');
INSERT INTO Lid VALUES (37, 'Balkenende','E',NULL,'1985-02-27','v','Huygenstraat',4,NULL,'1701VT','Den Helder','02231923-4','Balkenende@hotmail.com','HLBAD1');
INSERT INTO Lid VALUES (38, 'Gragt','T','van den','1986-09-14','v','Amstelstraat',65,NULL,'1731DP','Den Helder','0223413570','Gragt@hotmail.com','HLBAD1');
INSERT INTO Lid VALUES (39, 'Lukkarinen','C',NULL,'1989-06-13','v','Ijsselmeerstraat',95,NULL,'1942KX','Den Helder','0223491320','Lukkarinen@hotmail.com','HLBAD1');
INSERT INTO Lid VALUES (40, 'Pechtold','K.J',NULL,'1987-09-26','v','Baljuwstraat',58,NULL,'1901AS','Den Helder','0223943295','Pechtold@hotmail.com','HLBAD1');
INSERT INTO Lid VALUES (41, 'Gherghina','R',NULL,'1989-03-18','m','Nieuwe Hoven',48,NULL,'4205OX','Gorinchem','0183810234','Gherghina@hotmail.com','GOBAH1');
INSERT INTO Lid VALUES (42, 'Smit','F',NULL,'1982-03-02','m','Loevesteinstraat',100,NULL,'4170VD','Gorinchem','0183857901','Smit@hotmail.com','GOBAH1');
INSERT INTO Lid VALUES (43, 'Berg','W','van den','1986-02-12','m','Don Antoniostraat',13,NULL,'4197HY','Gorinchem','0183879520','Berg@hotmail.com','GOBAH1');
INSERT INTO Lid VALUES (44, 'Maertens','C',NULL,'1989-09-09','m','Willem van Arkellaan',13,NULL,'4206SM','Gorinchem','0183950234','Maertens@hotmail.com','GOBAH1');
INSERT INTO Lid VALUES (45, 'Konijn','G.F',NULL,'1977-06-06','m','Westwagenstraat',66,NULL,'4214UC','Gorinchem','0183983013','Konijn@hotmail.com','GOBAH1');
INSERT INTO Lid VALUES (46, 'Kazem','W',NULL,'1979-03-15','m','Hesperenstraat',75,NULL,'5044EN','Tilburg','0136401483','Kazem@hotmail.com','HIFIH1');
INSERT INTO Lid VALUES (47, 'Ruwald','C',NULL,'1986-10-19','m','Tuinstraat',12,NULL,'5123AN','Tilburg','0139301748','Ruwald@hotmail.com','HIFIH1');
INSERT INTO Lid VALUES (48, 'Nieuwveld','J',NULL,'1983-01-08','m','Twentestraat',102,NULL,'5461MU','Tilburg','0139501231','Nieuwveld@hotmail.com','HIFIH1');
INSERT INTO Lid VALUES (49, 'Vinatoru','I',NULL,'1990-04-10','m','Havendijk',4,NULL,'4912PP','Tilburg','0135813055','I.Vinatoru@live.nl','HIFIH1');
INSERT INTO Lid VALUES (50, 'Kirves','R',NULL,'1978-06-18','m','Broekhovenseweg',65,NULL,'4879RC','Tilburg','0133849162','R.Kirves@live.nl','HIFIH1');
INSERT INTO Lid VALUES (51, 'Mensink','H',NULL,'1985-02-19','m','Van Iddekingsweg',88,NULL,'9712HN','Groningen','0504891237','H.Mensink@live.nl','GAFLH1');
INSERT INTO Lid VALUES (52, 'Tolboom','D',NULL,'1984-12-17','m','Koeriersterweg',74,NULL,'9743JL','Groningen','0500128730','D.Tolboom@live.nl','GAFLH1');
INSERT INTO Lid VALUES (53, 'Rektor','P',NULL,'1987-05-13','m','Rivierenhof',61,NULL,'9651DE','Groningen','0507589012','P.Rektor@live.nl','GAFLH1');
INSERT INTO Lid VALUES (54, 'Noordam','M',NULL,'1985-12-11','m','Parkweg',90,NULL,'9790UR','Groningen','0508709652','M.Noordam@live.nl','GAFLH1');
INSERT INTO Lid VALUES (55, 'Brood','P.I',NULL,'1989-10-19','m','Lodewijkstraat',47,NULL,'9705BN','Groningen','0507894532','P.I.Brood@live.nl','GAFLH1');
INSERT INTO Lid VALUES (56, 'Werner','G.F',NULL,'1980-01-14','m','Boumaboulevard',95,NULL,'9731FR','Groningen','0507850104','G.F.Werner@live.nl','GRUIH1');
INSERT INTO Lid VALUES (57, 'Vorm','N',NULL,'1985-10-11','m','Galenuslaan',35,NULL,'9743LT','Groningen',NULL,'N.Vorm@live.nl','GRUIH1');
INSERT INTO Lid VALUES (58, 'Heus','S',NULL,'1988-10-01','m','Schaakport',66,NULL,'97135QA','Groningen','0505601346','S.Heus@live.nl','GRUIH1');
INSERT INTO Lid VALUES (59, 'Veenstra','R',NULL,'1983-07-18','m','Leeuwarderstraat',13,NULL,'97458HY','Groningen','0507014032','R.Veenstra@live.nl','GRUIH1');
INSERT INTO Lid VALUES (60, 'Zomer','U',NULL,'1986-01-07','m','Koninginnelaan',63,NULL,'9734HN','Groningen','0508097420','U.Zomer@live.nl','GRUIH1');
INSERT INTO Lid VALUES (61, 'Brard','B',NULL,'1986-01-14','v','Jozef Israelstraat',16,NULL,'9784IP','Groningen','0507890547','B.Brard@live.nl','CEDOD1');
INSERT INTO Lid VALUES (62, 'Munk','Z',NULL,'1987-01-30','v','Damsterdiep',73,NULL,'9763WK','Groningen','0507895434','Z.Munk@live.nl','CEDOD1');
INSERT INTO Lid VALUES (63, 'Dissen','Y',NULL,'1984-05-26','v','Spilsluizen',37,NULL,'9754PC','Groningen',NULL,'Y.Dissen@live.nl','CEDOD1');
INSERT INTO Lid VALUES (64, 'Baptista','R',NULL,'1986-03-15','v','Barestraat',76,NULL,'9832MP','Groningen','0507895021','R.Baptista@live.nl','CEDOD1');
INSERT INTO Lid VALUES (65, 'Las','S',NULL,'1976-01-18','v','Van Houtenlaan',13,NULL,'9758HS','Groningen','0501065204','S.Las@live.nl','CEDOD1');
INSERT INTO Lid VALUES (66, 'Medem','B',NULL,'1987-05-01','m','Lutkemeerstraat',6,NULL,'2131BL','Hoofddorp','0237890250','B.Medem@live.nl','HFFDH1');
INSERT INTO Lid VALUES (67, 'Wallis','M',NULL,'1981-08-16','m','Van den berghlaan',86,NULL,'2210HY','Hoofddorp','0237809123','M.Wallis@live.nl','HFFDH1');
INSERT INTO Lid VALUES (68, 'Herrera','K',NULL,'1980-01-08','m','Boekanierlaan',14,NULL,'2147MN','Hoofddorp','0237854104','K.Herrera@live.nl','HFFDH1');
INSERT INTO Lid VALUES (69, 'Posen','H',NULL,'1979-05-29','m','Graan voor Visch',7,NULL,'2064CE','Hoofddorp',NULL,'H.Posen@live.nl','HFFDH1');
INSERT INTO Lid VALUES (70, 'Manolache','Y.R',NULL,'1984-12-10','m','Engelsholm',64,NULL,'2054BE','Hoofddorp','0237890542','Y.R.Manolache@live.nl','HFFDH1');
INSERT INTO Lid VALUES (71, 'Lauren','J',NULL,'1977-10-13','m','Julianakade',43,NULL,'1971EN','Ijmuiden','0255852940','J.Lauren@live.nl','VBCAH1');
INSERT INTO Lid VALUES (72, 'Rouvoet','S',NULL,'1984-06-03','m','Zeeweg',1,NULL,'1841YC','Ijmuiden','0255780521','S.Rouvoet@live.nl','VBCAH1');
INSERT INTO Lid VALUES (73, 'Spears','R',NULL,'1989-01-04','m','De Noostraat',39,NULL,'2004WC','Ijmuiden','0255829352','R.Spears@live.nl','VBCAH1');
INSERT INTO Lid VALUES (74, 'Boer','C.N','de','1980-04-08','m','Wilgenstraat',68,NULL,'1934VU','Ijmuiden','0255780952','C.N.Boer@live.nl','VBCAH1');
INSERT INTO Lid VALUES (75, 'Jackson','R',NULL,'1976-07-12','m','Kalverstraat',18,NULL,'1947RM','Ijmuiden','0255798010','R.Jackson@live.nl','VBCAH1');
INSERT INTO Lid VALUES (76, 'Kuijper ','Q',NULL,'1977-02-25','v','Rijnstraat ',5,NULL,'2716JU','Katwijk ','0719461341','Q.Kuijper @live.nl','STOLD1');
INSERT INTO Lid VALUES (77, 'Kluissenear','I',NULL,'1993-06-14','v','Nieuwe Duindijk',70,NULL,'2167XZ','Katwijk ','0714012541','I.Kluissenear@live.nl','STOLD1');
INSERT INTO Lid VALUES (78, 'Hoogenboom','U',NULL,'1988-08-18','v','Nachtegaallaan',45,NULL,'2754OX','Katwijk ','0717802453','U.Hoogenboom@live.nl','STOLD1');
INSERT INTO Lid VALUES (79, 'Jong','N',NULL,'1980-06-01','v','Stadshoudersdreef',76,NULL,'2609EC','Katwijk ',NULL,'N.Jong@live.nl','STOLD1');
INSERT INTO Lid VALUES (80, 'Tuinman','M',NULL,'1986-01-30','v','Sluisweg',13,NULL,'2674QA','Katwijk ','0718793923','M.Tuinman@live.nl','STOLD1');
INSERT INTO Lid VALUES (81, 'Presley','Q',NULL,'1976-04-13','v','Rhijnestein',86,NULL,'1121AA','Landsmeer','0208952160','Q.Presley@live.nl','PBLid1');
INSERT INTO Lid VALUES (82, 'Stiekema','S.D',NULL,'1984-05-19','v','Herculesweg',24,NULL,'1251DK','Landsmeer','0208901385','S.D.Stiekema@live.nl','PBLid1');
INSERT INTO Lid VALUES (83, 'Haanappel','N',NULL,'1987-03-19','v','Kerkerbreek',76,NULL,'1193RC','Landsmeer','0208791094','N.Haanappel@live.nl','PBLid1');
INSERT INTO Lid VALUES (84, 'Karrenbelt','M',NULL,'1986-08-19','v','Docter Martin Luther Kingweg',24,NULL,'1351BL','Landsmeer','0207589630','M.Karrenbelt@live.nl','PBLid1');
INSERT INTO Lid VALUES (85, 'Horst','E',NULL,'1990-05-04','v','Reigerlaan',68,NULL,'1037LZ','Landsmeer','0208790148','E.Horst@live.nl','PBLid1');
INSERT INTO Lid VALUES (86, 'Willemsen','U',NULL,'1987-07-19','m','Hollanderstraat',43,NULL,'8911DH','Leeuwarden','0589870213','U.Willemsen@live.nl','ARISH1');
INSERT INTO Lid VALUES (87, 'Christiansen','B',NULL,'1982-08-16','m','Emmakade',13,NULL,'9013WR','Leeuwarden','0588709517','B.Christiansen@live.nl','ARISH1');
INSERT INTO Lid VALUES (88, 'Engel','M',NULL,'1980-06-19','m','Fruitstraat',65,NULL,'8856SN','Leeuwarden','0587809543',NULL,'ARISH1');
INSERT INTO Lid VALUES (89, 'Sturm','F',NULL,'1982-07-19','m','Coopmansstraat',76,NULL,'8950CD','Leeuwarden','0585410452','F.Sturm@live.nl','ARISH1');
INSERT INTO Lid VALUES (90, 'Wensink','D.Y',NULL,'1981-08-12','m','Wijbrand de Geestraat',3,NULL,'8841YU','Leeuwarden','0580958359','D.Y.Wensink@live.nl','ARISH1');
INSERT INTO Lid VALUES (91, 'Haasse','U',NULL,'1994-01-06','m','Van Vollenhovenkade',105,NULL,'2312BS','Leiden','0715356135','U.Haasse@live.nl','ZZLEH2');
INSERT INTO Lid VALUES (92, 'Kluismart ','Q',NULL,'1988-06-01','m','Willem De Zwijgerlaan',51,NULL,'2461AU','Leiden','0714542457','Q.Kluismart @live.nl','ZZLEH2');
INSERT INTO Lid VALUES (93, 'Jansma','J','van','1994-05-21','m','De Bazelstraat',22,NULL,'2365FR','Leiden',NULL,'J.Jansma@live.nl','ZZLEH2');
INSERT INTO Lid VALUES (94, 'Dijk','D','van','1998-11-30','m','Boommarkt',53,NULL,'2312NB','Leiden','0718329569','D.Dijk@live.nl','ZZLEH2');
INSERT INTO Lid VALUES (95, 'Tromp','L',NULL,'1989-12-06','m','Trompstraat',45,NULL,'2341UI','Leiden','0714593214','L.Tromp@live.nl','ZZLEH2');
INSERT INTO Lid VALUES (96, 'Berger','M.R',NULL,'1983-05-09','m','Pieterskerkhof',13,NULL,'2391LI','Leiden','0719714971','M.R.Berger@live.nl','ZZLEH1');
INSERT INTO Lid VALUES (97, 'Hoes','T',NULL,'1987-10-12','m','Apothekersdijk',66,NULL,'2341RX','Leiden','0717852938','T.Hoes@live.nl','ZZLEH1');
INSERT INTO Lid VALUES (98, 'Albulescu','U',NULL,'1984-03-17','m','Noordeinde',86,NULL,'2418UI','Leiden','0718795024','U.Albulescu@live.nl','ZZLEH1');
INSERT INTO Lid VALUES (99, 'Vlaming','Y',NULL,'1989-08-30','m','Morsstraat',13,NULL,'2375IN','Leiden','0711045024','Y.Vlaming@live.nl','ZZLEH1');
INSERT INTO Lid VALUES (100, 'Vayne','N.R',NULL,'1978-04-17','m','Langebrug',143,NULL,'2370LP','Leiden',NULL,'N.R.Vayne@live.nl','ZZLEH1');
INSERT INTO Lid VALUES (101, 'Kistemaker','B',NULL,'1980-06-18','v','Winterkade',64,NULL,'2410QE','Leiderdorp','0718928441','B.Kistemaker@live.nl','WNLLD1');
INSERT INTO Lid VALUES (102, 'Bruers','M',NULL,'1986-10-17','v','Hoogmadeseweg',86,NULL,'2430TV','Leiderdorp','0717850920','M.Bruers@live.nl','WNLLD1');
INSERT INTO Lid VALUES (103, 'Bloemink','G.L',NULL,'1983-02-11','v','Lekstraat',19,NULL,'2316WH','Leiderdorp','0717859027','G.L.Bloemink@live.nl','WNLLD1');
INSERT INTO Lid VALUES (104, 'Hek','X',NULL,'1986-01-15','v','Korensbloemkamp',14,NULL,'2419PZ','Leiderdorp','0719850231','X.Hek@live.nl','WNLLD1');
INSERT INTO Lid VALUES (105, 'Franke','B',NULL,'1984-03-31','v','Vogellaan',75,NULL,'2319NG','Leiderdorp','0716745924','B.Franke@live.nl','WNLLD1');
INSERT INTO Lid VALUES (106, 'Mulders','M',NULL,'1987-12-14','m','Randweg',13,NULL,'7940TY','Meppel','0522381920','M.Mulders@live.nl','REDGH1');
INSERT INTO Lid VALUES (107, 'Komen','D',NULL,'1980-08-01','m','Troulstraplein',68,NULL,'7812FR','Meppel','0522401237','D.Komen@live.nl','REDGH1');
INSERT INTO Lid VALUES (112, 'Mattson','E',NULL,'1987-12-12','m','Kratonstraat',46,NULL,'8013BD','Meppel','0522526010','E.Mattson@live.nl','REDGH1');
INSERT INTO Lid VALUES (114, 'Ragas','J',NULL,'1980-08-24','m','Frans halsstraat',83,NULL,'8794JU','Meppel','0522487091','J.Ragas@live.nl','REDGH1');
INSERT INTO Lid VALUES (115, 'Stone','H',NULL,'1969-04-23','m','Zuideinde',71,NULL,'8547GX','Meppel','0522890124','H.Stone@live.nl','REDGH1');
INSERT INTO Lid VALUES (116, 'Enden','T','van','1985-03-21','m','Danielsweg',51,NULL,'6500HG','Nijmegen','0247895205','T.Enden@live.nl','MMXXH1');
INSERT INTO Lid VALUES (117, 'Veldhuis','W',NULL,'1984-06-25','m','Tweede walstraat',35,NULL,'6414CE','Nijmegen','0245789023','W.Veldhuis@live.nl','MMXXH1');
INSERT INTO Lid VALUES (118, 'Bartec','V',NULL,'1987-05-23','m','Nonnenstraat',80,NULL,'6701FE','Nijmegen','0248759024','V.Bartec@live.nl','MMXXH1');
INSERT INTO Lid VALUES (119, 'Noorda','Q',NULL,'1988-06-01','m','Willemsweg',4,NULL,'6613CL','Nijmegen','0248209835','Q.Noorda@live.nl','MMXXH1');
INSERT INTO Lid VALUES (120, 'Rats','Y',NULL,'1970-08-09','m','Tollensstraat',8,NULL,'6596TM','Nijmegen','0245253479','Y.Rats@live.nl','MMXXH1');
INSERT INTO Lid VALUES (121, 'Kroes','J',NULL,'1981-10-02','m','Scholekster',46,NULL,'2200AG','Noordwijk','0719802451','J.Kroes@live.nl','MSVLH1');
INSERT INTO Lid VALUES (122, 'Motyssek','E',NULL,'1980-07-12','m','Beeklaan',135,NULL,'2405PR','Noordwijk','0719805274','E.Motyssek@live.nl','MSVLH1');
INSERT INTO Lid VALUES (123, 'Duin','F','van','1980-11-11','m','Zandvoorsestraat',66,NULL,'2273CP','Noordwijk','0718795021','F.Duin@live.nl','MSVLH1');
INSERT INTO Lid VALUES (124, 'Borsato','P',NULL,'1979-12-24','m','Jacobus van der Valkstraat',14,NULL,'2342BB','Noordwijk','0718795027','P.Borsato@live.nl','MSVLH1');
INSERT INTO Lid VALUES (125, 'Kozusznik','C',NULL,'1987-05-12','m','Overbeek',97,NULL,'2048ET','Noordwijk',NULL,'C.Kozusznik@live.nl','MSVLH1');
INSERT INTO Lid VALUES (126, 'Essers','Q',NULL,'1975-02-05','m','Sportlaan',41,NULL,'5244GD','Rosmalen ','0738532613','Q.Essers@live.nl','EIFFH1');
INSERT INTO Lid VALUES (127, 'Winger','E',NULL,'1983-10-15','m','Felix timmermanslaan',87,NULL,'5068BL','Rosmalen ','0735981234','Winger.E@tiscali.nl','EIFFH1');
INSERT INTO Lid VALUES (128, 'Louwe','V',NULL,'1985-06-30','m','Bremhoeven',43,NULL,'5012UI','Rosmalen ','0737513265','Louwe.V@tiscali.nl','EIFFH1');
INSERT INTO Lid VALUES (129, 'Dikken','N',NULL,'1983-01-05','m','Schoolstraat',76,NULL,'5462RT','Rosmalen ','0737120405','Dikken.N@tiscali.nl','EIFFH1');
INSERT INTO Lid VALUES (130, 'Leeuw','R','de','1976-01-05','m','Striensestraat',13,NULL,'5171UL','Rosmalen ',NULL,'Leeuw.R@tiscali.nl','EIFFH1');
INSERT INTO Lid VALUES (131, 'Bateman','F',NULL,'1921-07-24','m','Bellevoysstraat',6,NULL,'3015CX','Rotterdam','0108942917','Bateman.F@tiscali.nl','RCHAH1');
INSERT INTO Lid VALUES (132, 'Santler','A',NULL,'1990-12-11','m','Sonmansstraat',72,NULL,'3315DB','Rotterdam','0108091209','Santler.A@tiscali.nl','RCHAH1');
INSERT INTO Lid VALUES (133, 'Kirves','V',NULL,'1985-03-06','m','Papegaaistraat',14,NULL,'2930WC','Rotterdam','0108951034','Kirves.V@tiscali.nl','RCHAH1');
INSERT INTO Lid VALUES (134, 'Timmer','K.I',NULL,'1976-11-16','m','Nieuwe Binnenweg',65,NULL,'3056JA','Rotterdam','0108750912','Timmer.K.I@tiscali.nl','RCHAH1');
INSERT INTO Lid VALUES (135, 'Hen','R','de','1989-10-12','m','Leopoldstraat',45,NULL,'3161LU','Rotterdam','0108794104','Hen.R@tiscali.nl','RCHAH1');
INSERT INTO Lid VALUES (136, 'Porkka','V',NULL,'1970-05-09','v','Hofstedestraat',17,NULL,'3051BL','Rotterdam','0108958709','Porkka.V@tiscali.nl','CSBRD1');
INSERT INTO Lid VALUES (137, 'Curry','X',NULL,'1980-06-02','v','Sint-Janstraat',84,NULL,'2867LA','Rotterdam',NULL,'Curry.X@tiscali.nl','CSBRD1');
INSERT INTO Lid VALUES (138, 'Vrijens','U',NULL,'1977-05-13','v','Schepenstraat',38,NULL,'2915NC','Rotterdam','0108790410','Vrijens.U@tiscali.nl','CSBRD1');
INSERT INTO Lid VALUES (139, 'Walker','N',NULL,'1987-12-12','v','Banierstraat',10,NULL,'3104HG','Rotterdam','0108790514','Walker.N@tiscali.nl','CSBRD1');
INSERT INTO Lid VALUES (140, 'Dessing','R',NULL,'1984-10-28','v','Aert van Nesstraat',43,NULL,'3068PV','Rotterdam','0107894012','Dessing.R@tiscali.nl','CSBRD1');
INSERT INTO Lid VALUES (141, 'Arends','V',NULL,'1982-08-15','m','Streepenstraat',6,NULL,'5492AA','Sint-Oederode','0413890128','Arends.V@tiscali.nl','ROOIH1');
INSERT INTO Lid VALUES (142, 'Hartog','S',NULL,'1991-06-09','m','Laan ten Bogaerde',85,NULL,'5780NU','Sint-Oederode','0413870922','Hartog.S@tiscali.nl','ROOIH1');
INSERT INTO Lid VALUES (143, 'Waterlander','Y',NULL,'1979-10-10','m','Eerschotsestraat',13,NULL,'5378PI','Sint-Oederode','0413929348','Waterlander.Y@tiscali.nl','ROOIH1');
INSERT INTO Lid VALUES (144, 'Eygenraam','R',NULL,'1986-06-17','m','Scherpakkerstraat',65,NULL,'5681NU','Sint-Oederode','0413879012','Eygenraam.R@tiscali.nl','ROOIH1');
INSERT INTO Lid VALUES (145, 'Bouwman','H',NULL,'1976-05-12','m','Dommelstraat',13,NULL,'5618BL','Sint-Oederode','0413980123','Bouwman.H@tiscali.nl','ROOIH1');
INSERT INTO Lid VALUES (146, 'Tanner','L.P',NULL,'1987-12-29','v','Margrietstraat',76,NULL,'7651CV','Tubbergen','0546890225','Tanner.L.P@tiscali.nl','EURTD1');
INSERT INTO Lid VALUES (147, 'Sobieraj','B',NULL,'1985-02-27','v','Binnenveldsweg',9,NULL,'7454BL','Tubbergen','0546897013','Sobieraj.B@tiscali.nl','EURTD1');
INSERT INTO Lid VALUES (148, 'Peperstraten','D','van','1986-09-14','v','Weleveldstraat',8,NULL,'7543XN','Tubbergen','0546892946','Peperstraten.D@tiscali.nl','EURTD1');
INSERT INTO Lid VALUES (149, 'Mungra','C',NULL,'1989-06-13','v','Oldenzaalseweg',15,NULL,'7652VM','Tubbergen','0546901809','Mungra.C@tiscali.nl','EURTD1');
INSERT INTO Lid VALUES (150, 'Reep','W',NULL,'1987-09-26','v','Ten Polstraat',87,NULL,'7801EU','Tubbergen','0546891304','Reep.W@tiscali.nl','EURTD1');
INSERT INTO Lid VALUES (151, 'Lether','F',NULL,'1989-03-18','v','Amazonedreef',34,NULL,'3581XW','Utrecht','0308793193','Lether.F@tiscali.nl','AAMAD1');
INSERT INTO Lid VALUES (152, 'Hoekstra','S',NULL,'1982-03-02','v','De Rijpstraat',13,NULL,'3591CU','Utrecht','0302874198','Hoekstra.S@tiscali.nl','AAMAD1');
INSERT INTO Lid VALUES (153, 'Titulaer','W',NULL,'1986-02-12','v','Robijnstraat',7,NULL,'3787WR','Utrecht','0308713829','Titulaer.W@tiscali.nl','AAMAD1');
INSERT INTO Lid VALUES (154, 'Eerden','Y','van','1989-09-09','v','Wittevrouwenstraat',9,NULL,'3356UI','Utrecht','0308794192','Eerden.Y@tiscali.nl','AAMAD1');
INSERT INTO Lid VALUES (155, 'Cyrus','N',NULL,'1977-06-06','v','Duifstraat',47,NULL,'2487PO','Utrecht',NULL,'Cyrus.N@tiscali.nl','AAMAD1');
INSERT INTO Lid VALUES (156, 'Licht','V',NULL,'1979-03-15','v','Zuiderstraat',13,NULL,'6006SN','Weert','0495879539','Licht.V@tiscali.nl','UPSTH1');
INSERT INTO Lid VALUES (157, 'Megen','W','van','1986-10-19','m','Maaslandlaan',76,NULL,'6013NU','Weert','0495879163','Megen.W@tiscali.nl','UPSTH1');
INSERT INTO Lid VALUES (158, 'Siertsema','M',NULL,'1983-01-08','m','Molenpoort',24,NULL,'6712RT','Weert','0495780236','Siertsema.M@tiscali.nl','UPSTH1');
INSERT INTO Lid VALUES (159, 'Young','E',NULL,'1990-04-10','m','Nieuwstraat',76,NULL,'5801YU','Weert',NULL,'Young.E@tiscali.nl','UPSTH1');
INSERT INTO Lid VALUES (160, 'Saanten','M','van','1978-06-18','m','Graswinkellaan',45,NULL,'5976CU','Weert','0495902940','Saanten.M@tiscali.nl','UPSTH1');
INSERT INTO Lid VALUES (161, 'Houten','V','van den','1985-02-19','m','Groenestraat',10,NULL,'8011PB','Zwolle','0389870123','Houten.V@tiscali.nl','LABAH1');
INSERT INTO Lid VALUES (162, 'Pleister','R',NULL,'1984-12-17','m','Potgietersingel',49,NULL,'7901EJ','Zwolle','0388742915','Pleister.R@tiscali.nl','LABAH1');
INSERT INTO Lid VALUES (163, 'Samek','E',NULL,'1987-05-13','m','Beukenstraat',26,NULL,'8341KI','Zwolle','0389875094','Samek.E@tiscali.nl','LABAH1');
INSERT INTO Lid VALUES (164, 'Wagenaar','W',NULL,'1985-12-11','m','Esdoornstraat',49,NULL,'8641DO','Zwolle',NULL,'Wagenaar.W@tiscali.nl','LABAH1');
INSERT INTO Lid VALUES (165, 'Nguyen','X',NULL,'1989-10-19','m','Bagijnesingel',75,NULL,'7873CN','Zwolle','0389840930','Nguyen.X@tiscali.nl','LABAH1');
INSERT INTO Lid VALUES (166, 'Roos','W',NULL,'1980-01-14','m','Walstraat',13,NULL,'7936DF','Zwolle','0388759021','Roos.W@tiscali.nl','LABAH2');
INSERT INTO Lid VALUES (167, 'Sleifer','T',NULL,'1974-12-30','m','Sumatrastraat',98,NULL,'7647GA','Zwolle','0389870407','Sleifer.T@tiscali.nl','LABAH2');
INSERT INTO Lid VALUES (168, 'Bakker','E',NULL,'1980-12-13','m','Middelweg',23,NULL,'7785UE','Zwolle','0387813425','Bakker.E@tiscali.nl','LABAH2');
INSERT INTO Lid VALUES (169, 'Kuiper','C',NULL,'1976-04-19','m','Van Mierenveltstraat',87,NULL,'7763UV','Zwolle','0388945109',NULL,'LABAH2');
INSERT INTO Lid VALUES (170, 'Boom','B',NULL,'1990-10-08','m','Hertenstraat',100,NULL,'7281NL','Zwolle',NULL,'Boom.B@tiscali.nl','LABAH2');
INSERT INTO Lid VALUES (201, 'Kroets','K.L','der','1987-12-12','v','Monkkade',1,'bis','1131KM','Volendam','0299757483',NULL,NULL);
INSERT INTO Lid VALUES (208, 'Klink','H','van','1980-08-24','m','Kinderenstraat',1,'bis','1131LM','Volendam','0299475647','HenkKlink@gmail.com ',NULL);
INSERT INTO Lid VALUES (701, 'Bekker','E',NULL,'1969-04-23','v','Commelinstraat',222,NULL,'1130HH','Volendam','0299334455','e.waterman@hva.nl ',NULL);


-- Insert Boetes
INSERT INTO Boete VALUES (3, 112, 'A', '2009-09-09', 8);
INSERT INTO Boete VALUES (4, 130, 'F', '2009-09-09', 4.50);
INSERT INTO Boete VALUES (1, 109, 'F', '2009-09-09', 4.50);
INSERT INTO Boete VALUES (2, 109, 'F', '2009-10-03', 4.50);
INSERT INTO Boete VALUES (5, 201, 'A', '2009-12-08', 11);
INSERT INTO Boete VALUES (6, 208, 'A', '2008-03-05', 8);
INSERT INTO Boete VALUES (7, 201, 'F', '2008-05-27', 4.50);
INSERT INTO Boete VALUES (8, 208, 'F', '2006-01-14', 4.50);
INSERT INTO Boete VALUES (9, 201, 'A', '2006/10/04', 8);
INSERT INTO Boete VALUES (10, 208, 'F', '2002/06/12', 4.50);
INSERT INTO Boete VALUES (11, 208, 'A', '2001/11/04', 11);
INSERT INTO Boete VALUES (12, 201, 'F', '2005/05/05', 4.50);
INSERT INTO Boete VALUES (13, 208, 'A', '2008/03/12', 11);
INSERT INTO Boete VALUES (14, 208, 'F', '2004/02/01', 4.50);
INSERT INTO Boete VALUES (15, 208, 'A', '2005/09/21', 8);
INSERT INTO Boete VALUES (16, 201, 'F', '2007/01/25', 4.50);
INSERT INTO Boete VALUES (17, 208, 'F', '2006/02/04', 4.50);
INSERT INTO Boete VALUES (18, 201, 'A', '2005/01/20', 11);
INSERT INTO Boete VALUES (19, 208, 'A', '2006/04/30', 8);
INSERT INTO Boete VALUES (20, 201, 'F', '2004/09/30', 4.50);


-- Insert Teams Heren eredivisie
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'AMSTH1', 'Amsterdam 1', 'Apollohal', 6);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'EIFFH1', 'EiffelTowers Den Bosch', 'Hazelaar', 128);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'GAFLH1', 'GasTerra Flames', 'Martiniplaza', 53);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'LABAH1', 'Landstede Basketball 1', 'Stilohal', 164);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'WCAAH1', 'World Class Aviation Academy', 'Sporthal Boulevard', 17);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'RCHAH1', 'Rotterdan Challengers', 'Alexanderhal', 132);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'MMXXH1', 'Matrixx Magixx', 'Horstacker', 119);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'UPSTH1', 'Upstairs', 'Boshoven', 160);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'ARISH1', 'De Friesland Aris', 'Kalverdijkje', 89);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B1000', 'ZZLEH1', 'Zorg & Zekerheid Leiden 1', 'Vijf Meihal', 97);

 -- heren promotiedivisie
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'HFFDH1', 'BV Hoofddorp', 'Spectrum', 69);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'CBVBH1', 'CBV Binnenland', 'De Driesprong', 14);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'VBCAH1', 'VBC Akridis', 'IJmuiden Oost', 74);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'ROOIH1', 'BV Rooi', 'De Kienehoef', 144);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'HIFIH1', 'High Five', 'Stadssporthal', 47);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'REDGH1', 'Red Giants', 'Het Vledder', 115);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'ZZLEH2', 'Zorg & Zekerheid Leiden 2', 'Vijf Meihal', 93);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'LABAH2', 'Landstede Basketball 2', 'Stilohal', 167);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'GRUIH1', 'Groene Uilen', 'Struikhal', 58);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'EBBCH2', 'EBBC 2', 'Schutskamp', 35);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'DSBVH1', 'DSBV Punch', 'Sportcentrum TU', 22);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'GOBAH1', 'GOBA', 'Oosterbliek', 43);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'AMSTH2', 'Amsterdam 2', 'Apollohal', 8);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B2000', 'MSVLH1', 'MSV Log in', 'Northgohal', 124);
 -- dames eredivisie
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'STOLD1', 'STOL-Grasshoppers', 'Cleyn Duin', 78);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'PBLid1', 'ProBuild Lions', 'Indoor Centrum', 81);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'EURTD1', 'Eurosped Twente', 'Burg. Verdegaalhal', 149);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'CEDOD1', 'Celeritas-Donar', 'Vinkhuizen', 63);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'AAMAD1', 'AutoCAD Amazone', 'Waterwin', 155);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'DASDD1', 'Woonbron DAS Delft', 'Brasserskade', 30);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'CSBRD1', 'Challenge Sports/Binnenland Rotterdam', 'Alexanderhal', 136);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'HLBAD1', 'HLB Accountants', 'Sportlaan', 36);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'WNLLD1', 'Wereldtickets.nl Leiderdorp', 'De Bloemerd', 103);
insert into Team (klasse, teamcode, teamnaam, thuishal, aanvoerder) values ('B4000', 'LEAMD1', 'BV Lely Amsterdam', 'Apollohal', 2);


 -- wedstrijden heren eredivisie
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-30', '19:30', 2, 'GAFLH1', 'LABAH1', 113, 68);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-03', '20:00', 3, 'RCHAH1', 'MMXXH1', 64, 76);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-03', '20:00', 4, 'AMSTH1', 'UPSTH1', 76, 54);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-03', '20:00', 1, 'ARISH1', 'ZZLEH1', 76, 78);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-04', '15:00', 2, 'WCAAH1', 'EIFFH1', 81, 60);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-06', '20:00', 1, 'UPSTH1', 'RCHAH1', 80, 63);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-08', '20:00', 3, 'EIFFH1', 'AMSTH1', 92, 68);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-08', '19:30', 1, 'MMXXH1', 'ZZLEH1', 62, 63);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-08', '20:00', 2, 'ARISH1', 'GAFLH1', 66, 76);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-08', '19:30', 2, 'LABAH1', 'WCAAH1', 65, 96);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-10', '19:30', 1, 'GAFLH1', 'MMXXH1', 89, 68);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-10', '20:30', 2, 'ZZLEH1', 'UPSTH1', 97, 81);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-10', '20:00', 1, 'RCHAH1', 'EIFFH1', 44, 74);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-10', '20:00', 3, 'AMSTH1', 'WCAAH1', 74, 80);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-10', '20:00', 2, 'ARISH1', 'LABAH1', 76, 68);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-13', '20:00', 1, 'UPSTH1', 'GAFLH1', 68, 77);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-14', '20:00', 3, 'WCAAH1', 'RCHAH1', 97, 65);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-15', '19:30', 1, 'MMXXH1', 'ARISH1', 67, 77);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-15', '19:30', 2, 'LABAH1', 'AMSTH1', 50, 68);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '19:30', 2, 'GAFLH1', 'EIFFH1', 93, 82);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '20:30', 4, 'ZZLEH1', 'WCAAH1', 61, 64);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '19:30', 2, 'MMXXH1', 'LABAH1', 77, 74);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '20:00', 2, 'ARISH1', 'UPSTH1', 78, 82);


 -- wedstrijden heren promotiedivisie
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-26', '16:30', 3, 'DSBVH1', 'MSVLH1', 62, 64);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-26', '19:00', 1, 'VBCAH1', 'ZZLEH2', 69, 89);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-26', '18:00', 2, 'GOBAH1', 'CBVBH1', 66, 78);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-26', '18:00', 2, 'HIFIH1', 'GRUIH1', 48, 51);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-26', '20:00', 4, 'REDGH1', 'HFFDH1', 89, 81);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-09-27', '18:00', 1, 'ROOIH1', 'LABAH2', 79, 92);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-02', '21:00', 3, 'HFFDH1', 'HIFIH1', 81, 85);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-03', '16:00', 2, 'LABAH2', 'REDGH1', 77, 81);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-03', '20:45', 1, 'CBVBH1', 'VBCAH1', 95, 62);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-04', '18:30', 2, 'GRUIH1', 'GOBAH1', 48, 56);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-04', '20:00', 3, 'ZZLEH2', 'AMSTH2', 56, 65);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-04', '13:30', 2, 'MSVLH1', 'ROOIH1', 77, 90);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '16:30', 3, 'DSBVH1', 'ZZLEH2', 69, 62);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '12:00', 1, 'AMSTH2', 'CBVBH1', 80, 79);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '19:00', 3, 'VBCAH1', 'GRUIH1', 79, 83);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-17', '20:00', 1, 'REDGH1', 'ROOIH1', 88, 57);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-18', '14:00', 2, 'GOBAH1', 'HFFDH1', 89, 104);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-18', '16:00', 2, 'LABAH2', 'HIFIH1', 54, 67);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-23', '21:00', 3, 'HFFDH1', 'VBCAH1', 73, 66);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-24', '20:15', 2, 'CBVBH1', 'DSBVH1', 78, 66);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-10-24', '20:00', 1, 'MSVLH1', 'REDGH1', 85, 70);

-- wedstrijden dames eredivisie
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-05', '20:30', 4, 'AAMAD1', 'WNLLD1', 56, 63);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-05', '14:00', 3, 'CSBRD1', 'STOLD1', 78, 65);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-06', '14:00', 3, 'PBLid1', 'DASDD1', 100, 78);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-06', '19:30', 1, 'CEDOD1', 'LEAMD1', 64, 80);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-06', '16:30', 2, 'EURTD1', 'HLBAD1', 81, 73);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-12', '19:00', 1, 'HLBAD1', 'CSBRD1', 58, 74);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-12', '20:15', 3, 'STOLD1', 'AAMAD1', 92, 81);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-12', '20:30', 2, 'WNLLD1', 'CEDOD1', 81, 78);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-12', '20:30', 1, 'LEAMD1', 'PBLid1', 61, 66);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-12', '17:00', 1, 'DASDD1', 'EURTD1', 59, 78);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2009-12-19', '20:30', 3, 'LEAMD1', 'STOLD1', 76, 65);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2010-01-09', '19:30', 1, 'PBLid1', 'WNLLD1', 98, 81);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2010-01-09', '20:30', 2, 'CEDOD1', 'STOLD1', 88, 88);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2010-01-09', '17:00', 2, 'CSBRD1', 'EURTD1', 66, 76);
insert into Wedstrijd (datum, tijd, veld, teamthuis, teamuit, scorethuis, scoreuit) values ('2010-01-09', '20:30', 2, 'LEAMD1', 'DASDD1', 112, 104);

INSERT INTO BestuursFunctie VALUES ('Voorzitter','2007-01-01','2009-12-31',108);
INSERT INTO BestuursFunctie VALUES ('Secretaris','2007-01-01','2012-12-31',107);
INSERT INTO BestuursFunctie VALUES ('Lid1','2008-01-01','2008-12-31',64);
INSERT INTO BestuursFunctie VALUES ('Penningmeester','2009-01-01','2013-12-31',114);
INSERT INTO BestuursFunctie VALUES ('Voorzitter','2010-01-01',NULL,114);
INSERT INTO BestuursFunctie VALUES ('Penningmeester','2014-01-01','2016-12-31',133);
INSERT INTO BestuursFunctie VALUES ('Secretaris','2013-01-01',null,111);

ALTER TABLE Lid
ADD CONSTRAINT Lid_speelt_in_Team_fk
  FOREIGN KEY (speelt_in) REFERENCES Team (teamcode);
