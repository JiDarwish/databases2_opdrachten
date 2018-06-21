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



-- invullen vleigtuig tabel
INSERT INTO Vliegtuig
VALUES
  ('F50-685-3', 2, 'Fokker F50'),
  ('B74-612-3', 12, 'Boeing 747'),
  ('F50-763-2', 2, 'Fokker F50'),
  ('B74-243-10', null, 'Boeing 747'),
  ('B70-462-7', null, 'Boeing 707'),
  ('F50-476-5', null, 'Fokker F50'),
  ('B70-357-7', null, 'Boeing 707');


-- invullen klassepassagiersvliegtuig tabel
INSERT INTO klassevliegtuig
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
  ('NS012', '2014-12-12', null, 10000, 'vrachten', 'B74-243-10'),
  ('NS034', '2014-12-12', null, 4800, 'vrachten', 'B70-462-7'),
  ('NS015', '2014-12-14', null, 2100, 'vrachten', 'F50-476-5'),
  ('NS121', '2014-12-15', null, 2400, 'vrachten', 'F50-476-5'),
  ('NS034', '2014-12-19', null, 6300, 'vrachten', 'B70-357-7'),
  ('NS212', '2014-12-10', 36, null, 'passagiers', 'F50-685-3'),
  ('NS334', '2014-12-12', 102, null, 'passagiers', 'B74-612-3'),
  ( 'NS212', '2014-12-14', 0, null, 'passagiers', 'F50-763-2'),
  ( 'NS212', '2014-12-17', 0, null, 'passagiers', 'F50-685-3');