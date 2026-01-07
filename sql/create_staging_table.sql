-- =====================================================
-- Create staging table for standardized eDiscovery load files
-- =====================================================

IF OBJECT_ID('dbo.staging_load_files', 'U') IS NOT NULL
    DROP TABLE dbo.staging_load_files;
GO

CREATE TABLE dbo.staging_load_files (
    DocID        BIGINT          NOT NULL,
    Custodian    NVARCHAR(200)   NULL,
    FileType     NVARCHAR(50)    NULL,
    DateCreated  DATE            NULL,
    MD5Hash      CHAR(32)        NULL,
    SourceFile   NVARCHAR(260)   NULL,
    IsPrivileged BIT             NOT NULL DEFAULT (0)
);
GO

