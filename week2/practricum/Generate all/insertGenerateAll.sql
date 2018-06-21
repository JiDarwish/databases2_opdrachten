-- Klasse tabel invullen
INSERT INTO klasse
VALUES
  ('Business'),
  ('Economie'),
  ('First');


-- vliegtuigtype tabel invullen
INSERT INTO vliegtuigtype
VALUES
  ('Boeing 747', 10000),
  ('Boeing 707', 7000),
  ('Fokker F50', 2500);


---- Invullen vliegtuig tabel
INSERT INTO vliegtuig
VALUES
  ('F50-685-3', 'Fokker F50'),
  ('B74-612-3', 'Boeing 747'),
  ('F50-763-2', 'Fokker F50'),
  ('B74-243-10', 'Boeing 747'),
  ('B70-462-7', 'Boeing 707'),
  ('F50-476-5', 'Fokker F50'),
  ('B70-357-7', 'Boeing 707');

-- invullen vrachtvliegtuig tabel
INSERT INTO vrachtenvliegtuig
VALUES
  ('B74-243-10'),
  ('B70-462-7'),
  ('F50-476-5'),
  ('B70-357-7');

-- invullen passagiersvliegtuig tabel
INSERT INTO passagiersvliegtuig
VALUES
  (2, 'F50-685-3'),
  (12, 'B74-612-3'),
  (2, 'F50-763-2');


-- invullen klassepassagiersvliegtuig tabel
INSERT INTO klassepassagiersvliegtuig
  (klasse, registratieNr, aantalStoelen)
VALUES
  ('Economie', 'F50-685-3', 50),
  ('Economie', 'B74-612-3', 273),
  ('Business', 'B74-612-3', 52),
  ('First', 'B74-612-3', 16),
  ('Economie', 'F50-763-2', 40),
  ('Business', 'F50-763-2', 10);


-- invullen vlucht tabel
INSERT INTO vlucht
VALUES
  ('NS012', '2014-12-12'),
  ('NS034', '2014-12-12'),
  ('NS015', '2014-12-14'),
  ('NS121', '2014-12-15'),
  ('NS034', '2014-12-19'),
  ('NS212', '2014-12-10'),
  ('NS334', '2014-12-12'),
  ('NS212', '2014-12-14'),
  ('NS212', '2014-12-17');



-- invullen vrachtenvlucht table
INSERT INTO vrachtenvlucht
VALUES
  (10000, 'NS012', '2014-12-12', 'B74-243-10'),
  (4800, 'NS034', '2014-12-12', 'B70-462-7'),
  (2100, 'NS015', '2014-12-14', 'F50-476-5'),
  (2400, 'NS121', '2014-12-15', 'F50-476-5'),
  (6300, 'NS034', '2014-12-19', 'B70-357-7');


-- invullen passagiersvlucht tabel
INSERT INTO passagiersvlucht
VALUES
  (36, 'NS212', '2014-12-10', 'F50-685-3'),
  (102, 'NS334', '2014-12-12', 'B74-612-3'),
  (0, 'NS212', '2014-12-14', 'F50-763-2'),
  (0, 'NS212', '2014-12-17', 'F50-685-3');
  