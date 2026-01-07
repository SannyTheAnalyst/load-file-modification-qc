\
/* =========================================================
   Script: load_streams.sql
   Purpose: Load standardized CSVs into staging (3 streams)
   Option A (Recommended): Use SSMS Import Flat File for each CSV
   Option B: Use BULK INSERT with literal file paths (below)
   ========================================================= */

-- Clean slate
TRUNCATE TABLE dbo.staging_load_files;

-- Option A (Recommended):
-- SSMS -> right-click database -> Tasks -> Import Flat File
-- Import each file and append into dbo.staging_load_files.
-- Ensure column mapping matches:
-- DocID, Custodian, FileType, DateCreated, MD5Hash, SourceFile

/* Option B: BULK INSERT (requires file paths accessible to SQL Server service)
   1) Copy the three standardized CSVs into C:\Temp\
   2) Update paths below if needed
*/

BULK INSERT dbo.staging_load_files
FROM 'C:\Temp\standardized_load_A.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);

BULK INSERT dbo.staging_load_files
FROM 'C:\Temp\standardized_load_B.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);

BULK INSERT dbo.staging_load_files
FROM 'C:\Temp\standardized_load_C.csv'
WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', TABLOCK);

-- Quick validation: counts per stream
SELECT SourceFile, COUNT(*) AS RecordCount
FROM dbo.staging_load_files
GROUP BY SourceFile
ORDER BY SourceFile;
