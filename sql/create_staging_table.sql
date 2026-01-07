/* =========================================================
   Project 2: Load File Modification & Multi-Stream Validation
   DB: SQL Server (SSMS)
   Script: create_staging_table.sql
   ========================================================= */

IF OBJECT_ID('dbo.staging_load_files', 'U') IS NOT NULL DROP TABLE dbo.staging_load_files;
GO

CREATE TABLE dbo.staging_load_files (
    DocID      BIGINT        NULL,
    Custodian  NVARCHAR(100) NULL,
    FileType   NVARCHAR(20)  NULL,
    DateCreated DATE         NULL,
    MD5Hash    CHAR(32)      NULL,
    SourceFile NVARCHAR(50)  NOT NULL
);
GO

CREATE INDEX IX_staging_SourceFile ON dbo.staging_load_files (SourceFile);
CREATE INDEX IX_staging_MD5Hash ON dbo.staging_load_files (MD5Hash);
GO
