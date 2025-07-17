-- standard select / where / order by
SELECT
    ps.PatientId
    , ps.Hospital
    , PS.Ward
    , ps.AdmittedDate
    , ps.DischargeDate
    , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , DATEADD(WEEK, 2, ps.AdmittedDate) AS ReminderDate
    , ps.Tariff
FROM PatientStay ps
WHERE ps.Hospital IN ('Kingston', 'PRUH')
AND ps.Ward LIKE '%Surgery'
AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
AND ps.Tariff > 5
ORDER BY
    ps.AdmittedDate DESC,
    ps.PatientId DESC


    SELECT
    ps.PatientId
    ,ps.AdmittedDate
    , ps.Hospital
    ,h.Hospital
    ,h.HospitalSize
FROM PatientStay ps LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital


SELECT
    p.PropertyType
    ,COUNT(*) AS NumberOfSales
FROM
    PricePaidSW12 p
GROUP BY p.PropertyType
ORDER BY NumberOfSales DESC;

SELECT
    YEAR(p.TransactionDate) AS TheYear
    ,COUNT(*) AS NumberOfSales
    , SUM(p.Price) /1000000.0 As MarketValue
FROM
    PricePaidSW12 p
GROUP BY YEAR(p.TransactionDate)
ORDER BY TheYear;


-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road (a street in SW12)
SELECT
    p.TransactionDate
    ,p.Price
    ,p.Street
    ,p.County
    ,p.PropertyType
FROM
    PricePaidSW12 p
WHERE
    p.Street in('Midmoor road','Cambray Road')
    AND p.Price >= 400000 
    AND p.TransactionDate BETWEEN '2017-01-01' AND '2018-12-31'
    AND p.PropertyType='T'
ORDER BY p.TransactionDate;

--select sum(price)

--FROM
--(
select top 25
    TransactionDate
    ,p.Price
    ,p.postcode
    ,p.PAON
    ,pl.PropertyTypeName

from    
    PricePaidSW12 p
    left join PropertyTypeLookup pl on p.PropertyType=pl.PropertyTypeCode

WHERE
    p.street='ormeley road'

order BY
    TransactionDate
--) a




