/* =========================================================
   Script: validation_queries.sql
   Purpose: QC validation across multiple load streams
   ========================================================= */

-- 1) Record counts per source stream
SELECT SourceFile, COUNT(*) AS RecordCount
FROM dbo.staging_load_files
GROUP BY SourceFile
ORDER BY SourceFile;

-- 2) Required field validation (missing key fields)
SELECT SourceFile, COUNT(*) AS MissingFields
FROM dbo.staging_load_files
WHERE DocID IS NULL
   OR Custodian IS NULL OR LTRIM(RTRIM(Custodian)) = ''
   OR FileType IS NULL OR LTRIM(RTRIM(FileType)) = ''
   OR DateCreated IS NULL
   OR MD5Hash IS NULL OR LTRIM(RTRIM(MD5Hash)) = ''
GROUP BY SourceFile
ORDER BY SourceFile;

-- 3) Invalid file types
SELECT SourceFile, FileType, COUNT(*) AS Cnt
FROM dbo.staging_load_files
WHERE LOWER(FileType) NOT IN ('pdf','msg','docx','xlsx','pptx','jpg','png','txt')
GROUP BY SourceFile, FileType
ORDER BY SourceFile, Cnt DESC;

-- 4) Duplicate detection within and across streams (hash-based)
SELECT MD5Hash, COUNT(*) AS DupCount
FROM dbo.staging_load_files
WHERE MD5Hash IS NOT NULL AND LTRIM(RTRIM(MD5Hash)) <> ''
GROUP BY MD5Hash
HAVING COUNT(*) > 1
ORDER BY DupCount DESC;

-- 5) Mismatched field patterns (basic examples)
-- a) Non-hex hashes
SELECT SourceFile, COUNT(*) AS NonHexHash
FROM dbo.staging_load_files
WHERE MD5Hash IS NOT NULL
  AND MD5Hash LIKE '%[^0-9a-f]%'
GROUP BY SourceFile;

-- b) Unexpected DocID range (example rule; adjust as needed)
SELECT SourceFile, MIN(DocID) AS MinDocID, MAX(DocID) AS MaxDocID
FROM dbo.staging_load_files
GROUP BY SourceFile
ORDER BY SourceFile;
