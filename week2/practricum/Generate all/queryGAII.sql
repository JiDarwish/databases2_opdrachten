SELECT type, SUM(lading)
FROM VrachtenVlucht vlucht
  JOIN vliegtuig vlieg ON  vlieg.registratieNr = vlucht.registratieNr
WHERE type = "Fokker F50";

-- NOTE Not joining with intermidiate VrachtenVliegtuig cause it makes no sense