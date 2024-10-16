CREATE TABLE CountryInfo (
  countryterritoryCode TEXT PRIMARY KEY,
  countriesAndTerritories TEXT,
  popData2020 INTEGER,
  continentExp TEXT
);

CREATE TABLE DateInfo (
  dateRep TEXT PRIMARY KEY,
  day INTEGER,
  month INTEGER,
  year INTEGER
);


CREATE TABLE CaseData (
  countryterritoryCode TEXT ,
  dateRep TEXT,
  cases INTEGER,
  deaths INTEGER,
  PRIMARY KEY
(countryterritoryCode,dateRep)
);

