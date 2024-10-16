SELECT
  CountryInfo.countriesAndTerritories,
  CaseData.dateRep,
  CaseData.cases,
  CaseData.deaths
FROM
  CaseData
JOIN
  CountryInfo ON CaseData.countryterritoryCode = CountryInfo.countryterritoryCode
ORDER BY
  CountryInfo.countriesAndTerritories,
  strftime('%Y-%m-%d', SUBSTR(CaseData.dateRep, 7, 4) || '-' || SUBSTR(CaseData.dateRep, 4, 2) || '-' || SUBSTR(CaseData.dateRep, 1, 2));
