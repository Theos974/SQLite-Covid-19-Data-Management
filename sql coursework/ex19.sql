SELECT
  dateRep,
  SUM(cases) OVER (ORDER BY strftime('%Y-%m-%d', SUBSTR(dateRep, 7, 4) || '-' || SUBSTR(dateRep, 4, 2) || '-' || SUBSTR(dateRep, 1, 2))) AS CumulativeCases,
  SUM(deaths) OVER (ORDER BY strftime('%Y-%m-%d', SUBSTR(dateRep, 7, 4) || '-' || SUBSTR(dateRep, 4, 2) || '-' || SUBSTR(dateRep, 1, 2))) AS CumulativeDeaths
FROM
  CaseData
WHERE
  countryterritoryCode = 'GBR'
ORDER BY
  strftime('%Y-%m-%d', SUBSTR(dateRep, 7, 4) || '-' || SUBSTR(dateRep, 4, 2) || '-' || SUBSTR(dateRep, 1, 2));