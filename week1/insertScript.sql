INSERT INTO gebouw
  (code, locatie)
VALUES
  ('AMS', 'Damrak'),
  ('ROT', 'Coolsingel');

INSERT INTO afdeling
  (code, naam, onderafdelingVan, locatie)
VALUES
  ('INK', 'Inkoop', NULL, 'AMS'),
  ('INK/1', 'Inkoop non-food', 'INK', 'AMS'),
  ('INK/11', 'Inkoop non-food azie', 'INK/1', 'AMS'),
  ('INK/2', 'Inkoop food', 'INK', 'ROT');


INSERT INTO werknemer
  (voorletters, achternaam, beginAfdeling, werkAfdeling)
VALUES
  ('J', 'Bot', 'INK/2', 'INK'),
  ('A', 'Mans', 'INK/11', 'INK/1'),
  ('K', 'Smit', 'INK/1', 'INK/1'),
  ('Z', 'Zwart', 'INK/2', 'INK/11'),
  ('L', 'Los', NULL, 'INK/11'),
  ('H', 'Los', 'INK/2', 'INK/2'),
  ('G', 'Boers', 'INK/2', 'INK/2'),
  ('M', 'Poot', NULL, 'INK/2');

INSERT INTO werknemerafdeling
  (personeelnummer, afdelingCode, startDatum, eindDatum)
VALUES
  (1, 'INK', '2008-01--1', NULL),
  (2, 'INK/1', '2015-01-01', NULL),
  (3, 'INK/1', '2014-01-01', '2014-12-31'),
  (6, 'INK/1', '2008-01-01', '2013-12-31'),
  (4, 'INK/11', '2014-01-01', NULL),
  (2, 'INK/11', '2008-01-01', '2013-12-31'),
  (6, 'INK/2', '2008-01-01', NULL);