INSERT INTO CountryInfo (countryterritoryCode, countriesAndTerritories, popData2020, continentExp)
SELECT DISTINCT countryterritoryCode, countriesAndTerritories, popData2020, continentExp
FROM dataset;


INSERT INTO CaseData (countryterritoryCode, dateRep, cases, deaths)
SELECT DISTINCT countryterritoryCode, dateRep, cases, deaths
FROM dataset;


INSERT INTO DateInfo (dateRep, day, month, year)
SELECT DISTINCT dateRep, day, month, year
FROM dataset;