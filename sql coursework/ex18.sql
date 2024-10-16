SELECT
  CountryInfo.countriesAndTerritories,
  ROUND((SUM(CaseData.deaths) * 100.0 / SUM(CaseData.cases)), 2) AS DeathPercentage
FROM
  CaseData
JOIN
  CountryInfo ON CaseData.countryterritoryCode = CountryInfo.countryterritoryCode
GROUP BY
  CountryInfo.countriesAndTerritories
ORDER BY
  DeathPercentage DESC
LIMIT
  10;
