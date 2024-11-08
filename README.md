# COVID Data Management Project

## Overview
This project involves managing COVID-19 data using relational databases. The data is modelled and analyzed using SQLite and follows the principles of data normalization, including 1st, 2nd, 3rd Normal Forms, and Boyce-Codd Normal Form (BCNF). The main tasks include creating relations, defining functional dependencies, decomposing relations, and performing various SQL queries to analyze the data.

**Author**: Theodoulos Hadjilambrou  
**Student ID**: 34200134  
**Date**: April 2024

## Relational Model

### Dataset Schema
The relational schema for the dataset is defined as follows:

| Attribute Name            | Data Type   |
|---------------------------|-------------|
| dateRep                   | TEXT        |
| day                       | INTEGER     |
| month                     | INTEGER     |
| year                      | INTEGER     |
| cases                     | INTEGER     |
| deaths                    | INTEGER     |
| countriesAndTerritories   | TEXT        |
| geoId                     | TEXT        |
| countryterritoryCode      | TEXT        |
| popData2020               | INTEGER     |
| continentExp              | TEXT        |

### Functional Dependencies
- **countryterritoryCode ↔ countriesAndTerritories**: Bijective relationship.
- **countryterritoryCode ↔ geoId**: Bijective relationship.
- **countryterritoryCode → popData2020, continentExp**: Unique per country.
- **dateRep → day, month, year**: Date decomposition.
- **countriesAndTerritories + dateRep → cases, deaths**: Event-based reporting.

### Candidate Key
- **[countryterritoryCode, dateRep]**: This combination is selected as the primary key for its consistency, efficiency, and uniqueness.

## Data Normalization

### Partial-Key Dependencies
Partial-key dependencies were identified in the dataset, particularly involving **popData2020** and **continentExp**, which are dependent only on **countryterritoryCode** but not on **dateRep**. The **day**, **month**, and **year** attributes are solely dependent on **dateRep**.

### Decomposition for 2nd Normal Form
The dataset was decomposed to achieve 2nd Normal Form:
- **Country Info**: Attributes include countryTerritoryCode, popData2020, continentExp, geoID, and countriesAndTerritories.
- **Date Attributes**: Attributes include dateRep, day, month, year.
- **Case Data**: Attributes include countryTerritoryCode, dateRep, cases, deaths.

### Boyce-Codd Normal Form (BCNF)
The relations were further decomposed and analyzed to ensure BCNF compliance. All functional dependencies have candidate keys as their determinants, meaning the data is in BCNF.

## SQL Implementation

### Database Creation and Data Import
1. **SQLite Database Creation**:
    ```bash
    sqlite3 coronavirus.db
    ```
2. **CSV Data Import**:
    ```sql
    .mode csv
    .import '/path/to/dataset.csv' dataset
    ```
3. **Data Export**:
    ```sql
    .output dataset.sql
    .dump dataset
    ```
4. **DataGrip Connection**: The database was connected to DataGrip for further analysis.

### SQL Table Creation
- **CountryInfo Table**: Stores country-specific information.
  ```sql
  CREATE TABLE CountryInfo (
      countryterritoryCode TEXT PRIMARY KEY,
      countriesAndTerritories TEXT,
      popData2020 INTEGER,
      continentExp TEXT
  );
  ```

- **DateInfo Table**: Stores date information.
  ```sql
  CREATE TABLE DateInfo (
      dateRep TEXT PRIMARY KEY,
      day INTEGER,
      month INTEGER,
      year INTEGER
  );
  ```

- **CaseData Table**: Stores case and death data.
  ```sql
  CREATE TABLE CaseData (
      countryterritoryCode TEXT,
      dateRep TEXT,
      cases INTEGER,
      deaths INTEGER,
      PRIMARY KEY (countryterritoryCode, dateRep)
  );
  ```

### Data Manipulation and Querying
- **Data Insertion**: Data was inserted into the newly created tables using SQL commands.
- **Data Queries**: Various queries were executed to analyze the data, such as:
  - **Total Cases and Deaths**:
    ```sql
    SELECT SUM(cases) AS TotalCases, SUM(deaths) AS TotalDeaths FROM CaseData;
    ```
  - **Daily Cases in the UK**:
    ```sql
    SELECT dateRep, SUM(cases) AS TotalCases FROM CaseData WHERE countryterritoryCode = 'GBR' GROUP BY dateRep ORDER BY dateRep;
    ```
  - **Top 10 Countries by Death Percentage**:
    ```sql
    SELECT CountryInfo.countriesAndTerritories, ROUND((SUM(CaseData.deaths) * 100.0 / SUM(CaseData.cases)), 2) AS DeathPercentage FROM CaseData JOIN CountryInfo ON CaseData.countryterritoryCode = CountryInfo.countryterritoryCode GROUP BY CountryInfo.countriesAndTerritories ORDER BY DeathPercentage DESC LIMIT 10;
    ```

## Contact
For further information or questions, please reach out to Theodoulos Hadjilambrou.

---

This README provides an overview of the project, covering the dataset schema, data normalization process, SQL implementation, and contact details. Let me know if you need further modifications or additional details!

