-- NULLS exercise
 
/*
 * Add a WHERE clause to the SQL query below to filter to those patients for whom ethnicity is not known  
*/
SELECT
    ps.PatientId
    , ps.Ethnicity
FROM
    PatientStay ps 
    
where ethnicity is null;
 
/*
 * Improve the SQL query below so that the values of the EthnicityIsNull calculated column is 'Not Known' rather than NULL
 * Use the ISNULL() function
*/
SELECT
    ps.PatientId
    , ps.Ethnicity
    , ISNULL(ps.ethnicity,'Not Known') AS EthnicityIsNull
FROM
    PatientStay ps ;
 
/*
 * Improve the SQL query below so that the values of the EthnicityCoalesce calculated column is 'Not Known' rather than NULL
 * Use the COALESCE() function
*/
SELECT
    ps.PatientId
    , ps.Ethnicity
    , COALESCE(Ethnicity,'Not Known') AS EthnicityCoalesce
FROM
    PatientStay ps ;
 
/*
 * Summarise the PatientStay table in a query that returns one row and two columns named:
 * NumberOfPatients
 * NumberOfPatientsWithKnownEthnicity
*/
SELECT
    count(ps.PatientId) as [NumberOfPatients]
    , sum(CASE WHEN Ethnicity IS NOT NULL THEN 1 ELSE 0 END) [NumberOfPatientsWithKnownEthnicity]
FROM
    PatientStay ps 
    
