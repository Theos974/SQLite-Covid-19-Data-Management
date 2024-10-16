SELECT CountryInfo.countriesAndTerritories,
       ROUND((SUM(CaseData.cases) * 100.0) / CountryInfo.popData2020, 2)  AS CasesPercentage,
       ROUND((SUM(CaseData.deaths) * 100.0) / CountryInfo.popData2020, 2) AS DeathsPercentage

FROM CaseData
         JOIN
     CountryInfo ON CaseData.countryterritoryCode = CountryInfo.countryterritoryCode
GROUP BY
    CountryInfo.countriesAndTerritories