SELECT
  dateRep,
  SUM(cases) as TotalCases
FROM
  CaseData
WHERE
  countryterritoryCode = 'GBR' 
GROUP BY
  dateRep
ORDER BY
  strftime('%Y-%m-%d', SUBSTR(dateRep, 7, 4) || '-' || SUBSTR(dateRep, 4, 2) || '-' || SUBSTR(dateRep, 1, 2));
