%%sql
postgresql:///international_debt
    SELECT *
    FROM international_debt
    limit 10;

%%sql
SELECT 
    COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;

%%sql
    SELECT
    DISTINCT indicator_code AS distinct_debt_indicators
    FROM international_debt
    ORDER BY distinct_debt_indicators

%%sql
SELECT 
    ROUND(COUNT(debt/1000), 2) AS total_debt
FROM international_debt;

%%sql
SELECT 
    country_name, 
    ROUND(COUNT(debt/1000), 2) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt 
limit 1;

%%sql
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
limit 10;

%%sql
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM international_debt
             WHERE indicator_code ='DT.AMT.DLXF.CD');

%%sql
SELECT
    indicator_code,
    COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

%%sql
SELECT 
    country_name, 
    MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10;

